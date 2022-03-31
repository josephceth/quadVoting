// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

/// @title A contract for issuing voting credits, creating proposals, polling voters, and tally results
/// @author josephc.eth
/// @notice This is not production ready code and is for learning purposes only

// 1 – Tracking voters and their credit balances
// 2 – Issuing credits to voters
// 3 – Creating proposal to vote on
// 4 – Open voting
// 5 – Close voting
// 6 – Tallying Votes

contract QuadVoting {
    uint256 _creditSupply;
    address[] public _voters;
    mapping(address => uint256) private _creditBalances;

    /// @notice returns the balance of voting credits for a specific voter
    /// @param voterAddress wallet address
    /// @return returns the balance of voting credits for a specific voter in a uint256
    function getAddressCreditBalance(address voterAddress)
        public
        view
        returns (uint256)
    {
        return _creditBalances[voterAddress];
    }

    /// @notice adds a specified number of voting credits to a specified address
    /// @param voterAddress wallet address
    /// @param creditAmount amount of credits being added
    function addVotingCreditsToAddress(
        address voterAddress,
        uint256 creditAmount
    ) public {
        _creditBalances[voterAddress] += creditAmount;
        if (isVoter(voterAddress) == false) {
            _voters.push(voterAddress);
        }
    }

    /// @notice returns a boolean value based on if the given address is in the _voters array
    /// @param voterAddress wallet address
    /// @return returns returns a boolean value
    function isVoter(address voterAddress) public view returns (bool) {
        if (_voters.length == 0) {
            return false;
        }

        for (uint256 i; i < _voters.length; i++) {
            if (_voters[i] == voterAddress) {
                return true;
            }
        }

        return false;
    }
}
