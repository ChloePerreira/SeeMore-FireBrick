 $(function() {
   $('.subscribe').click(function(event){
    var $button = $(this);
    event.preventDefault();
    var $myForm = $(this).parents('form');
    $.ajax($myForm.attr('action'), {
      success: function () { $button.hide();},
      type: 'POST',
      error: function () { alert('Error in saving!');}
    });
  });
 });
