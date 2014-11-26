 $(function() {
   $('.subscribe').click(function(event){
   event.preventDefault();
   var $myForm = $(this).parents('form');
   $.ajax($myForm.attr('action'), {
     success: function () { $(this).children('.subscribe').hide();},
     type: 'POST',
     error: function () { alert('Error in saving!');}
     });
   });
 });
