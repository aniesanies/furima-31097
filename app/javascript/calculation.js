function price() {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const taxPrice = Math.floor(itemPrice.value * 0.1);
    const profit = itemPrice.value - taxPrice;
    document.getElementById("add-tax-price").innerHTML = taxPrice;
    document.getElementById("profit").innerHTML = profit;
  });
}

window.addEventListener("load", price)