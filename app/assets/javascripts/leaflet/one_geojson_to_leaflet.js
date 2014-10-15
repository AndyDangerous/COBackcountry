var $;

$ = jQuery;

$(document).on("ready page:load", function(){
  var map, geojsonLayer, geojsonUrl, mahLayer
  map = L.map('map').setView([39, -106], 7);

  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
    subdomains: ['otile1', 'otile2', 'otile3', 'otile4'],
    maxZoom: 14
  }).addTo(map);

  mahLayer = L.featureGroup();

var numberOfGeometries = gon.numberOfGeometries || 1;
for (var i = 1; i <= numberOfGeometries; i++) {
    var counter = gon.counter || i;

    geojsonUrl = "/api/v1/"+ gon.geometry_url +"/"+ counter +".json";

    var geojsonLayer = new L.GeoJSON();

      $.getJSON(geojsonUrl, function(data){
        console.log("success")
          L.geoJson(data, {
            style: function (feature) {
                return {color: "red", radius: 5};
            // },
            }.addTo(mahLayer),

            onEachFeature: function (feature, layer) {
                layer.bindPopup(
    					  '<a href="/ski_places/'+ feature.properties.id +'"> '+ feature.properties.name +'</a>'
    					  );
            }
          });
          // }).addTo(mahLayer);

          // https://github.com/Leaflet/Leaflet.markercluster/issues/350
      });
}
mahLayer.addTo(map);
bounds = mahLayer.getBounds();
map.setBounds(bounds);

})
