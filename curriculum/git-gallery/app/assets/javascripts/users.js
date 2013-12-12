$('a.icon-plus-sign').hover(function() {
  var sel = "#"+$(this).data("name");
  $(sel).addClass("active_repo"); // "active_repo" see user_show.css
}, function() {
  var sel = "#"+$(this).data("name");
  $(sel).removeClass("active_repo");
});
