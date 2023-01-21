function checkCashRegister(price, cash, cid) {
   
    console.log("Prix à payer : " + price)
    console.log("Cash Donné : " + cash)
     // CID order of coins 
 
     // PENNY - NICKEL - DIME - QUARTER - ONE - FIVE - TEN - TWENTY - ONE HUNDRED
 
     /* cid = [
         ["PENNY", 10],
         ...,
         ["ONE HUNDRED", 5]
     ]
     */
     // Converting Cash in drawer 
     for(let i = 0; i < cid.length; i++){
       cid[i][1] *=100;
     }
     cash = cash*100;
     price = price*100;
     let moneyDictionary = [1 ,5 ,10 ,25 ,100 ,500 ,1000 ,2000, 10000];
     let result = new Object();
     let cashFund = 0;
     for(let i = 0; i < cid.length; i++){
       cashFund += cid[i][1];
     }
     let due = cash - price;
     if(due > cashFund)
     {
       result.status = "INSUFFICIENT_FUNDS";
       result.change = [];
     }
     else
     {
       result.change = [
         ["PENNY",0],
         ["NICKEL",0],
         ["DIME",0],
         ["QUARTER",0],
         ["ONE",0],
         ["FIVE",0],
         ["TEN",0],
         ["TWENTY",0],
         ["ONE HUNDRED",0]
       ];
       for(let i = cid.length - 1; i >= 0; i--)
       {
         while(due - moneyDictionary[i] >= 0 && cid[i][1] > 0)
         {
             result.change[i][1] = Math.round(result.change[i][1] + moneyDictionary[i]);
             cid[i][1] = Math.round(cid[i][1] - moneyDictionary[i]);
             due = Math.round(due - moneyDictionary[i]);
             cashFund = Math.round(cashFund - moneyDictionary[i]);
         }
       }
     }
     if(due != 0){
       result.status = "INSUFFICIENT_FUNDS";
       result.change = [];
     }else if(cashFund == 0){
   
       result.status = "CLOSED";
       //result.change = result.change.filter( item => item[1] != 0);
     }else{
       result.status = "OPEN";
       result.change = result.change.filter( item => item[1] != 0);
     }
     for(let i=0; i < result.change.length; i++){
       result.change[i][1] /= 100;
       cid[i][1] /= 100
     }
     
     if(result.status == "OPEN"){
         result.change = Object.values(result.change).reverse()
     }
     
     console.log("STATUS : " + result.status)
     console.log(result.change)
     for(let i = 0; i < result.change.length; i++){
       console.log("CHANGE : ")
       console.log(result.change[i][0] + ": " + result.change[i][1])
       console.log("CID : ")
       console.log(cid)
       console.log(cid[i][0] + ": " + cid[i][1])
     }
     console.log("---------------------------------------------------------------------------------------")
     return result;
   }
   
   checkCashRegister(19.5, 20, [["PENNY", 0.5], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]]);