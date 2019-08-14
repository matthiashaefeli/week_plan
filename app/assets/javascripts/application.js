// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require jquery.ui.touch-punch
//= require jquery-ui/core
//= require jquery-ui/widget
//= require jquery-ui/position
//= require activestorage
//= require turbolinks
//= require_tree .

function clear_meals() {
  $('.category, #meals').toggle();
};

function add_entry_form(event, link, entry_form, url) {
  event.preventDefault();
  let parent = link.parent();
  entry_form.remove();
  $.ajax({
    url: url,
    method: 'get',
    success: function(response) {
      $(response).insertAfter(parent);
    }
  })
};

function add_input(input, url, class_name) {
  input.siblings('p').remove();
  let name = input.val();
  let p = $('<p></p>');
  $.ajax({
    url: url,
    method: 'post',
    data: { name },
    success: function(response) {
      if (response.notice == 'saved') {
        p.addClass(class_name).text(name);
        $('.mf_container').prepend(p);
        input.val('').focus();
      } else {
        p.text(response.notice)
        input.parent().append(p)
      }
    }
  })
};