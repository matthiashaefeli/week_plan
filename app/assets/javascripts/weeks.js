// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function delete_week(i) {
  let id = i.parents('tr').find('input').val();
  let to_delete = i.parents('.week_details');
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

function grocery_list(list) {
  let id = list.parents('table').find('input').val()
  $.ajax({
    url: 'weeks/' + id,
    method: 'get',
    success: function(response) {
      open_box(response)
    }
  })
}