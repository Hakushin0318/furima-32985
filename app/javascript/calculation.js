function calculation (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {

    const inputValue = itemPrice.value;

    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit")

    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue * 0.9);
  });
}

window.addEventListener('load', calculation);