$(function(){
  $(".name_autocomplete").tokenInput("/users.json",{
    theme: "facebook",
    prePopulate: $(".name_autocomplete").data('load'),
    tokenValue: 'name',
    preventDuplicates: true,
    searchDelay: 50,
    resultsLimit: 10,
    resultsFormatter: function(item){
     return "<li>" + item.name + " , " + item.email + "</li>" 
    },
    onAdd: function(item){
      this.data("tokenInputObject").clear();
      add_to_list(".students_added",item.name);
    }
  });
});

$(function(){
  $('#group_names').chosen().change(function(e){
    if(e.target.selectedOptions.length != 0){
      data = e.target.selectedOptions
      groups_students[data[0].value].forEach(function(e){
        add_to_list(".students_added",e.name);
      });
      $(".search-choice-close").click();
      $(".hidden").focusin();
    }
  });
});

