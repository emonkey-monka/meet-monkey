document.addEventListener("DOMContentLoaded", function() {
 
    var options = {
        enableHighAccuracy: true,
        timeout: 60000,
        maximumAge: 0
    };
    // 位置情報取得
    window.navigator.geolocation.watchPosition(success, error, options);
}, false);
 
 
function success(pos) {
    // 緯度
    document.querySelector('#latitude').textContent = pos.coords.latitude;
    // 経度
    document.querySelector('#longitude').textContent = pos.coords.longitude;
 
    sendMessage(pos);
}
 
function sendMessage(pos) {
    var location = {
        latitude: pos.coords.latitude,
        longitude: pos.coords.longitude,
    };
 
 
 App.room.post_location(location)
   
}
 
function error(err) {
    console.warn('ERROR(' + err.code + '): ' + err.message);
}



 

