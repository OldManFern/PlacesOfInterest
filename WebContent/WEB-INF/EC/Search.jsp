<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        
        <meta charset="utf-8" />
        <title>Places of Interest</title>
        
        <!-- Link for BootStrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        
        
        <!-- For google maps -->
            <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5vkBG-MHiCAsRU9WPz548ZyG63C5vlNc&callback=initMap">
    </script>

        <!-- Local Script to find latitude and longitude -->
        <script>
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
            
            
        </script>
        
        <!-- Help with things Bootstrap cant do-->
        <style>
          
            .top-margin-50 {margin-top: 50px;}

            .top-margin-10 {margin-top: 10px;}


            .table-text-center{text-align: center;}

            .background-skyblue{background-color: skyblue;}
            
            .map { height: 400px;
                    width: 400px}
            
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            
        </style>

    </head>
    
    <body>
        <div class="container">
            <div class="row">
                 <div class="row">
                     <div class="col-sm-offset-2 col-sm-8">
                         
                         <div class="panel panel-default addrounddashed">
                             <center> <h1>Places Of Interest</h1> </center>                        
                         </div>
                        
  

                    </div>
                </div>
                 <div class="row top-margin-50">
                     <div class="col-sm-offset-2 col-sm-8">
                         <div class="well">
                            <form action="" method="post">
                             <div class="row input-group">
                             	<input type="hidden" name ="visited" value ="true"/>
                                <input type="text" name="lat" id="lat" class="form-control" placeholder="Latitude"/>
                                <span class="input-group-addon">,</span>
                                <input type="text" name="lon" id="lon" class="form-control" placeholder="Longitude"/>
                                <span class="input-group-addon"> OR </span>
                                 
                                <button type="button" class="form-control background-skyblue" onclick="getLocation()">Locate Me</button>
                                 <div class="input-group-addon">
										<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
									</div>
                            </div>
                            <div class="row top-margin-10">
                            <input type="text" name="radius" id="radius" class="form-control" required="required" placeholder="Radius in Miles">
                            </div>
                            <div class="row top-margin-10">
                                <center><button type="submit" class="btn btn-primary">Find Places</button></center>
                            </div>
                                
                             </form>
                     
                        </div>
  

                     </div>

                                       
                </div>
                <div id="results" class="row top-margin-50">
                    <div id="listOfResults" class="well col-md-6">
                    
                    <%= (String)request.getAttribute("results") %>


                    </div>
                    <div id="map" class="map">
                    
                    </div>
        
                    
                    
                </div>
            
            </div>
            
        </div>
        

        
        
     
    
    </body>

    
 </html>