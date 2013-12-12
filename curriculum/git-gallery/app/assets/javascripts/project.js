$('.carousel').carousel('pause');

$('.carousel').each(function() {
  $(this).find('.item:first').addClass('active');
});

$('.item1').hide();
$('.item1:first').show();
$('.feature').eq(0).addClass('selected');

$('.feature h2').click(function() {
  $('.feature').removeClass('selected');
  $(this).parent().addClass('selected');

  $('.item1').hide();
  
  var sel = "#"+$(this).data('name');
  $(sel).show();
});
