//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function() {
  $("#sortable1, #sortable2" ).sortable({
      connectWith: ".connectedSortable",
      receive: function(e, ui){

        $("#group_names").val("");
        $(".students_added li.group_names").remove();
        $("#sortable2 li.ui-state-default").each(function(){
          
          // go through each li
          // add that li's text value to the group
          $("#group_names").val($(this).text()+","+$("#group_names").val() );
            groups_students[$(this).text()].forEach(function(e){
              $(".students_added").append("<li class='group_names'>"+e.name+"</li>")
          });
       });
      },
    }).disableSelection();
  });


$(function(){
  $("#group_field").click(function(){
  $("input#assignment_group_name").toggle();
  $("#group_name_label").toggle()
  $("#add_student_label").toggle()
  })
})