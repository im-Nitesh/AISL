pragma solidity ^0.4.18;

function transferAnyERC20Token(
    address tokenAddress,
    uint tokens
) public onlyOwner returns (bool success) {
    return ERC20Interface(tokenAddress).transfer(owner, tokens);
}
