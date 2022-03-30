// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract People {
    uint256 peopleCount = 0;
    mapping(uint => Person) people;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    constructor() {
        owner = msg.sender;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        public
        onlyOwner
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function getPerson(uint _id) public view returns(Person memory) {
        return people[_id];
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}