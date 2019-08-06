
// search for meals
function meal_searcher(form) {
  const query = form.find('#query').val()
  $.ajax({
    url: form.attr('action'),
    method: form.attr('method'),
    data: form.serialize(),
    success: function(response) {
      $('#catMeals, #description, #mealTitle').html('');
      $('#mealTitle').html('Results for: ' + query);
      $('#catMeals').html(response);
      $('.category, #meals, .meal_search').toggle();
    }
  })
}