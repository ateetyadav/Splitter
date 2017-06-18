pragma solidity ^0.4.4;

import "./ConvertLib.sol";

contract Splitter {
       
	address public bob;
        address public carol;

        mapping (address => uint) balances;

	//event Transfer(address indexed _from, address indexed _to, uint256 _value);
	event LogTransfer(address indexed send, address indexed receiver, uint256 _value);

        function Splitter(address ad1, address ad2) {

		bob=ad1;
		carol=ad2;
       
        }

        function xfer(address receiver1,address receiver2) returns(bool sufficient) {
		if (balances[msg.sender] < msg.value) return false;
		
		Var rem=msg.value%2;   //check if remainder
		var amt=msg.value/2;
		balances[msg.sender] -= amount;
		if(rem==0){
			balances[receiver1] += amt;
			assert(balances[receiver1] + amt > balances[receiver1]);
			return  balances[receiver1];
	 		Transfer(msg.sender, receiver1, amt);
			balances[receiver2] += amt;
			assert(balances[receiver2] + amt > balances[receiver2]);
			return  balances[receiver2];
			Transfer(msg.sender, receiver2, amt);
			return true;
		} else{
			balances[receiver1] += amt;
			assert(balances[receiver1] + amt > balances[receiver1]);
			return  balances[receiver1];
	 		Transfer(msg.sender, receiver1, amt);
			balances[receiver2] += amt;
			assert(balances[receiver2] + amt > balances[receiver2]);
			return  balances[receiver1];
			Transfer(msg.sender, receiver2, amt);
			if (balances[receiver2] + amt > balances[receiver2])
			return  balances[receiver2];

			balances[msg.sender]+=rem;  //add the remainder balance back to sender.
			return true;
		}

	//}
        
        function getBalance(address addr) returns(uint) {
		return balances[addr];
	}

 } 
