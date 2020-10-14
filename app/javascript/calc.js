function calc(){
  if (document.URL.match(/items/) || document.URL.match(/new/) ) {
    const price = document.getElementById("item-price")
    const tax = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")

    price.addEventListener('input', () => { 
      const calcTax = Math.floor(price.value * 0.1)
      tax.innerHTML = `<span id='add-tax-price'>${calcTax}</span>`
      const calcProfit = Math.floor(price.value * 0.9)
      profit.innerHTML = `<span id='profit'>${calcProfit}</span>`
    })
  }
}
window.addEventListener('load', calc)

