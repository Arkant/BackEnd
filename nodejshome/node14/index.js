var http = require("http");
var fs = require("fs");
var needle = require("needle");
// Автообновление с помощью nodemon
var port = 3000;

/*
//Отображение с помощью html и js
var fs = require('fs');
var file = "pubinfo.json"

fs.readFile(file, 'utf8', function (err, data) {
  if (err) {
    console.log('Error: ' + err);
    return;
  }

  data = JSON.parse(data);
  	console.dir(data);
});
*/
// Отображение через needle
var url = "https://api.privatbank.ua/p24api/pubinfo?exchange&json&coursid=11";
	needle.get(url,function(err, res, body){
    if(err) throw(err);
    	console.log(body);   
 });

http.createServer(function(req, res) {
	//отобразим hello world
	if (req.url === "/") {
		res.write("Hello, World!");
		res.end();
	}
	//отобразим запрос в консоль
	else if (req.url === "/about"){
		console.log(req);
		res.end();
	}
	//отобразим музыку
	else if (req.url === "/file"){
		fs.readFile("server.html", function (err, data) {
	   	   res.write(data);
	   	   res.end();
	   	   res.write("Немного Windows музыки");
		   res.end();
});
	}
	//остановим сервер
	else if (req.url === "/stop"){
		server.close();
	}
}).listen(port, function() {
	console.log("Server is online...")
});


