
//= require jquery

//= require chosen-jquery
//= require_tree .


import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"


$(document).on('turbolinks:load', function() {
    $(".chosen-select").chosen();
  });

