 // Place all the behaviors and hooks related to the matching controller here.
 // All this logic will automatically be available in application.js.
 // You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $(".toggle-comment-option ").on('click', function() {
    $(this).parent().parent().find(".answer-comments").toggle();
  });
});
