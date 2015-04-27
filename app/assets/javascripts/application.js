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
//= require turbolinks
//= require_tree .

// UNCOMMENT LINES BELOW TO MAKE POKEMON RUN

// $(document).ready(function(){
//   animatePokemon();
// });

// function NewPosition(){
//   var h = $(window).height();
//   var w = $(window).width();
//   console.log(Math.random())
//   var nh = Math.random() * h;
//   var nw = Math.random() * w;
//   return [nh,nw];    
// }

// function animatePokemon(){
//   $('.pokemon-container').each(function( index ) {
//     var newPos = NewPosition();
//     var duration = Math.floor(Math.random() * 10000);
//     $(this).animate({ 
//       top: newPos[0], 
//       left: newPos[1] 
//       }, duration, function(){
//         animatePokemon();        
//     });
//   });
// };
