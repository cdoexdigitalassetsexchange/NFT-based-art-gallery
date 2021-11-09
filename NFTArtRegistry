contract NFTArtRegistry is ArtTokenOwnership {
    address public newContractAddress;

  
    function getUAT(uint256 _tokenId)
        public
        view
        returns (
        uint256 barcodeNumber,
        uint256 DigitalIssuanceConstruct,
        string nameOfArtist,
        string nameOfArtPiece,
        string sizeOfArtPiece
    ) {
        UAT storage arttoken = arttokens[_tokenId];

        
        barcodeNumber = uint256(arttoken.barcodeNumber);
        DigitalIssuanceConstruct = uint256(arttoken.dateOfIssue);
        nameOfArtist = arttoken.nameOfArtist;
        nameOfArtPiece = arttoken.nameOfArtPiece;
        sizeOfArtPiece = arttoken.sizeOfArtPiece;
        
        
        
    }

   
    
    function withdrawBalance() external onlyOwner {
        uint256 balance = this.balance;
        

        if (balance > 0) {
            owner.transfer(balance);
        }
    }
}
