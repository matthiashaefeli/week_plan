// add meal to week plan
function selectMenu(button) {
  let id = button.attr('id').replace('recipe_id', '')
  $.ajax({
    url: '/likes/' + id,
    method: 'put',
    success: function(response) {
      let color = response.notice == false ? 'white' : '#A3D144';
      button.css('background-color', color);
    }
  })
};

// add or remove like of meal
function like(event, link) {
  event.preventDefault();
  let id = link.parent().siblings('input').val();
  $.ajax({
    url: 'likes',
    method: 'post',
    data: { id },
    success: function() {
      link.find('.icons').toggle();
    }
  })
};

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
  let recipe_details = link.parent().siblings('.favorite_meals_recipe').find('.show_recipe_details').clone();
  open_box(recipe_details)
};
