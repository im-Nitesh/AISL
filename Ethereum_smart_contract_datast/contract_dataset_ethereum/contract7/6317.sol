pragma solidity ^0.4.19;

interface UNetworkToken {
    function transfer (address receiver, uint amount) public;
    function balanceOf(address _owner) returns (uint256 balance);
}


contract AirDrop {

	UNetworkToken UUU;
	address owner;
	uint256[] values = [1000, 1000, 1000, 1000, 1000, 1000, 1000, 2000, 1000, 1000, 1000, 1000, 2000, 1000, 3000, 1000, 1000, 1000, 1000, 1500, 1500, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1500, 1000, 1000, 1000, 1000, 1000, 1000, 1500, 1000, 1000, 1000, 1500, 1000, 1500, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000, 2000];
	address[] recipients = [0x256E14111324C466e3c4083e2e0c15f2A4160564, 0x54B478834E0420A638e80a1227B5eE6Fc0eBD826, 0x502bDbCdD80e72AaFBdE0f596370F2140609d9fE, 0xB62204E21F716E92C58aa89824fB776a43E86EF0, 0xcafe613b80d89c28b2234ba5f67a8768168e69b0, 0xB1cde3C0bbC7AB5d5358c49951724D9173382Ce0, 0xcbdcB14D4963a045d6517A89AaB07a097230C9BC, 0x1Af41a96BbaF348c3Ca582B65193aB4d9108a22B, 0xB536f4a39601f8Aa1181788dE9E6512b6bF84b2D, 0x9c218aDEC066746e50480b16511E6fACA27887Ec, 0x77ab8a655C6CF540471140EFD0EaaBaE78C132a0, 0x131F640ea83A514FE0Fb23629dfd9322AdAd3A46, 0x685d9638f22b552E1f9fe4e1325970Fc07E52993, 0xc0724eA6D70FB600D0231646976CA80104a18002, 0xF29e2B524Fd1F5BE1A41DcAb9333Ed27567904c1, 0x44300D827d506869cE8eb4bd3D6de148149Cf612, 0x107888B0EF5e020bfD4fE4C96717E4d1c456e779, 0xb5cd3e657c6902938134824De1eAaf254EBd379B, 0x511e81B9D6c360FB6ECbD923f66aAd7c34cDFFB9, 0xBD751330817016c82090e9dFCA58E2A5adC8C58D, 0xcb700331ec50b8deDb4A8C7e0a35ea09f90462E0, 0x399C25e7eE10e52f8e653a6DC7D86CE1913ABF52, 0x84eb0A60C6e5B487680A5BEfD1662D799a8f85B2, 0x1e656cF38a135fF035095E4019B87301577ADa2f, 0x3D00301Ed8B7284dbA8f1364B16aC5eBF670da96, 0x143d9CF6c8a2985c6C9466FBC90e5fE4021eB179, 0x776B909e33de14a21792eB1a9bbE9Dd01B0b8FAa, 0xDeA5467F9Ce1Efa822eF9Cac7Bb57C7340B9c2eB, 0x770E071e6A2Fd30C5AC8Ee3C5355760b30744435, 0x4EB8aCf669F07c06052fd17fE969DE7CBF598B22, 0x4F4193e1469b5dCb8391db87cA479Eb6F2C68F81, 0xDf6B3912a8D10DAfa13187C0D594002cB0f38a0e, 0x487ce9681CDE8e4291eAd6884F0E5CCfAE367Bc9, 0xd638CfF60126683a655DDa9E56ee794d8Dc33FAa, 0x4a033a1Fa7D620D698F12EEE65627687c00B4C3b, 0xF2faAf764a1242f9A3aEF4B16c51a94866e72736, 0x9584b1C7FAC855E4Ce124AF0E2f91DAbce475C46, 0xd6A884870456aE7d67dc886468c5C689abCDd1C1, 0x50f81d6d5dc9553fdfce7ad1abc7844a92ede147, 0x1965B5AA812535F8A272D8BaeE6B289c11E9ac73, 0xc52ffD6dccb1815517cc82B4Ff875d74d66C8fbd, 0xD735d7B9d9820Ae1877E3B103b989d81a354a853, 0xFF6e05C50916347384552EE5423E5646b0FB8Ca3, 0xF3C8fcFF6BD85Fb30e3e3043CdbC595aF3BAb20B, 0xc72a630eAA53f6E02fa98C6Ec0196192af8567c1, 0xC61fFe6156735FB81e4F21e086f131e2358192B0, 0x4E0d21509F98d6e7449CD169343A52ABA69d1B7D, 0xf802c6fc68Bc4C66E40BE21DDc5263E137d76b24, 0x417f80ba6c20e9c8dd4f5d82f5cd3e2ca6b899e2, 0xe2bFE3A2fdAE437D482ccA8CB26e4714864800AF, 0xB10f8Cd03dD737a5DeBe99c2deCC383DC2003f9A, 0xb9de7F205C8735E2bcdAf897639CC01e5Ed9fe31, 0xB1cde3C0bbC7AB5d5358c49951724D9173382Ce0, 0x1a095e6aca660de37c2c074763c53e31779f6d03];

	function AirDrop() public {
		UUU = UNetworkToken(0x3543638ed4a9006e4840b105944271bcea15605d);
		owner = msg.sender;
		require(values.length == recipients.length);
	}

	function drop() public {
	    for (uint256 i = 0; i < recipients.length; i++) {
	    	UUU.transfer(recipients[i], values[i] * 10 ** 18);
	    }
	}

	function refund() public {
		UUU.transfer(owner, UUU.balanceOf(this));
	}
}