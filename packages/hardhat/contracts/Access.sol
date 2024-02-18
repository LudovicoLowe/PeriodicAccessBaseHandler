//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * 
 */
contract Access {

	address public immutable host;
	address public guest;
	uint256 public startDate;
	uint256 public endDate;
	bool public access;

	event OpenAccess (
		address indexed greetingSetter,
		uint256 value
	);

	constructor(address _host, address _guest, uint256 _startDate, uint256 _endDate) {
		host = _host;
		guest = _guest;
		startDate = _startDate;
		endDate = _endDate;
		access = false;
	}

	modifier isHost() {
		require(msg.sender == host, "Not the Host");
		_;
	}

	modifier isGuest() {
		require(msg.sender == guest, "Not the Guest");
		_;
	}

	function setStartDate (uint256 _startDate) public isHost {
		startDate = _startDate;
	}

	function setEndDate (uint256 _endDate) public isHost {
		endDate = _endDate;
	}

	function allowAccess () public isHost {
		access = true;
	}

	function denyAccess () public isHost {
		access = false;
	}

	function getAccess () public isHost isGuest {
		require(access, "Access not allowed by host");
		require((startDate <= block.timestamp) && (block.timestamp <= endDate) , "Period not valid for access");

		uint256 pin = 0;
		emit OpenAccess(msg.sender, pin);
	}

}
