pragma solidity ^0.4.4;

import "./ConvertLib.sol";

contract Splitter {
       
	address public bob;
        address public carol;

        mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);


        function Splitter(address ad1, address ad2) {

	bob=ad1;
	carol=ad2;
        //Initialize the balance with 10,000 Ether.	
	balances[tx.origin] = 10000;
        }

         function xfer(address receiver1,address receiver2,uint amount) returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		amt=amount/2;
		balances[msg.sender] -= amount;
		balances[receiver1] += amt;
	 	Transfer(msg.sender, receiver1, amt);
		balances[receiver2] += amt;
		Transfer(msg.sender, receiver2, amt);
		return true;
	}
        function getBalanceInEth(address addr) returns(uint){
		return ConvertLib.convert(getBalance(addr),2);
	}

        function getBalance(address addr) returns(uint) {
		return balances[addr];
	}


 }      
		






	


