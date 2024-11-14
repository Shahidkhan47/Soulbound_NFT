// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MyToken} from "../src/SoulBound.sol";

contract SoulBoundTest is Test {
    MyToken public mytoken;

    address public creator1 = address(11111);
    address public mintAdd1 = address(22222);
    address public mintAdd2 = address(33333);

    function setUp() public {
        vm.prank(creator1);
        mytoken = new MyToken();
    }

    function testMint() public {
        vm.prank(creator1);
        mytoken.safeMint(mintAdd1);
        assertEq(mytoken.__ownerOf(0), mintAdd1);
    }

    function testFail_mintOwner() public{
        vm.prank(mintAdd1);
        mytoken.safeMint(creator1);
    }
    
    function testFail_transfer()public {
        testMint();
        vm.prank(mintAdd1);
        mytoken.transfer(mintAdd1, mintAdd2, 0);
        vm.expectRevert("You can't transfer this nft");
        assertEq(mytoken.__ownerOf(0), mintAdd1);
    }

     function testFail_approve() public{
        testMint();
        vm.prank(mintAdd1);
        mytoken.approve(mintAdd1, mintAdd2, 0);
        vm.expectRevert("You can't approve this NFT for sale");
        assertEq(mytoken.__ownerOf(0), mintAdd1);
    }

    function testFail_burn() public{
        testMint();
        vm.prank(mintAdd1);
        mytoken.burn(0);
        vm.expectRevert("You can't burn this token");
        assertEq(mytoken.__ownerOf(0), mintAdd1);
    }

   
}
