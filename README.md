# Raffle Lottery
This repository is part of the learning process from the [Foundry course](https://github.com/Cyfrin/foundry-full-course-f23) course from [@PatrickAlphaC](https://github.com/PatrickAlphaC). It is coded following the lesson for practice purposes.


## Features

- **Entrance Mechanism:** Participants can enter the lottery by invoking the `enter()` function, submitting a payment in cryptocurrency.
- **Round-based System:** The lottery operates in rounds, with each round closing after a predefined time period.
- **Random Winner Selection:** At the end of each round, the smart contract leverages a secure randomization algorithm to select a winner from the pool of participants.
- **Prize Distribution:** The total sum of cryptocurrency collected during a round is automatically transferred to the selected winner.

