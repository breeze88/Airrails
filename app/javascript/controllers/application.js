import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

//= require jquery

//= require chosen-jquery
//= require chosen
//= require_tree .
//= require chosen-js/chosen.jquery.min

$(document).on('turbolinks:load', function() {
    $(".chosen-select").chosen();
  });