
// add or remove like of meal
function like(event, link) {
  event.preventDefault();
  let id = link.parent().parent().find('input').val();
  $.ajax({
    url: 'likes',
    method: 'post',
    data: { id },
    beforeSend: function() {
      link.find('.icons').toggle();
    },
    success: function() {
    }
  })
};

