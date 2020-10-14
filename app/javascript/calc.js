function calc(){
  if (document.URL.match(/new/)){
    const price = document.getElementById("item-price")
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    // console.log(price)
    // console.log(tax)
    // console.log(profit)
    
    price.addEventListener('input', () => { 
      //手数料の計算
      const calcTax = Math.floor(price.value * 0.1)
      tax.innerHTML = `<span id='add-tax-price'>${calcTax}</span>`
      //利益の計算
      const calcProfit = Math.floor(price.value * 0.9)
      profit.innerHTML = `<span id='profit'>${calcProfit}</span>`
    })
  }
}
window.addEventListener('load', calc)

