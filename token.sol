// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public marketingWallet;

    constructor() ERC20("SimpleToken", "SMT") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
        marketingWallet = 0x...
        require(marketingWallet != address(0), "Invalid address");
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 taxAmount = amount * 5 / 100; // calculates 5% tax
        uint256 amountAfterTax = amount - taxAmount;

        super._transfer(sender, marketingWallet, taxAmount); // transfers the tax to the marketing wallet
        super._transfer(sender, recipient, amountAfterTax); // transfers the rest to the recipient
    }
}