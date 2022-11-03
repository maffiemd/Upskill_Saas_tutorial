/* global $, Stripe */

// document ready function
$(document).on('turbolinks:load', function(){
    var theForm = $('#pro_form')
    var submitBtn = $('#form-submit-btn')
    submitBtn.click(function(event){
      event.preventDefault();
       // collect CC fields
       var ccNum = $('#card_number').val(),
       cvcNum = $('card_code').val(),
       expMonth = $('card_month'),
       expYear = $('card_Year');
       
       // send info to stripe
  });    
  Stripe.setPublishableKey( $('meta[name="Strike-key"]').attr('content') );
    // set stripe public key
    // prevent default behavior
    
   
    // stripe return back card token
    // handle response inject as hidden field
    // submit form to rails app
});