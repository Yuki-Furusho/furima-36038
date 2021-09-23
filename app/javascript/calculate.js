function tax (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const calculateTax = price.value * 0.1;
    const printTax = document.getElementById("add-tax-price");
    printTax.innerHTML = `${calculateTax}`;
  });
};

function profit (){
  const price = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const calculateProfit = price.value * 0.9;
    const printProfit = document.getElementById("profit");
    printProfit.innerHTML = `${calculateProfit}`;
  });
};

window.addEventListener('load',tax);
window.addEventListener('load',profit);