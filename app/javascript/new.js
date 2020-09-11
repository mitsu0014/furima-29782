window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('keyup', function() {
    const var1 = parseInt(itemPrice.value)
    addTaxPrice.innerHTML = var1 / 10
    profit.innerHTML = var1 - var1 / 10
  })
})