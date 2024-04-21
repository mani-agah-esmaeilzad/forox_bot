#include<Trade\Trade.mqh>
CTrade trade;
input double MyLotSize = 0.10;
void OnTick()
{
   double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double Balance=AccountInfoDouble(ACCOUNT_BALANCE);
   double Equity=AccountInfoDouble(ACCOUNT_EQUITY);

   if(Equity >= Balance)
   {
   trade.Sell(MyLotSize,NULL,Bid,0,(Bid+100 * _Point),NULL);
   trade.Buy(MyLotSize,NULL,Bid,0,(Bid-100 * _Point),NULL);
   }
}