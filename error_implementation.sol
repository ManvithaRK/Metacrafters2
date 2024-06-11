//SPDX-License-Identifer:MIT
pragma solidity ^0.8.9;

contract error_implementation {
    address owner;
    uint public total_budget=500;

    constructor(address initOwner) {
        owner = initOwner;     
    }

error InsufficientBalance(uint final_total, uint available);

    function matchBudget(uint a, uint b, uint c) public view {
        CommutativeLawCheck(a, b, c);
        uint total = a + b + c;
        if (total > total_budget) {
            revert InsufficientBalance({
                final_total: total,
                available: total_budget
            });
        }
    }

    function CommutativeLawCheck(uint a,uint b, uint c) internal pure {
        assert(a+b+c==c+b+a && a*b*c==c*b*a);
    }

    function setNewOwner(address newOwner) public {
        require(msg.sender == owner, "Only owner can set a new owner");
        require(newOwner != address(0) && newOwner!=owner, "Invalid address");
        owner = newOwner;
    }
}
