// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
    
    
$(function(){
  $( '.datepicker' ).datepicker({
    dateFormat: "yy-mm-dd"
  });
});

$(function () {
  $('#myTab a').click(function(){
    $(this).tab('show');
  });
});


// $(function(){

//   $("td.assigned_by_me").exists(function(){
//     $(".table-striped").removeClass("span12").addClass("span5")

//   })
// })

// $(function(){
//   $(".assigned_to_me").exists(function(){
//     $(".left-side").removeClass("span12").addClass("span5")
//   })
// })