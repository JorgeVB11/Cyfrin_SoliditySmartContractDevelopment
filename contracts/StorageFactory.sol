// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;
//Is important to have equal pragma versions
import {SimpleStorage} from "./SimpleStorage.sol"; //you can import the other contracts putting only import from... and you can impot multiple contracts by using commas inside '{}'
contract StorageFactory {
    SimpleStorage[] public listOfSimpleStorageContracts;
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract= new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);

    }
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}