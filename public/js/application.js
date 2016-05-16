$(document).ready(function() {
  $("body").on("submit", ".upvote-form", function(e) {
    e.preventDefault();
    var votes = $(this).closest(".skipper-container").find(".vote-score").text();
    $(this).closest(".skipper-container").find(".vote-score").text(parseInt(votes) + 1);
    $.ajax({type: this.method, url: this.action})
    .done(function(response) {
      $(this).closest(".skipper-container").find(".vote-score").text(response);
    }.bind(this));
  });

  $("body").on("submit", ".downvote-form", function(e) {
    e.preventDefault();
    var votes = $(this).closest(".skipper-container").find(".vote-score").text();
    $(this).closest(".skipper-container").find(".vote-score").text(parseInt(votes) - 1);
    $.ajax({type: this.method, url: this.action})
    .done(function(response) {
      $(this).closest(".skipper-container").find(".vote-score").text(response);
    }.bind(this));
  });

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
      // Server-side rendering version
      // Expecting HTML back from the server
      // -----------------------------------
      $("#skills-list").append(response);
      // JS cloning version
      // Expecting JSON back from the server
      // -----------------------------------
      // var el = $("#skills-list").find("li").eq(0).clone();
      // el.find("a").text(skill.name);
      // el.find("a").attr("href", "/skills/" + skill.id);
      // $("#skills-list").append(el);

      // JS templating version
      // Expecting JSON back from the server
      // -----------------------------------
      // var skill = JSON.parse(response)
      // $("#skills-list").append(buildSkillHTML(skill))
    });
  });

  $("#skills-list").on("click", "a", function(e) {
    e.preventDefault();
    var link = this;
    $.ajax({url: this.href + "/get_skippers"}).done(function(response) {
      console.log(response);
    })
    console.log("A link was clicked!");
  });
});

function buildSkillHTML(skill) {
  return "<li><a href='/skills/" + skill.id + "'>" + skill.name + "</a></li>"
}
