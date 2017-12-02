$(document).ready(function() {
  $(".autocomplete").autocomplete({
    data: {
      Jaipur: null,
      Udaipur: null,
      "Mount Abu": null
    }
  });
  $("input:radio").click(function() {
    if ($(".guide").is(":checked")) {
      $("#guide").show();
    } else {
      $("#guide").hide();
    }
  });
  $("#guide").hide();
  $("select").select();
});
