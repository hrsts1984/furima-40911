const price = () => {


  const priceInput = document.getElementById("item-price");

  if (priceInput) {
      const add_tax = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");

      priceInput.addEventListener("input", () => {
         const inputValue = priceInput.value;
         console.log(inputValue);

         const addTaxDom = document.getElementById("add-tax-price");
         addTaxDom.innerHTML = inputValue * 0.1;

         const profitDom = document.getElementById("profit");
         profitDom.innerHTML = inputValue - inputValue * 0.1;
         console.log(inputValue);
      });
  }
}
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);