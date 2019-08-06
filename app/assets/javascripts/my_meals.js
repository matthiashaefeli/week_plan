// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// function like(event, id, link) {
//   event.preventDefault();
//   $.ajax({
//     url: 'likes',
//     method: 'post',
//     data: { id },
//     success: function(response) {
//       link.parents('.my_meal_container').remove();
//     }
//   })
// };

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