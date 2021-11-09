contract ArtTokenRegistry {
   


    event DigitalIssuance(address owner, uint256 DigitalConstructId, uint256 barcodeNumber, string _nameOfArtist, 
	string _nameOfArtPiece, string _sizeOfArtPiece);


    event Transfer(address from, address to, uint256 tokenId);

  


    struct UAT {
        
        uint256 barcodeNumber;
        uint64 dateOfIssue;
        string nameOfArtist;
        string nameOfArtPiece;
        string sizeOfArtPiece;
        
    }

  
    uint256 public secondsPerBlock = 15;

    
    UAT[] arttokens;

    
    mapping (uint256 => address) public UATIndexToOwner;


    mapping (address => uint256) ownershipTokenCount;

  
    mapping (uint256 => address) public UATIndexToApproved;


    

    
    function _transfer(address _from, address _to, uint256 _tokenId) public {
       
        ownershipTokenCount[_to]++;
        
        UATIndexToOwner[_tokenId] = _to;
        
        if (_from != address(0)) {
            ownershipTokenCount[_from]--;
            
        
            delete UATIndexToApproved[_tokenId];
        }
        
        Transfer(_from, _to, _tokenId);
    }

   
    /// @param _barcodeNumber original
    /// @param _owner address
    /// @param _nameOfArtist location
    function _createUAT(
        uint256 _barcodeNumber,
        address _owner,
        string _nameOfArtist,
        string _nameOfArtPiece,
        string _sizeOfArtPiece
    )
        public
        returns (uint)
    {

       
      

        UAT memory _UAT = UAT({
            barcodeNumber: _barcodeNumber,
            dateOfIssue: uint64(now),
            nameOfArtist: _nameOfArtist,
            nameOfArtPiece:  _nameOfArtPiece,
            sizeOfArtPiece: _sizeOfArtPiece
            
        });
        uint256 newDigitalConstructId = arttokens.push(_UAT) - 1;

    
        require(newDigitalConstructId == uint256(uint32(newDigitalConstructId)));

       
        DigitalIssuance(
            _owner,
            newDigitalConstructId,
            _UAT.barcodeNumber,
            _nameOfArtist,
            _nameOfArtPiece,
            _sizeOfArtPiece
            
            
        );


        _transfer(0, _owner, newDigitalConstructId);

        return newDigitalConstructId;
    }
    
    mapping (uint => address) public UTDToOwner;
    mapping (address => uint) public ownerUTDCount;

    

   
}

