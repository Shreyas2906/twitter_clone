// app/assets/javascripts/tweets.js
$(document).on('turbolinks:load', function() {
  $('#new_tweet').on('ajax:success', function(event) {
    $('#tweets').prepend(event.detail[0].tweet);
    $('#tweet_content').val('');
    alert(event.detail[0].message);
  });

  $('.edit_tweet').on('ajax:success', function(event) {
    $(this).closest('.tweet').replaceWith(event.detail[0].tweet);
    alert(event.detail[0].message);
  });

  $('.delete_tweet').on('ajax:success', function(event) {
    $(this).closest('.tweet').fadeOut();
    alert(event.detail[0].message);
  });
});

// app/assets/javascripts/tweets.js
$(document).on('turbolinks:load', function() {
  $('#tweetModal').on('shown.bs.modal', function () {
    $('#tweet_content').focus();
  });
});
