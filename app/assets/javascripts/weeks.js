// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function delete_week(event, id, link) {
  event.preventDefault();
  let to_delete = link.parents('.week_details');
  $.ajax({
    url: 'weeks/' + id,
    method: 'delete',
    success: function(response) {
      if (response.notice == 'saved') {
        to_delete.remove();
      }
    }
  })
};

function delete_like(event, link) {
  event.preventDefault();
  let id = link.find('input').val();
  $.ajax({
    url: '/likes',
    method: 'post',
    data: { id },
    success: function(response) {
      if (response.notice == 'saved') {
        link.parents('.favorite_meal').remove();
      }else {
        let p = $('<p></p>')
        p.text(response.notice)
        p.insertAfter('#whiteDiv')
      }
      
    }
  })
};

function grocery_list(event, id) {
  event.preventDefault();
  $.ajax({
    url: 'weeks/' + id,
    method: 'get',
    success: function(response) {
      open_box(response)
    }
  })
}