(function(){$(document).ready(function(){return $("#input-number-sms").bind("change paste keyup",function(){return $("#group-price").removeClass("hide"),$("#price").text(6*$(this).val()/100)})})}).call(this);