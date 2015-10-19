/*$(function () { 
  $(document).on("ajax:success", "form#new_review", function() {
    console.log(data);
  });
});
*/

$(function () { 
  console.log('sasda');
  $('body').on("ajax:success",".form-review" , function(data) {
    console.log(data);
  });
});