pragma solidity ^0.6.0;

contract SchloadCoin {
    string public constant name = "Schload Coin";
    string public constant symbol = "SCHD";
    uint256 public totalSupply_ = 1000000000000000; // 1 million tokens
    uint8 public constant decimals = 9;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(
        address indexed tokenOwner,
        address indexed spender,
        uint256 tokens
    );

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) allowed;

    constructor() public {
        balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return allowed[owner][spender];
    }

    function approve(address authorizedAddress, uint256 numTokens)
        public
        returns (bool)
    {
        allowed[msg.sender][authorizedAddress] = numTokens;
        emit Approval(msg.sender, authorizedAddress, numTokens);
        return true;
    }

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balances[msg.sender] >= value);
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address owner,
        address buyer,
        uint256 numTokens
    ) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] -= numTokens;
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
        balances[buyer] = balances[buyer] + numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
