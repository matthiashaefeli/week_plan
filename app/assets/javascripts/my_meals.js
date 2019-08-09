// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// add recipe to box
function get_recipe(event, id) {
  event.preventDefault();
  $.ajax({
    url: '/my_meals/' + id,
    method: 'get',
    success: function(response) {
      open_box(response)
    }
  })
};

// delete meal
function delete_meal(event, id, link) {
  event.preventDefault();
  $.ajax({
    url: '/my_meals/' + id,
    method: 'delete',
    success: function(response) {
      if (response.notice == 'ok') {
        link.parents('.my_meal_container').remove();
      } else {
        $('#myMeals').append(response.notice)
      }
    }
  })
}

// delete ingredient
function delete_ingredient(event, id, link) {
  event.preventDefault();
  let to_remove = link.parents('tr');
  $.ajax({
    url: '/ingredients/' + id,
    method: 'delete',
    success: function(response) {
      if (response.notice == 'ok') {
        to_remove.remove();
      }
    }
  })
}

// add more ingredients form
function more_ingredients(event, button) {
  event.preventDefault();
  let tr = button.parents('tr');
  let clone = tr.clone();
  tr.find('input').attr('disabled', true)
  tr.find('select').attr('disabled', true)
  tr.find('#foodSearch').remove();
  tr.find('#measureSearch').remove();
  let id = parseInt(clone.attr('id').replace('ingredientsToMeal', '')) + 1;
  clone.attr('id', 'ingredientsToMeal' + id);
  button.hide();
  clone.find('#foodSearch').val('');
  clone.find('#measureSearch').val('');
  clone.find('#my_meal_ingredients').val('');
  clone.insertBefore(tr);
}