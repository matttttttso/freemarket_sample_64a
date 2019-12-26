$(function() {
  $('.sell-main__form__content__price-first__text-field').on('keyup', function(){
    var price = $(this).val();
    var fee = Math.floor(price * 0.1)
    var seller_profit = price - fee
    
    if (price <= 300 || price >= 9999999) {
      $('#fee').text('-')
      $('#seller_profit').text('-')
    }
    else {
      $('#fee').text('¥' + fee.toLocaleString())
      $('#seller_profit').text('¥' + seller_profit.toLocaleString())
    }
  })
})
