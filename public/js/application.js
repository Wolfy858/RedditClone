$(document).ready(function() {
  $(".vote-button").click(function(event){
    event.preventDefault();

    var web_address= $(this).closest('form').attr("action");

    var upvote_status = $(this).hasClass("upvote-button");
    var self = this;

    var data= { upvote: !!upvote_status};
    console.log(data);

    var request = $.ajax({
      url: web_address,
      method: "POST",
      data: data
    });

    request.done(function(response){
      console.log(response);
      var js_object = JSON.parse(response);
      $(self).closest(".post-data").find(".karma").text("Karma: "+js_object.karma);
    });

  })
});
