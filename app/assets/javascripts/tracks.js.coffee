$("#submit_query").on "click", (event) ->
  event.preventDefault()

  query = $("#search_query").val()

  if query == ""
    alert "you must enter a soundcloud username!"
  else
    SC.get "/users",
    q: query
    limit: 10,
    (users ) ->
      console.log(users);


# // $('#information').on('click', function(){
# //    $("#information").slideToggle('slow');
# //    });

# //  	map = L.map('map').setView([43.07573,-89.401047], 3);

# // 	L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
# // 		attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors <a href="/">Home</a> '
# // 	}).addTo(map);

# // var soundIcon = L.icon({
# //     iconUrl: "<%= asset_path( 'soundcloud.png' ) %>",
# //     iconSize:     [70, 70],
# //     iconAnchor:   [35, 35],
# //     popupAnchor:  [-3, -56]
# // });

# //    for (var index in gon.coordinates){
# //    	(function(index){
# // 	   	window["fun"+index] = function(){ $("#information").slideToggle('slow'); SC.oEmbed(gon.permalink_url[index], {color: "003a3e"}, document.getElementById("information"))}
# // 	   	L.marker(gon.coordinates[index], {icon: soundIcon}).addTo(map).bindPopup("<img src=" + gon.track_image[index] + ">" + "<p>" + gon.track_title[index] + "</p>" + '<a onclick="fun'+ index + '()">'+ "<img src=" + "'<%= asset_path( 'play.gif' ) %>'" + "height=" + "'30px'" + ">" + "</a>");
# //   	})(index)
# //    }
# });