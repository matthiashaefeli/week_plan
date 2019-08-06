// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function delete_meal(e) {
  let id = e.parent('div').find('input').val();
  $.ajax({
    url: '/my_meals/' + id,
    method: 'delete',
    success: function(response) {
      if (response.notice == 'ok') {
        e.parents('.my_meal_container').remove();
      }
    }
  })
};

// add recipe to box
function get_recipe(event, id) {
  event.preventDefault();
  $.ajax({
    url: 'my_meals/' + id,
    method: 'get',
    success: function(response) {
      open_box(response)
    }
  })
};