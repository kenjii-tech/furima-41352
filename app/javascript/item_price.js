const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  if (!priceInput || !addTaxDom || !profitDom) return; 
  const calculatePrice = () => {
    const inputValue = priceInput.value;
    const price = parseInt(inputValue);
    if (inputValue === '' || isNaN(price)) {

      addTaxDom.innerHTML = '0';
      profitDom.innerHTML = '0';
    } else {

      const tax = Math.floor(price * 0.1);

      const profit = price - tax;

      addTaxDom.innerHTML = tax;
      profitDom.innerHTML = profit;
    }
  };
  priceInput.addEventListener("input", calculatePrice);
  calculatePrice(); // 
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);