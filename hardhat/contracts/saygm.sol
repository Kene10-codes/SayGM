// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Saygm is Ownable { 
    string public prompt = "Say GM";

   // Set a struct
   // of two data types 
   // storing the address and answer
    struct Answer {
        address from;
        string answer;
    } 

    // Store the answers in the array
    Answer[]answers;

    uint256 public tips;

    // // Emit an event whenever someone answers
    event NewAnswer (
        address indexed from,
        string answer
    );


    // Set a new question 
    // by the onwer of the contract
    // and deletes the previously stored answers
    function setPrompt(string memory newPrompt) public onlyOwner {
        prompt = newPrompt;
        delete answers;
    }

    // Send the answer to the answers array
    function answer(string memory input) public {
        answers.push(Answer(msg.sender, input));
    }

    // Return all the answers
    function getAnswers() public view returns(Answer[] memory) {
        return answers;
    }
    
    // 
    function tip() public payable {
       tips = tips + msg.value;
    }

    // Withdraw form the wallet
    function withdraw() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
    
}
