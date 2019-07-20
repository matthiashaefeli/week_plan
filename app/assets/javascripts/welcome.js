
function clear_fields() {
  $('.week_box').children('img').remove();
  $('.remove_button').remove();
}

function create_week() {
  let ids = $('.week_box').map(function() { return $(this).children('img').attr('value') }).get();
  // let days = $('.week_box').map(function() { return $(this).children('p').text().replace('Remove', '') }).get();
  let weekdays = []
  $('.week_box').each(function() {
    if ($(this).children('img').length > 0) {
      let weekday = $(this).children('p').text().replace('Remove', '')
      weekdays.push(weekday)
    }
  })
  $.ajax({
    url: '/weeks',
    method: 'post',
    data: { ids, weekdays },
    success: function(response) {
      $('#success_text').html(response)
      clear_fields()
    }
  })
}
