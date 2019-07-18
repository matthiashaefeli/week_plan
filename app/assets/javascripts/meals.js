function recipeDetails(button) {
  button.parent().toggle();
  button.parent().siblings().toggle()
};

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

function get_recipe(event, link) {
  event.preventDefault();
  let id = link.children('input').val();
  $.ajax({
    url: 'meals/recipes',
    method: 'get',
    data: { id },
    success: function(response) {
      $('.meal_show_recipe').html('')
      $('.meal_show_recipe_background').toggle();
      $('.meal_show_recipe').html(response)
    }
  })
};
