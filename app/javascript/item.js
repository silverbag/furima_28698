/* <script langage="javascript"> */
// window.onload = function(){
window.addEventListener('click', function(){
  const price = document.getElementById("item-price");

  price.addEventListener('input', function(e) {
    // console.log(e); // eの中に数字が存在した。これを取得したい。方法？
    // console.log(price.getAttribute("id"));
    const fee = event.target.value;
    calc = fee / 10;
    profit = fee - calc
    // console.log(calc);
    document.getElementById('add-tax-price').innerHTML= calc
    document.getElementById('profit').innerHTML= profit
});
});

    // console.log( document.getElementById('add-tax-price'))
    // document.getElementById('add-tax-price').remove()