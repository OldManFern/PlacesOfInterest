 function getLocation() {
    
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(addToLandL);
                    
                }
                else{
                    document.getElementById("lat").value = "didnt work";
                }

            }

            function addToLandL(location) {
                var latd =0.0;
                    latd = parseFloat(location.coords.latitude);
                var long =0.0;
                    long = parseFloat(location.coords.longitude);
                
                document.getElementById("lat").value = location.coords.latitude;
                document.getElementById("lon").value = location.coords.longitude;
                document.getElementById("lat").readOnly = true;
                document.getElementById("lon").readOnly = true;
                initMap(latd, long);
            }
            
            
            
            function initMap(latd, long) {
                var latdd = parseFloat(latd);
                var longg = parseFloat(long);
                var myLatLng = {lat: latdd, lng: longg};
                
                var map = new google.maps.Map(document.getElementById("map"), {
                    center: myLatLng,
                    scrollwheel: false,
                    zoom: 16
                  });

              
              var marker = new google.maps.Marker({
                map: map,
                position: myLatLng,
                title: 'Hello World!'
              });
            }
            