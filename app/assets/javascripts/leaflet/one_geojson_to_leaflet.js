var $;

$ = jQuery;
$(document).on("ready page:load", function(){
  var map, geojsonLayer, geojsonUrl
  map = L.map('map').setView([39, -106], 7);

  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
    subdomains: ['otile1', 'otile2', 'otile3', 'otile4'],
    maxZoom: 14
  }).addTo(map);

  debugger

  geojsonUrl = "snotel_stations/2.json";
  geojsonLayer = L.geoJson.addTo(map);
  geojsonLayer.addData(geojsonUrl);

})


// $.getJSON( "snotel_stations/2.json", function( data ) {
//   var items = [];
//   $.each( data, function( key, val ) {
//     items.push( "<li id='" + key + "'>" + val + "</li>" );
//   });
//
//   $( "<ul/>", {
//     "class": "my-new-list",
//     html: items.join( "" )
//   }).appendTo( "body" );
// });
