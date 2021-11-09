contract Ownable {
  address public owner;



  function Ownablee() public {
    owner = msg.sender;
  }


 
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) public {
    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }

}
