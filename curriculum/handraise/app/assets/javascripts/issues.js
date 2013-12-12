// JS for Window Resizing
$(function(){
    function adjustHeightsForScoll(){
        window_height = parseInt($(window).height());
        navbar_height = parseInt($("div.navbar").height());
        content_height = window_height - navbar_height;
        $("div.issues-nav, div.issue-show-container").css({height: content_height});
    }
    $(window).load(function(){
       adjustHeightsForScoll();
    });

    $(window).resize(function(){
        adjustHeightsForScoll();
    })
});



// $(document).keyup(function(e){
//   if (e.keyCode == 65) {
//     $('#admin').toggle();
//   }
// });

function AdminKey() {
  $('#admin').toggle();
}

$(document).bind('keydown', 'ctrl+a', function(){
    $('#admin').toggle();
});

$('#issues').tablesorter({
  sortList: [[2,1]]
});

// $("#trigger-link-votes").click(function() {
//     // set sorting column and direction, this will sort on the first and third column the column index starts at zero
//     var sorting = [[2,1]];
//     // sort on the first column
//     $("table").trigger("sorton",[sorting]);
//     // return false to stop default link action
//     $(this).addClass('trigger-link-on');
//     $("#trigger-link-date").removeClass('trigger-link-on');
//     return false;
// });

// $("#trigger-link-date").click(function() {
//     // set sorting column and direction, this will sort on the first and third column the column index starts at zero
//     var sorting = [[0,1]];
//     // sort on the first column
//     $("table").trigger("sorton",[sorting]);
//     // return false to stop default link action
//     $(this).addClass('trigger-link-on');
//     $("#trigger-link-votes").removeClass('trigger-link-on');
//     return false;
// });


$('#example').popover({
  // template: '<div class="popover"><div class="arrow"></div><div class="popover-inner auto-fit"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
});


// highlighted selected issue-nav item

// $(document).ready(function() {
//   $('div.issue-nav h4').click(function() {
//     $('div.issue-nav').removeClass('selected');
//     $(this).addClass('selected');
//   });
// });


function ActivateIssueShow(){
    $('div.answer-comments-toggle-li ').click(function(){
      $(this).prev().slideToggle();
    })
    $('#issue-comments-toggle').click(function(){
      $('.new-issue-comment').slideToggle();
    });
};

$(function(){
  ActivateIssueShow();
})

function bindIssueFilters(){
  $(".btn-link.my-issues, .btn-link.resolved, .btn-link.unresolved").click(function(){
    $(".btn-link.my-issues, .btn-link.resolved, .btn-link.unresolved").removeClass("issues-nav-selected-scope");
    $(this).addClass('issues-nav-selected-scope');

    table_class = $(this).attr("class").replace("btn btn-link ", "").replace(" issues-nav-selected-scope","");

    $("table.issue-nav-table").hide();
    $("table."+table_class).show();
  });
}

function toggleCorrectFilter(){
    if ($("table.issues-search")[0]){
      $("table.issue-nav-table").hide();
      $("table.issues-search").show()
  } else {
      $(".btn-link.unresolved").click()
  }
};

function bindLoadIssues(){
   $("a.issue-load").click(function(e){
    e.preventDefault();

    $.getScript($(this).attr("href"));
    history.pushState(null, "", this.href);

    $("tr.selected").removeClass("selected");
    $(this).parents("tr:first").addClass("selected");

    $(window).bind("popstate", function () {
      $.getScript(location.href);
    });
  });
 };

function ActivateIssuesIndex(){
  bindIssueFilters();
  toggleCorrectFilter();
  bindLoadIssues();
}


