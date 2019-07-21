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
    success: function() {
      link.parents('.favorite_meal').remove();
    }
  })
};