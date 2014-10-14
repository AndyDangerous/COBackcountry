//
// var danger_level = new Array();
// danger_level[0] = 'No Rating';
// danger_level[1] = 'Low';
// danger_level[2] = 'Moderate';
// danger_level[3] = 'Considerable';
// danger_level[4] = 'High';
// danger_level[5] = 'Extreme';
//
// var danger_description = new Array();
// danger_description[0] = 'There is no avalanche forecast available.';
// danger_description[1] = 'Generally safe avalanche conditions. Watch for unstable snow on isolated terrain features.';
// danger_description[2] = 'Heightened avalanche conditions on specific terrain features. Evaluate snow and terrain carefully; identify features of concern.';
// danger_description[3] = 'Dangerous avalanche conditions. Careful snowpack evaluation, cautious routefinding and conservative decision-making essential.';
// danger_description[4] = 'Very dangerous avalanche conditions. Travel in avalanche terrain not recommended.';
// danger_description[5] = 'Avoid all avalanche terrain';
//
// var danger_color = new Array();
// danger_color[0] = '#808080';    // gray    - No Rating
// //danger_color[1] = '#50B848';    // lime    - Low
// danger_color[1] = '#4DB848';    // lime    - Low
// danger_color[2] = '#FCF200';    // yellow  - Moderate
// danger_color[3] = '#F7941E';    // orange  - Considerable
// danger_color[4] = '#CD1C24';    // red     - High
// danger_color[5] = '#231F20';    // black   - Extreme
//
// var danger_color_text = new Array();
// danger_color_text[0] = '#808080';    // gray    - No Rating
// //danger_color[1] = '#50B848';    // lime    - Low
// danger_color_text[1] = '#4DB848';    // lime    - Low
// danger_color_text[2] = '#DBD30F';    // yellow  - Moderate
// danger_color_text[3] = '#F7941E';    // orange  - Considerable
// danger_color_text[4] = '#CD1C24';    // red     - High
// danger_color_text[5] = '#231F20';    // black   - Extreme
//
//
// var danger_icon = new Array();
// danger_icon[0] = 'grey.png';    // gray    - No Rating
// danger_icon[1] = 'green.png';    // green - Low
// danger_icon[2] = 'yellow.png';    // yellow  - Moderate
// danger_icon[3] = 'orange.png';    // orange  - Considerable
// danger_icon[4] = 'red.png';    // red     - High
// danger_icon[5] = 'red.png';    // black   - Extreme
// var arrow_location = new Array();
// arrow_location[0] = "0px;";
// arrow_location[1] = "2px;";
// arrow_location[2] = "45px;";
// arrow_location[3] = "108px;";
// arrow_location[4] = "176px;";
// arrow_location[5] = "195px;";
//
//   //global variables
// var allZones = [], centerMarkers = {}, infowindow;
// var AKZones = [];
//
//  var myMap;
// zone = null;
// var iboxob;  // The created InfoBox object
// var infoLL;
//
// var d = new Date();
// var m = d.getMonth()+1;
// var dtime = m + "/" + d.getDate() + "/" + d.getFullYear() + " " + d.getHours() + ":" + d.getMinutes();
//
// var cap = {
//   init: function() {
// /* need to be able to set default center point and zoom level when centers frame this in */
// /* init settings - center lat/long
//                     zoom level
// */
//         /*get the local timezone */
//
//
//
//     var timezone = jstz.determine();
//     $("#tz").val(timezone.name());
//     $("#showtz").empty().append(timezone.name());
//
//     var latlng = new google.maps.LatLng(cap.lat, cap.lng);
//     var controlPosition = google.maps.ControlPosition.TOP_LEFT;
//     if (cap.controlPosition) controlPosition =   cap.controlPosition;
//
//     /* set to defaults if necessary */
//     if (cap.zoomControl === undefined)cap.zoomControl = true;
//     if (cap.panControl === undefined) cap.panControl = true;
//     if (cap.scrollwheel === undefined) cap.scrollwheel = true;
//     if (cap.draggable === undefined) cap.draggable = true;
//
//     if (cap.infoLat !== undefined) {
//       infoLL = new google.maps.LatLng(cap.infoLat, cap.infoLng);
//     }
//
//      var myOptions = {
//         zoom: cap.zoom,
//         center: latlng,
//         mapTypeControl: true,
//         mapTypeControlOptions: {
//            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
//         },
//         zoomControl: cap.zoomControl,
//         zoomControlOptions: {
//           style: google.maps.ZoomControlStyle.SMALL,
//           position: controlPosition
//         },
//         panControl: cap.panControl,
//         panControlOptions: {
//           position: controlPosition
//         },
//         scrollwheel: cap.scrollwheel,
//         draggable: cap.draggable,
//         mapTypeId: google.maps.MapTypeId.TERRAIN,
//         streetViewControl: false
//      };
//
//     myMap = new google.maps.Map(document.getElementById("map"), myOptions);
//
//      var zones = new Array();
//
//         //this is like a global infowindow - only one is used and content isupdated.
//      infowindow = new google.maps.InfoWindow( {
//          disableAutoPan : false
//      });
//     // google.maps.event.trigger(myMap,'resize');
//
//   google.maps.event.addListener(myMap, 'idle', function() {
//       var bounds = myMap.getBounds();
//
//       /* console.log('North East: ' +
//                   bounds.getNorthEast().lat() + ' ' +
//                   bounds.getNorthEast().lng());
//
//       console.log('South West: ' +
//                   bounds.getSouthWest().lat() + ' ' +
//                   bounds.getSouthWest().lng());  */
//     });
//
//    /* this would be a way to get server-side vector layers. Y ou can change the symbology and options */
//      /*var prwsf_zones = new gvector.PRWSF({
//                     url: "rest",
//                     geotable: "forecast_zone",
//                     fields: " id, center_id, url",
//                     uniqueField: "id",
//                     geomFieldName: "wkb_geometry",
//                     srid: 4326,
//                     showAll: true,
//                     symbology: {
//                         type: "single",
//                         vectorOptions: {
//                             fillColor: "#2f4a00",
//                             fillOpacity: 0.4,
//                             strokeWeight: 1.8,
//                             strokeColor: "#2f4a00",
//                             strokeOpacity: 1,
//                             clickable: false
//                         }
//                     }
//         });
//
//
//         prwsf_zones.setMap(myMap);   */
//
//
//      //now get zones and hazard ratings out of the database and translate to map objects.
//      // is there a way to only load what is needed in viewport - like via an extent
//
//       //$.getJSON('rest/getZoneJson.php',function(a) {
//       var dataString='tz='+ $("#tz").val();
//
//       //the no-cache is required to work on iOS6 since it ALWAYS caches POST request.
//       //testing with GET below
//     $.ajaxSetup({
//       type: 'POST',
//       headers: { "cache-control": "no-cache" }
//     });
//
//     $.ajax({
//        type: "GET",
//        url: "assets/php/getZoneJson.php",
//        data: dataString,
//        dataType: "json",
//        async: false,
//        success: function(a){
//         cap.loadJsonToMap(a, myMap, allZones);
//       }
//    });
//
//     $.ajax({
//        type: "GET",
//        url: "assets/php/getCenterMarkers.php",
//        data: dataString,
//        dataType: "json",
//        async: true,
//        success: function(a){
//         cap.loadMarkersToMap(a, myMap);
//       }
//    });
//
//
//     google.maps.Map.prototype.center_markers = new Array();
//
//     google.maps.Map.prototype.addCenterMarker = function(marker,map,id,url) {
//       this.center_markers[id] = marker;
//       google.maps.event.addListener(marker,'click',function() {
//          parent.window.location.href = url;
//         });
//
//    };
//   },   //end of init function
//
//   loadJsonToMap: function(a, map, zones) {
//     var zone_cnt = 0;
//  		var zoneStyle = {
//       strokeColor: "#000000",
//       strokeOpacity: 0.8,
//       strokeWeight: 1,
// 			fillColor: "#808080",
// 			fillOpacity: 0.7
// 		};
//
//     a.features=a.rows;
//     delete a.rows;
//     for(var b=0,d=a.features.length;b<d;b++){
//       a.features[b].type="Feature";
//       a.features[b].properties={};
//       for(var e in a.features[b].row)e=="geojson"?a.features[b].geometry=a.features[b].row.geojson:a.features[b].properties[e]=a.features[b].row[e];
//       delete a.features[b].row
//       if (a.features[b].geometry) {
//         var current = false;
//         /* this always has the most recent bulletins, but it may not be active, so check dates first */
//         if (dateWithin(a.features[b].properties['start_date'],a.features[b].properties['end_date'],dtime)) {
//           current = true;
//         }
//        zoneStyle.fillOpacity = 0.7;
//        zoneStyle.strokeColor = '#000000';    // red on black for extreme
//         //set fill color
//         if (current && a.features[b].properties['danger_rating'] != "") {
//           zoneStyle.fillColor = danger_color[a.features[b].properties['danger_rating']];
//           if (a.features[b].properties['danger_rating'] == 5) {
//             zoneStyle.fillOpacity = 0.8;
//             zoneStyle.strokeColor = '#CD1C24';    // red on black for extreme
//           }
//         } else {
//          zoneStyle.fillColor = '#808080';
//        }
//
//         zone = new GeoJSON(a.features[b].geometry, zoneStyle || null);
//
//          if (zone.error) {
//             alert("error" + zone.message);
//           } else {
//             //if a multi-polygon, this comes back as the first element of array .  If a polygon, just a single object.
//             if (zone[0] === undefined) {
//               zones.push(zone);
//             } else {
//               zones.push (zone[0]);
//             }
//             var z = zones.length - 1;
//             zones[z].setMap(map);
//             zones[z].html = cap.createInfoWindow(a.features[b]);
//             if (a.features[b].properties['url'] == "") {
//               zones[z].url = a.features[b].properties['zone_url'];
//             } else {
//               zones[z].url = a.features[b].properties['url'];
//             }
//         }
//         google.maps.event.addListener(zones[z],'click', function(event) {
//             /* parent.window.location.href = this.url;  */
//             parent.location.replace(this.url);
//         });
//         google.maps.event.addListener(zones[z], 'mouseover', function(event) {
//          this.setOptions({strokeWeight: 3});
//          /*this.setOptions({strokeColor: "#000000"}); */
//          /* look for a static latlng */
//          cap.openInfoBox(map, this, event.latLng);
//         });
//         google.maps.event.addListener(zones[z], 'mouseout', function() {
//            this.setOptions({strokeWeight: 1});
//            iboxob.close();
//         });
//
//      }
//     }   //for loop
//   },
//
//       /*for centers without zones - just need name for the title and link to their URL for click event */
//   loadMarkersToMap: function (a, map){
//     a.features=a.rows;
//     delete a.rows;
//     for(var b=0,d=a.features.length;b<d;b++){
//       a.features[b].properties={};
//       for(var e in a.features[b].row)e=="geojson"?a.features[b].geometry=a.features[b].row.geojson:a.features[b].properties[e]=a.features[b].row[e];
//
//        var _ID =  a.features[b].properties['id']
//        var _name =  a.features[b].properties['name']
//        var _url =  a.features[b].properties['url']
//        var _center = a.features[b].properties['center_point'];
//        var _lat =  a.features[b].properties['lat'];
//        var _lng =  a.features[b].properties['lng'];
//        var _icon =  a.features[b].properties['icon'];
//        if (_lat != 0) {
//         var point = new google.maps.LatLng(_center);
//         var point = new google.maps.LatLng(_lat,  _lng );
//         var marker = new google.maps.Marker({
//             position: point,
//             map: map,
//             icon: 'assets/icons/'+_icon,
//             title: _name
//         });
//         map.addCenterMarker(marker,map,_ID, _url);
//       }
//     };
//    },
//
//   createInfoWindow: function(info) {
//       var html =  document.createElement("div");
//       var current = false;
//       /* this always has the most recent bulletins, but it may not be active, so check dates first */
//       if (dateWithin(info.properties['start_date'],info.properties['end_date'],dtime)) {
//         current = true;
//       }
//
//       if (current === false) info.properties['danger_rating'] = 0;
//       if ((info.properties['danger_rating']) == "") info.properties['danger_rating'] = 0;
//
//       html = "<div style='color: #000; background-color: " + danger_color[info.properties['danger_rating']] + "; height: 52px;' >";
//       html += "<div style='float: left;'>";
//       html += "<img src='assets/icons/" + danger_icon[info.properties['danger_rating']] + "' style='width: 60px; height: 44px;'/>";
//       html+= "</div><div class='infobox'>";
//       if (info.properties['danger_rating'] == 5)  {
//         html += "<span style='color: #CD1C24;'>";    // red on black for extreme
//       }
//
//       if (info.properties['name'].length > 21) {
//         html += "<span style='font-size: 12px; font-weight: bold; margin-left: -12px;'>";
//       } else {
//         html += "<span style='font-size: 15px; font-weight: bold; margin-left: -5px;'>" ;
//       }
//       html += info.properties['name'] + "</span><br/>";
//       html += "<h3 style='font-size: 14px; font-weight: bold; margin: 3px 0;'>" ;
//
//
//       if (info.properties['danger_rating'] != 0) html += info.properties['danger_rating'] + "&nbsp;" ;
//       html +=  danger_level[info.properties['danger_rating']] + "</h3>" ;
//       if (info.properties['danger_rating'] == 5)  html += "</span>";
//
//       html+= "</div><div style='clear: both;'></div></div>";
//       html += "<div style='margin: 2px 3px; '> ";
//       /* not using yet */
//      /* if (info.properties['product'] == 'Warning') {
//         html += "<img src='assets/icons/aviWarning.png alt='Warning' title='Avalanche Warning' ' style='width: 70px; height: 52px;'/>";
//       } else if (info.properties['product'] == 'Watch' ) {
//         html += "<img src='assets/icons/aviWatch.png alt='Watch' title='Avalanche Watch' ' style='width: 70px; height: 52px;'/>";
//       } else if (info.properties['product'] == 'Special') {
//         html += "<img src='assets/icons/SpecialStatement.png alt='Special Statement' title='Special Statment' ' style='width: 70px; height: 52px;'/>";
//       }*/
//
//       if (current) {
//         html += "<div style='margin:  2px;  font-size: 12px; border-bottom: 1px solid #666;'> Effective until " + info.properties['end_date'] + " </br>   </div>";
//       } else {
//         if (info.properties['end_date'] != "") {
//           html += "<div style='margin: 2px; font-size: 12px; border-bottom: 1px solid #666;'> Last advisory expired " + info.properties['end_date'] + "</br> </div>";
//           /*The last rating was " + danger_level[info.properties['danger_rating']] + "</div>"; */
//         }
//       }
//       if (info.properties['off_season'] == 't') {
//         html += "<div style='margin: 0 2px; font-size: 12px;'> This avalanche center has stopped issuing daily forecast for the 2013/2014 season.</div></div>";
//         html += "<div>";
//       } else {
//         html += "<div style='margin: 0 2px; font-size: 12px;'>Travel Advice: " + danger_description[info.properties['danger_rating']]  + "</div></div>";
//         html += "<div>";
//
//         html+= "<div id='scale' >";
//         if (info.properties['danger_rating'] != 0) {
//           html+= "<div ><span style='position: relative; left: " + arrow_location[info.properties['danger_rating']] + " '><img src='assets/icons/arrow_sm.png'/></span></div>";
//         }
//
//         html += " <div style='float: left; background: #50B848; padding: 2px 1px;'>LOW</div><div style='float: left; background: #FFF200; padding: 2px 1px;'>MODERATE</div>";
//         html += "<div style='float: left; background: #F7941E; padding: 2px 1px;'>CONSIDERABLE</div><div style='float: left; background: #ED1C24; padding: 2px 2px;'>HIGH</div> <div style='float: left; background: #000; color: #ED1C24; padding: 2px 1px 2px 1px;'>EXTREME</div>";
//         html += "</div>";
//       }
//
//     return html;
//   },
//   /* the latLng is that of the event that fired the mouseover - perhaps want to use a zone latlng instead? */
//   openInfoBox: function(map, zone,latLng) {
//     var autoPan = false;
//
//     if (cap.disableAutoPan !== undefined) autoPan = cap.disableAutoPan;
//     if (infoLL) latLng = infoLL;
//     /*could get bounding box and use top left */
//
// /* get width of map, if under a certain amount make the info box smaller */
//     var infoOptions = {
//       content: zone.html,
//       boxStyle: {
//          border:"2px solid #666",
//          background: "white",
//          opacity: 0.9,
//          width: "246px"     /* width required to show the color scale */
//       },
//       disableAutoPan: autoPan,
//       maxWidth: 0,
//       /* pixelOffset: new google.maps.Size(3, 3), */
//       position: latLng,
//       zIndex: 120,
//       infoBoxClearance: new google.maps.Size(1, 1),
//       isHidden: false,
//       closeBoxURL: "",
//       pane: "floatPane",
//       enableEventPropagation: false
//    };
//
//    iboxob = new InfoBox(infoOptions);
//    iboxob.open(map);
//
//   }
//
//
// };  //cap object
// function dateWithin(beginDate,endDate,checkDate) {
//   var b,e,c;
//   b = Date.parse(beginDate);
//   e = Date.parse(endDate);
//   c = Date.parse(checkDate);
//   if((c <= e && c >= b)) {
//           return true;
//   }
//   return false;
// }
//
//
//     //jquery extenstion to get query string
// $.extend({
//   getUrlVars: function(){
//     var vars = [], hash;
//     var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
//     for(var i = 0; i < hashes.length; i++)
//     {
//       hash = hashes[i].split('=');
//       vars.push(hash[0]);
//       vars[hash[0]] = hash[1];
//     }
//     return vars;
//   },
//   getUrlVar: function(name){
//     return $.getUrlVars()[name];
//   }
// });
