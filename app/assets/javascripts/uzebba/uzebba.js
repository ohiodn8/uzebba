// UZEBBA MONITORING TOOL JS
//
//= require rails-ujs
//= require jquery3.min
//= require Chart.bundle
//= require chartkick

// Ajax Controller for all terminal ID
$(function() {
  if ($('#all_terminals').length) {
    setInterval(function(){
      $.getScript(window.location.pathname, function(data, textStatus, jqxhr) {
        console.log('Load was performed.');
      });
    },3000);
  }
});