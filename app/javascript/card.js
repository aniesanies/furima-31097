function pay() {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById('charge-form');

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formData = new FormData(form);

    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const tokenObj = `<input value=${token} name='token' type='hidden'> `;
        form.insertAdjacentHTML("beforeend", tokenObj);
      }

    document.getElementById('card-number').removeAttribute("name");
    document.getElementById('card-cvc').removeAttribute("name");
    document.getElementById('card-exp-month').removeAttribute("name");
    document.getElementById('card-exp-year').removeAttribute("name");
    
    form.submit();
    });
  });
}

window.addEventListener("load", pay);