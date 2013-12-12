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
//= require twitter/bootstrap
//= require jquery.exists
//= require_tree .
//= require jquery_nested_form
//= require jquery.ui.datepicker
//= require jquery.ui.all
//= require chosen-jquery
//= require jquery.tokeninput

$(function(){
  $('#organization_subdomain').keyup(function(data){
    $(".site_subdomain").text(
      $("#organization_subdomain").val()
      );
  })
});

function add_to_list(list,item){
  current_students = []
  $(list + ' li').each(function(e,i){
   current_students.push($(i).text());
  });
  if($.inArray(item,current_students) == -1){
    $(list).append("<li class='added_student' style='display:none'>"+item+"</li>");
    $(list + " li:last").fadeIn(200);
  }
}

$(function(){
  $('.btn').click(function(){
    var data =  $(this).prev().val().split(',');
    console.log($(this).prev());
    if (data != ""){
      $(this).prev().val("");
      $(".name_autocomplete").tokenInput("clear");
      for (var i = 0; i < data.length; i++) {
        add_to_list(".students_added",data[i]);
      }; 
    }
  });
});

$(function(){
  $('.btn_email').click(function(){
    var data =  $(this).prev().val().split(',');
    console.log($(this).prev());
    if (data != ""){
      $(this).prev().val("");
      for (var i = 0; i < data.length; i++) {
        add_to_list(".students_invited",data[i])
      }; 
    }
  });
});


$('ul.students_added, ul.students_invited').on("click","li",function(){
      $(this).fadeOut('fast',function(){
        $(this).remove();
      })
});

$(function(){
  $("#submit_button").click(function(e){
    e.preventDefault();
    var users = [];
    $(".students_added li").each(function(){
      users.push($(this).text());
      }); 
    $(".students_invited li").each(function(){
      users.push($(this).text());
      }); 
    $(".hidden_user_add").val(users.join(","));
    $(this).closest("form").submit();
  });
});

$(function(){
  $('#accordion2 input').keypress(function(e){
    if(e.keyCode == 13){
      e.preventDefault();
      $(this).next().click();
    }
  });
});

$(function(){
  $('input.emails_assigned_from').keypress(function(e){
    if(e.keyCode == 13){
      e.preventDefault();
      $(this).next().click();
    }
  });
});

$(function(){
  $("#change_password").click(function(e){
    $("#passwords").toggle()
  })
})