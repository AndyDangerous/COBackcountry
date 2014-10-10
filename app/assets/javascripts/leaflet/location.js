// // var $;
// //
// // $ = jQuery;
// //
// $(document).on("ready page:load", function(){
//   var fourteeners, location, map, _i, _len, _ref, _results, markers;
//   // map = L.map('map').setView([39, -106], 7);
//   // L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
//   //   attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
//   //   subdomains: ['otile1', 'otile2', 'otile3', 'otile4'],
//   //   maxZoom: 14
//   // }).addTo(map);
//   fourteeners = L.geoJson().addTo(map);
//   _ref = gon.mountains;
//   _results = [];
//   for (_i = 0, _len = _ref.length; _i < _len; _i++) {
//     location = _ref[_i];
//     _results.push(fourteeners.addData(location));
//   }
//   return _results;
//
//
//   // markers = L.newMarkerClusterGroup();
//   // var points_rand = L.geoJson(points, {
//   //     onEachFeature: function (feature, layer) //functionality on click on feature
//   //         {
//   //         layer.bindPopup("hi! I am one of thousands"); //just to show something in the popup. could be part of the geojson as well!
//   //         }
//   // });
//   // map.addLayer(markers);
//   // map.fitBounds(markers.getBounds()); //set view on the cluster extent
//
//
//
// //   var avyForecastZones = L.geoJson().addTo(map);
// //   var getZones = $.getJSON("/avalanche_forecast_zones.json")
// //     for(var i = 0; i < getZones.length; i++) {
// //       avyForecastZones.addData(getZones[i]);
// //     }
// // ;
// // });
// //
// //
// // $(document).on("ready page:load", function(){
// //
// // });
// //
// //
// //
// //
// // map.addLayer(markers);      // add it to the map
// // map.fitBounds(markers.getBounds()); //set view on the cluster extent
