// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaing{
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }
    
    mapping(uint256 => Campaing) public campaigns;

    uint256 public numberOfCampaings = 0;
    
    function createCampaign(address _owner,string memory _title, string memory _description, uint256 _target, uint256 _deadline, string memory _image)public returns(uint256){

        Campaing storage campaign = campaigns[numberOfCampaings];

        require(campaign.deadline < block.timestamp, "the deadline should be a date in the future.");

        campaign.owner = _owner;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;
    
        numberOfCampaings++;

        return numberOfCampaings -1;
    }

    function donateToCampaign(uint256 _id) public payable{
        uint256 amount = msg.value;

        Campaign storage campaing = campaigns[_id];
    }

    function getDonators(){}

    function getCampaigns(){}

}