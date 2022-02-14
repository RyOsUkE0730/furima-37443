function count () {
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("keyup", () => {
    const priceVal = itemPrice.value;
    const itemTax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    itemTax.innerHTML = Math.floor(priceVal * 0.1);
    profit.innerHTML = Math.floor(priceVal * 0.9);
  });
};

window.addEventListener('load', count);