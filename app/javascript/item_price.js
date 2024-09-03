document.addEventListener('DOMContentLoaded', () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  const updatePrice = () => {
    const inputValue = priceInput.value;
    const price = parseInt(inputValue, 10);

    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1);
      addTaxPrice.textContent = tax.toLocaleString();
      profit.textContent = Math.floor(price - tax).toLocaleString();
    } else {
      addTaxPrice.textContent = '---';
      profit.textContent = '---';
    }
  };

  priceInput.addEventListener('input', (e) => {
    e.target.value = e.target.value.replace(/[^0-9]/g, '');
    updatePrice();
  });

  updatePrice();
});