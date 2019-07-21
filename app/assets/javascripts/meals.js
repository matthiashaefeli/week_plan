
// add recipe to box
function get_recipe(event, link) {
  event.preventDefault();
  let id = link.children('input').val();
  $.ajax({
    url: 'meals/recipes',
    method: 'get',
    data: { id },
    success: function(response) {
      open_box(response)
    }
  })
};

// add favorite meal to box
function get_recipe_for_fav_meal(event, link) {
  event.preventDefault();
  let recipe_details = link.parent().parent().siblings('.favorite_meals_recipe').find('.show_recipe_details').clone();
  open_box(recipe_details)
};
