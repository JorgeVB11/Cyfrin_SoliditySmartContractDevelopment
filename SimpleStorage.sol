// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; //state our version if you put ^0.8.19 our contract will work with any version equal or greatter than 0.8.19, for example 0.8.20

contract SimpleStorage {
    uint256 myfavoriteNumber; //por defecto la visibilidad de las variables es internal
    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    // dynamic array
    Person [] public listOfPeople;

    //This is like a dictionary
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber =  _favoriteNumber;
    }
    function retrieve() public view returns (uint256){
        //no cuesta gas salvo que la llame otra funcion que si modifique algo
        return myfavoriteNumber;
    }
    // calldata, memory, storage
    //'calldata' and 'memory' mean that the variable will only exist temporarily. Only for the call
    // The diference between them is that memory variables can be manipulated, calldata not.
    //Storage are permanent variables that can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber,_name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}