# Cabal Finance

Project Overview:

A decentralized market, where existing companies can take advantage of bonds. Companies need funds to grow business, will leverage the use of bonds to receive funds.

Different bond options

Potential Option A: Company will tie company to smart contract. Create pseudo-share not connected to in person stocks/shares. This shares will be sold in an effort to raise funds for the company. Company owner/rep must put in 10% of total amount collected possible, before other are allowed to become pseudo stock owners in company. All pseudo stock owner, will have governing power potentially. They will vote to come to conclusions, but it won't affect stock ownership of those stock owners not in web3 space. (Can be seen as a gateway from web 2.0 to web 3.0)

Should be an underlying ERC721 mechanic per project and ERC20 token distribution, that will be the "share" in this case.

High risk, since company could devaluate quickly. Could potentially be a much bigger win if company does well.


Option B: A more simple model, where Company needs funds. But it will just request money from users, for interest that will be paid.

Once user lend money, they will be given ERC20 tokens as equal payment for money lent. Interest will also be paid in ERC20. Loan times will be by a couple different time intervals or maturity(ex. 1yr, 2yr, 6mo). Amount of interest will be determined by time and underlying asset. Price will be checked real time by use of Chainlink.

Ex of interest calculation

6mo - 4%
1yr - 8%
2yr - 10%

Potentially check volatility of asset being loaned, maybe last 3 months

ex. 4% additional If loaning CRV token, than interest will be higher since it goes up in price. Interest is higher b/c if user had held those specific token they would have increased in value potentially.

ex. 1% additional If loaning Sol token, than interest will be lower since it's been going down in price. Interest is lower b/c it's likely that use would have lost money b/c of depriciation of Sol token.

ex. 2.5% If loaning DAI or other stable coin. Interest will be neutral or in the middle since, it's pegged to the US dollar and we need to have a base and it's not affected by the crypto market.

Additionally bonds will be paid quarterly. Example on a 1yr bond loan of $1000 and interest calculated at $120. Every 3 months $30( $120 / 4 ) will be paid, on the last payment the quarterly amount will be paid and the original loan amount will be paid $1000.

Ex on Bond

[
    Company B
    $1000
    2yr Maturity
    10% Coupon
    Semi/Quartely Annual payment
]