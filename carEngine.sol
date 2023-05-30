// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarEngine {
    string[] command = ["start", "stop", "help", "quit"];
    bool isStarted = false;

    function getEngineStatus() public view returns (string memory) {
        if (isStarted) {
            return ">>>>Car Is Started>>>>";
        } else {
            return ">>>>Car Is Stopped>>>>";
        }
    }

    function carEngine() public pure returns (string memory) {
        return "<---------Type These Commands To Get Started-------\n\n~~~~~[start] To Start the Car\n~~~~~[stop] To Stopped the Car\n~~~~~[help] To know about Engine\n~~~~~[quit] To Terminate the Engine";
    }

    function executeCommand(string memory user_input) public returns (string memory) {
        if (keccak256(bytes(user_input)) == keccak256(bytes(command[0]))) {
            if (isStarted) {
                return ">>>>Car Is Already Started>>>>";
            } else {
                isStarted = true;
                return ">>>>Car Is Started>>>>";
            }
        } else if (keccak256(bytes(user_input)) == keccak256(bytes(command[1]))) {
            if (!isStarted) {
                return ">>>>Car Is Already Stopped>>>>";
            } else {
                isStarted = false;
                return ">>>>Car Is Stopped>>>>";
            }
        } else if (keccak256(bytes(user_input)) == keccak256(bytes(command[2]))) {
            return carEngine();
        } else if (keccak256(bytes(user_input)) == keccak256(bytes(command[3]))) {
            return "Engine Terminated";
        } else {
            return "Invalid Command";
        }
    }
}
