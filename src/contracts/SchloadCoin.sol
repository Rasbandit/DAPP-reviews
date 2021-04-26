pragma solidity ^0.6.0;

contract SchloadCoin {
    string public constant name = "Schload Coin";
    string public constant symbol = "SCHD";
    uint256 public totalSupply = 100000; // 1 million tokens
    uint8 public constant decimals = 2;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    mapping(address => uint256) public balanceOf;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function totalSupply() public view returns (uint256) {
      return totalSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
