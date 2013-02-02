// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//
// Legacy code


function fillExample() {
  $('#regexp').attr('value', "\\((\\d+)\\)\\.\\((\\d+)\\)\\.\\((\\d+)\\)");
  $('#string_comparison').attr('value', "(123).(456).(789)");
  $('#replacement').attr('value', "\\1\\2\\3");
  perform();
}

function toggle_spinner() {
  $('#submit').toggle();
  $('#spinner').toggle();
}

function perform() {
  regexp_string = $('#regexp').val();
  caret = $('#caret').val();
  text = $('#string_comparison').val();
  replacement = $('#replacement').val();

  post_data = { regexp: regexp_string, caret: caret, string_comparison: text, replacement: replacement } 


  $.post('/home/create', post_data, function(data) {
      toggle_spinner(); // Without this, it doesn't work. WTF jquery?
      $('#result').html('');
      $('#result').html(data);
  })

  toggle_spinner();

}

