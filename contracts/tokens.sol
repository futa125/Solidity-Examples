// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract Tokens {
    struct Token {
        uint cost;
    }

    event Purchase(
        address _buyer,
        uint256 _amount,
        bool    _successful
    );

    mapping(address => Token[]) balances;
    address payable wallet;

    constructor(address payable _wallet) {
        wallet = _wallet;
    }

    function buyToken() public payable {
        require(msg.value > 0, "Message value must be larger than zero");
        balances[msg.sender].push(
            Token(msg.value)
        );
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, msg.value, true);
    }

    function getTokens() public view returns(Token[] memory){
        return balances[msg.sender];
    }
}