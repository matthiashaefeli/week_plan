
// add or remove like of meal
function like(event, id, link, remove = false) {
  event.preventDefault();
  $.ajax({
    url: '/likes',
    method: 'post',
    data: { id },
    beforeSend: function() {
      link.find('.icons').toggle();
    },
    success: function(response) {
      if (remove == true ) {
        link.parents('.my_meal_container').remove();
      }
      // if (response.notice != 'saved') {
      //   let p = $('<p></p>')
      //   p.text(response.notice)
      //   $('#meals').append(p)
      //   link.find('.icons').toggle();
      // }
    }
  })
};

