// UZEBBA MONITORING TOOL JS
//
// require rails-ujs
//= require jquery3
//= require Chart.bundle
//= require chartkick

// Ajax Controller for all terminal ID
$(function timeout() {
  if ($('#all_terminals').length) {
    setTimeout(function(){
      $.getScript(window.location.pathname, function(data, textStatus, jqxhr) {
        console.log('Load was performed.');
      });
	  timeout();
    },30000);
  }
});
