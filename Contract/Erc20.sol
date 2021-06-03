pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract OwnersERC20 is 
ERC20
{

    // address of the owner
    address private owner;
    
    // checks weather the caller is the owner or not
    modifier isOwner(address _address){
        require(_address == owner, "FinalERC20: Only owner allowed!");
        _;
    }
    
    /* @dev Initalizes the total supply and some meta
    details of the token
    */
    constructor(string memory _name, string memory _symbol, uint _initialSupply) ERC20(_name, _symbol)
    {
        owner = msg.sender;    
        _mint(owner, _initialSupply*(10**18));
    }
    
    
    /* @dev mint new tokens in the owners
    account
    */
    function mint(uint _amount)
    public 
    isOwner(msg.sender)
    {
        _mint(msg.sender, _amount);
    }
    
    
    /*@dev burn the tokens from the owners 
    account
    */
    function burn(uint _amount)
    public 
    isOwner(msg.sender)
    {
        _burn(msg.sender, _amount);
    }
}