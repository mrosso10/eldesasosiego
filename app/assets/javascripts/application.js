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

//= require pg_rails/librerias
//= require pg_rails
//= require tinymce

$(document).ready(function() {
  PgRails.bindear('body')
  $(".best_in_place").best_in_place();
  $('form.simple_form').each(function(i,e) {
    $(e).validate();
  });
  $('.datefield').datepicker({
    'format': 'dd/mm/yyyy',
    'todayBtn': 'linked',
    'autoclose': 'true',
    'language': 'es',
  });

  $(".chosen-select").chosen();

  // Smooth scroll para cuando clickean en un link de la misma página
  $('a[href^="#"]').each(function(i, anchor) {
    $(anchor).click(function (e) {
      e.preventDefault();

      $($(anchor).attr('href'))[0].scrollIntoView({
        behavior: 'smooth'
      });
    });
  });

  tinyMCE.init({
    selector: '.tinymce'
  });

});
