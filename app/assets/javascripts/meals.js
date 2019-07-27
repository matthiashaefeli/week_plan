
// add recipe to box
function get_recipe(event, link) {
  event.preventDefault();
  let local = link.find('.local').val();
  let id = link.find('.id').val();
  $.ajax({
    url: 'meals/recipes',
    method: 'get',
    data: { local, id },
    success: function(response) {
      open_box(response)
    }
  })
};

// add favorite meal to box
function get_recipe_for_fav_meal(event, link) {
  event.preventDefault();
  let id = link.children('input').val();
  $.ajax({
    url: '/meals/show_details',
    method: 'get',
    data: { id },
    success: function(response) {
      open_box(response)
    }
  })
};
