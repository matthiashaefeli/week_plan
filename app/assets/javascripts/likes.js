
// add or remove like of meal
function like(event, link) {
  event.preventDefault();
  let id = link.parent().parent().find('.id').val();
  let local = link.parent().parent().find('.local').val()
  $.ajax({
    url: 'likes',
    method: 'post',
    data: { local, id },
    beforeSend: function() {
      link.find('.icons').toggle();
    },
    success: function() {
    }
  })
};

