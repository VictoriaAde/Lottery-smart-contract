# Lottery Smart Contract

## Overview

This is a simple Lottery Smart Contract implemented in Solidity, leveraging the ERC-20 standard for a token named "Lottery Token" (LTK). Participants can enter the lottery by contributing a minimum amount of 0.01 ether. The manager, who deploys the contract, can randomly select a winner, transferring the entire contract balance to the winner. The contract resets the list of participants for subsequent rounds.

## Contract Details

### ERC-20 Token

The contract inherits from OpenZeppelin's ERC-20 implementation. The token is named "Lottery Token" with the symbol "LTK" and has a fixed total supply of 1,000,000 tokens.

### Manager

The manager is the address that deploys the contract and has exclusive access to certain functions, ensuring secure control over the lottery process.

### Functions

1. **enter():**
   - Allows participants to enter the lottery by sending a minimum contribution of 0.01 ether.

2. **random():**
   - Generates a pseudo-random number based on block difficulty, timestamp, and player addresses.

3. **pickWinner():**
   - Restricted to the manager, randomly selects a winner from the list of participants, transfers the entire contract balance to the winner, and resets the list of players for the next round.

4. **getPlayers():**
   - Returns the array of player addresses.

5. **getManager():**
   - Returns the address of the manager.

## How to Test Using Remix IDE

1. **Open Remix IDE:**
   - Visit [Remix IDE](https://remix.ethereum.org/).

2. **Create a New File:**
   - Create a new file and copy-paste the smart contract code into Remix.

3. **Compile the Contract:**
   - In the "Solidity Compiler" tab, compile the contract by selecting the appropriate version and clicking "Compile Lottery.sol."

4. **Deploy the Contract:**
   - Move to the "Deploy & Run Transactions" tab.
   - Select "Lottery" from the contract dropdown.
   - Click "Deploy."

5. **Interact with the Contract:**
   - Use the provided functions in the "Deployed Contracts" section to test the contract.
   - Make sure to switch to the account that will act as the manager for certain functions.

6. **Enter the Lottery:**
   - Use the "enter" function to participate in the lottery by sending a minimum contribution.

7. **Pick a Winner:**
   - After participants have entered, use the "pickWinner" function to randomly select a winner.

8. **Check Results:**
   - Use "getPlayers" to view the list of participants.
   - Use "getManager" to confirm the manager's address.


### Viewing the Contract on Etherscan
You can view the contract on Etherscan by visiting the following [link](https://sepolia.etherscan.io/tx/0x0eddd0935309df28e012ecb652ca46644efcd69f7aa36ec9a38e006cbac8916e).

