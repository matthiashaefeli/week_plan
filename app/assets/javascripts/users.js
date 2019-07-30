function set_user_info(checkbox) {
  let user_id = checkbox.attr('id');
  let info = checkbox[0].checked
  $.ajax({
    url: '/users/' + user_id,
    method: 'put',
    data: { info },
    success: function(response) {
      checkbox[0].checked = info
    }
  })
};

function copy(button) {
  button.parent().find('.email_array').focus();
  button.parent().find('.email_array').select();
  document.execCommand('copy');
};
