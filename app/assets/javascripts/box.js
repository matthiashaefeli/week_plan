function open_box(content) {
  $('.content').html('')
  $('.box_background').toggle();
  $('.content').append(content);
  $('.show_box').toggle();
}

function close_box() {
  $('.box_background, .show_box').toggle();
  $('.content').html('');
}

