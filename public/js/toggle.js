$('.show_readme').show(); //show buttons
$('.readme').hide(); // hide all readmes
 
$('.show_readme').click(function(e){

    e.preventDefault();
    var readme_id = $(this).data('id');
    if ($('#p'+readme_id).css('display')!='none'){
      $('.readme').hide();
    }
    else{
      $('.readme').hide();
      $('#p'+readme_id).fadeToggle(200, "linear");
    }
});