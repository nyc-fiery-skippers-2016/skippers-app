$(document).ready(function() {
  $("#new-skill-form").submit(function(e) {
    e.preventDefault();

    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;

    var ajaxRequest = $.ajax({
      type: type,
      url: url,
      data: data
    });

    ajaxRequest.done(function(response) {
      $("#skills-list").append(response)
    })
  })
});

