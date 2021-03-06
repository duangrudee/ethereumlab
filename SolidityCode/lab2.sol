pragma solidity ^0.4.11;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping (address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);

    function MyToken(
        uint256 initialSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol
    ) {
        balanceOf[msg.sender] = initialSupply;       
        totalSupply = initialSupply;                        
        name = tokenName;                                   
        symbol = tokenSymbol;                               
        decimals = decimalUnits;                            
    }

 function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);      
        require(balanceOf[_from] >= _value);         
        require(balanceOf[_to] + _value > balanceOf[_to]);
        balanceOf[_from] -= _value;                         
        balanceOf[_to] += _value;                         
        Transfer(_from, _to, _value); // inform the wallet
 }

 function transfer(address _to, uint256 _value) {
        _transfer(msg.sender, _to, _value);
    }
  
}
