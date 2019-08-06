
// add or remove like of meal
function like(event, id, link) {
  event.preventDefault();
  $.ajax({
    url: 'likes',
    method: 'post',
    data: { id },
    beforeSend: function() {
      link.find('.icons').toggle();
    },
    success: function(response) {
      // if (response.notice != 'saved') {
      //   let p = $('<p></p>')
      //   p.text(response.notice)
      //   $('#meals').append(p)
      //   link.find('.icons').toggle();
      // }
    }
  })
};

