var $;

$ = jQuery;
$(document).on("ready page:load", function(){
  var map, geojsonLayer, geojsonUrl
  map = L.map('map').setView([39, -106], 7);

  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
    subdomains: ['otile1', 'otile2', 'otile3', 'otile4'],
    maxZoom: 18
  }).addTo(map);

  geojsonUrl = "snotel_stations/2.jsonx ";
  geojsonLayer = L.GeoJSON().addTo(map);
  geojsonLayer.addData(geojsonUrl);

})
