
// add or remove like of meal
function like(event, link) {
  event.preventDefault();
  let id = link.parent().parent().find('.id').val();
  let local = link.parent().parent().find('.local').val();
  $.ajax({
    url: 'likes',
    method: 'post',
    data: { id, local },
    beforeSend: function() {
      link.find('.icons').toggle();
    },
    success: function(response) {
      if (response.notice != 'saved') {
        let p = $('<p></p>')
        p.text(response.notice)
        $('#meals').append(p)
        link.find('.icons').toggle();
      }
    }
  })
};

