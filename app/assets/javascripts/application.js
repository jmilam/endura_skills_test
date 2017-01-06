// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$(document).on('turbolinks:load', function(){
	var test_num = $('#test_num').val();
	if (test_num == "1" ){ 

		$('#test_one').css('display', 'block');
	}
	else if (test_num == "2") {
		$('#test_two').css('display', 'block');
	}
	else {

	}

	setInterval(function() {
    	$('.alert').alert('close');
	}, 5000);
});

$('.alert')