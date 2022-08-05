//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;

    address public owner;

    modifier soloElGuapo() {
        require(msg.sender == owner, "ONLY_OWNER");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {

    }

    function changeTokens() public {
        string[] memory t = tokens;
        t[0] = "VET";
        tokens[0] = t[0];
    }

    function concatenate(string calldata s1, string calldata s2) public pure returns (string memory) {
        return string.concat(s1, s2);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function start() public {
        players.push(msg.sender);
    }

    function transferAll(address to) public soloElGuapo returns (bool) {
        (bool success, ) = to.call{value: getBalance()}("");
        return success;
    }

}
