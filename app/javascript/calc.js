function calc(){
  const price = document.getElementById("item-price"); 
  const tax = document.getElementById("add-tax-price"); 
  const profit = document.getElementById("profit"); 
  
  price.addEventListener('input', (e) => { 
    const priceValue = price.value;
    //手数料の計算
    const calcTax = Math.floor(priceValue * 0.1);  
    tax.innerHTML = `<span id='add-tax-price'>${calcTax}</span>`;
    //利益の計算
    const calcProfit = Math.floor(priceValue * 0.9); 
    profit.innerHTML = `<span id='profit'>${calcProfit}</span>`;
  });
}
window.addEventListener("load", calc);