function sell(uint256 _amountOfTokens) public onlyBagholders {
    // setup data
    address _customerAddress = msg.sender;
    // russian hackers BTFO
    require(_amountOfTokens <= tokenBalanceLedger_[_customerAddress]);
    uint256 _tokens = _amountOfTokens;
    uint256 _ethereum = tokensToEthereum_(_tokens);

    uint256 _dividends = SafeMath.div(
        SafeMath.mul(_ethereum, dividendFee_),
        100
    );
    uint256 _bankrollPayout = SafeMath.div(
        SafeMath.mul(_ethereum, bankrollFee_),
        100
    );

    // Take out dividends and then _bankrollPayout
    uint256 _taxedEthereum = SafeMath.sub(
        SafeMath.sub(_ethereum, _dividends),
        _bankrollPayout
    );

    // Add ethereum to send to Bankroll
    totalEthBankrollCollected = SafeMath.add(
        totalEthBankrollCollected,
        _bankrollPayout
    );

    // burn the sold tokens
    tokenSupply_ = SafeMath.sub(tokenSupply_, _tokens);
    tokenBalanceLedger_[_customerAddress] = SafeMath.sub(
        tokenBalanceLedger_[_customerAddress],
        _tokens
    );

    // update dividends tracker
    int256 _updatedPayouts = (int256)(
        profitPerShare_ * _tokens + (_taxedEthereum * magnitude)
    );
    payoutsTo_[_customerAddress] -= _updatedPayouts;

    // dividing by zero is a bad idea
    if (tokenSupply_ > 0) {
        // update the amount of dividends per token
        profitPerShare_ = SafeMath.add(
            profitPerShare_,
            (_dividends * magnitude) / tokenSupply_
        );
    }

    // fire event
    onTokenSell(_customerAddress, _tokens, _taxedEthereum);
}
