const pay = () => {
  Payjp.setPublicKey("pk_test_792dd2d64dcac80fb6cf4a8e");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    //フォーム情報の取得
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    //カード情報のトークン化
    Payjp.createToken(card, (status, response) =>{
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
    
  })
}

window.addEventListener("load", pay);