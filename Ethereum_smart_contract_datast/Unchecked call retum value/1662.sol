function emergencyERC20Drain(ERC20 token, uint amount) onlyOwner {
    // owner can drain tokens that are sent here by mistake
    token.transfer(owner, amount);
}
