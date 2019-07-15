console.log("Hello from the JavaScript console!");

const getWeather = function () {
    return $.ajax({
        method: "GET",
        dataType: 'json',
        url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
    })
}

const xhr = getWeather()
const successCB = function (response) {
    const $ul = $("ul");
    $ul.append($(`<li>${response["clouds"]["all"]} clouds<li>`));
    $ul.append($(`<li>lon: ${response["coord"]["lon"]}, lat: ${response["coord"]["lon"]}<li>`));
    console.log(response);
}

const errorCB = function () {
    console.log("something went wrong")
}

xhr.then(successCB).fail(errorCB)
