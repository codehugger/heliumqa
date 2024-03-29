// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery/jquery-3.1.1.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.is.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.sv.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.no.js
//= require inspinia.js
//= require Chart.bundle
//= require chartkick
//= require cocoon
//= require turbolinks
//= require sorttable
//= require_tree .

// TODO: remove jquery dependency
// document.addEventListener('turbolinks:load', () => {
$(document).ready(function () {
  // jQuery Bootstrap DatePicker
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    todayHighlight: true,
    todayBtn: true,
    orientation: "bottom"
  });
  $("tr[data-link]").click(function() {
    window.location = $(this).data("link")
  })
})
