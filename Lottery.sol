// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Lottery is ERC20 {
    address public manager;
    address[] public players;

    constrctor() ERC20("Lottery Token", "LTK") {
        manager = msg.sender;
        _mint(msg.sender, 1000000 * (10**uint256(decimals())));
    }
    
    modifier restricted() {
        require(msg.sender == manager, "Only the manager can call this function");
        _;
    }

    function enter() public payable {
        require(msg.value > 0.01 ether, "Minimum contribution is 0.01 ether");

        players.push(msg.sender);
    }

    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function pickWinner() public restricted {
        require(players.length > 0, "No players in the lottery");

        uint256 index = random() % players.length;
        address winner = players[index];

        // Transfer the entire contract balance to the winner
        payable(winner).transfer(address(this).balance);

        // Reset the players array for the next round
        delete players;
    }


    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    function getManager() public view returns (address) {
        return manager;
    }
}
