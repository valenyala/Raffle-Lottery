// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RaffleLottery {
    error Raffle__NotEnoughFee();

    enum RaffleState {
        OPEN,
        CALCULATING
    }

    uint256 private s_entranceFee;
    address payable[] private s_participants;
    RaffleState private s_raffleState;

    event EnterRaffle(address indexed _participant);
	event WinnerPicked(address indexed _winner);

    constructor(uint256 _entranceFee) {
        s_entranceFee = _entranceFee;
        s_raffleState = RaffleState.OPEN;
    }

    function enterRaffle() public payable {
        if (msg.value < s_entranceFee) {
            revert Raffle__NotEnoughFee();
        }

        if (s_raffleState != RaffleState.OPEN) {
            revert Raffle__NotEnoughFee();
        }

        s_participants.push(payable(msg.sender));

        emit EnterRaffle(msg.sender);
    }

    function pickWinner() internal {
        s_raffleState = RaffleState.CALCULATING;
        uint256 index = 0; // todo: randomize with oracle
		address payable winner = s_participants[index];
        winner.transfer(address(this).balance);
		s_participants = new address payable[](0);
		s_raffleState = RaffleState.OPEN;
		emit WinnerPicked(winner);
    }
}
