// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // we will work with solidity with version  either 0.8.18 or higher

contract SimpleStorage {
    // basic var types: boolean, uint, bytes, int, address etc
    bool hasFavoriteNumber = true;
    uint256 public favouriteNumber = 1; // can be accessed externally and internal
    int32 favouriteInt = 30;
    string favouriteString = "hi lewis";
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // funtions
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
    // 1. Visibility: this controls who can call the func.
    // there is public - can be called by anyone externally and internally, private - can only be called internally, internal - can be called internally and by derived contracts, external - can only be called externally.
    // *function publicFn() public {}*
    // private - this can only be  called inside the contract, not even derived contracts can call it.
    // external - this can be only called from outside the function, not even inside the contract. but it can be called by derived contracts.
    // internal - this can be called by the contract and child contract via inheritance, ut never from outside

    // 2. State mutability: this controlls what a func can do with state variables. there is ...
    // pure - this func cannot read or write to state variables,
    // view - this func can read but not write to state variables,
    // payable - this func can receive ether,
    // non-payable - this func cannot receive ether.
}
//example

contract Bank {
    address public owner;
    mapping(address => uint256) public balances;

    //this runs only when the code is deployed, and sets the owner to the address that deployed the contract
    constructor() {
        owner = msg.sender;
    }

    //reussable function wrapper
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function deposit() public payable {
        require(msg.value > 0, "Send some ETH");
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function toWei(uint256 ethAmount) public pure returns (uint256) {
        return ethAmount * 1e18;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function emergencyDrain() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // handles plain eth sending to the contract without calling any function
    receive() external payable {
        balances[msg.sender] += msg.value;
    }
}

