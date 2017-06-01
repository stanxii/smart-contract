pragma solidity ^0.4.2;

contract VeriSig {

	function checkSig(bytes32 hash, bytes sig) internal returns(address) {
		uint8   v;
		bytes32 r;
		bytes32 s;

		assembly {
			r := mload(add(sig, 32))
			s := mload(add(sig, 64))
			v := and(mload(add(sig, 65)), 255)
		}

		if (v < 27) v += 27;

		return ecrecover(hash, v, r, s) ;
	}
}
