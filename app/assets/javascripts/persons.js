jQuery(function($){
  $('.deleteAction').click( function() {
    var current_item = $(this).parents('.card')[0];
    if (confirm("Точно удалить?")){
      $.ajax({
        url: "/tasks/" + $(current_item).attr('data-task_id'),
        type: "POST",
        data: { _method: 'DELETE' },
        success: function() {
          $(current_item).fadeOut(700);
        }
      });
    };
  });
return false;
});
