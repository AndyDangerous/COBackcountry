var $;

$ = jQuery;

$(document).on("ready page:load", function(){
  var fourteeners, location, map, _i, _len, _ref, _results;
  map = L.map('map').setView([39, -106], 7);
  L.tileLayer('http://{s}.mqcdn.com/tiles/1.0.0/map/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright" title="OpenStreetMap" target="_blank">OpenStreetMap</a> contributors | Tiles Courtesy of <a href="http://www.mapquest.com/" title="MapQuest" target="_blank">MapQuest</a> <img src="http://developer.mapquest.com/content/osm/mq_logo.png" width="16" height="16">',
    subdomains: ['otile1', 'otile2', 'otile3', 'otile4'],
    maxZoom: 18
  }).addTo(map);
  fourteeners = L.geoJson().addTo(map);
  _ref = gon.mountains;
  _results = [];
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    location = _ref[_i];
    _results.push(fourteeners.addData(location));
  }
  return _results;
});
