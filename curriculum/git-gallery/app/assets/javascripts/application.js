// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require ../../../vendor/assets/theme/js/jquery-1.10.1.min
//= require ../../../vendor/assets/theme/js/bootstrap
//= require ../../../vendor/assets/theme/js/lightbox
//= require ../../../vendor/assets/theme/js/prettify
//= require ../../../vendor/assets/theme/js/main
//= require ../../../vendor/assets/chosen/chosen.jquery.min
//= require ../../../vendor/assets/masonry/masonry.pkgd.min
//= require ../../../vendor/assets/javascripts/jquery-ui-sortable
//= require update_slide_order
//= require best_in_place
//= require rails.validations
//= require_tree .

/////////// Document Ready ////////////////////////////
$(function(){


	$(".chosen-select").chosen();

	$('.sortable').sortable().bind('sortupdate', function() {
	});
  
////////////////// Masonry Functions /////////////////
  $('.thumbnails').masonry({
    gutter: 20,
    itemSelector: ".gallery-project"
  });
////////////////// Masonry Functions /////////////////
  $('.carousel').carousel({
 interval: 0
  });
 
});
/////////// Document Ready ////////////////////////////

