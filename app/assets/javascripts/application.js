// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require websocket_rails/main
//= require materialize-sprockets
//= require_tree .
//jQuery(function ($) {
//var dispatcher = new WebSocketRails('localhost:3000/websocket');
//dispatcher.on_open = function (data) {
//    console.log('Connection has been established: ', data);
//};
//});
jQuery(function ($) {
    var loaded = function () {
        $('select').material_select();
    }
    $(document).on("page:load ready", loaded);
});