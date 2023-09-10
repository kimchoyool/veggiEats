if(navigator.geolocation){
    navigator.geolocation.getCurrentPosition(success);

}else{
    alert('지원하지 않습니다.');
}
function success(position){ //자동으로 가져옴
    let lat = position.coords.latitude; //위도
    let lon = position.coords.longitude; //경도

    lat = lat.toPrecision(6);
    lon = lon.toPrecision(6);

    let map = document.getElementById('map_iframe');

    map.src="https://www.openstreetmap.org/export/embed.html?bbox="+
    (parseFloat(lon)-0.003)+"%2C"+(parseFloat(lat)-0.003)+"%2C"+
    (parseFloat(lon)+0.003)+"%2C"+(parseFloat(lat)+0.003);
    //%2C == ,
    //줌: -0.003, +0.003 숫자 변경으로 가능
    //정확도가 이상하게 안맞음

}