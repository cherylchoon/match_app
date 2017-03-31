// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function () {
   $("input[name='profile[ethnicity_ids][]']").change(function () {
      var maxAllowed = 2;
      var cnt = $("input[name='profile[ethnicity_ids][]']:checked").length;
      if (cnt > maxAllowed)
      {
         $(this).prop("checked", "");
         alert('You may only check ' + maxAllowed + ' ethnicities for your profile!');
     }
  });

   $("input[name='profile[religion_ids][]']").change(function () {
      var maxAllowed = 2;
      var cnt = $("input[name='profile[religion_ids][]']:checked").length;
      if (cnt > maxAllowed)
      {
         $(this).prop("checked", "");
         alert('You many only check ' + maxAllowed + ' religions for your profile!');
     }
  });

   $("input[name='profile[interest_ids][]']").change(function () {
      var maxAllowed = 5;
      var cnt = $("input[name='profile[interest_ids][]']:checked").length;
      if (cnt > maxAllowed)
      {
         $(this).prop("checked", "");
         alert('You may only check ' + maxAllowed + ' interests for your profile!');
     }
  });
});
