$('.show_readme').show(); //show buttons
$('.readme').hide(); // hide all readmes

$('.show_readme').click(function(){
    var readme_id = $(this).data('id');
    $('.readme').hide();
    $('#p'+readme_id).fadeTo(200, 1);
});