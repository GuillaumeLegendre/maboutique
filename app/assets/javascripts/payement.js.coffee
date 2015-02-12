$(document).ready ->
  $('#input-number-sms').bind "change paste keyup", ->
    $('#group-price').removeClass("hide")
    $('#price').text( $(this).val() * 6 /100 )
