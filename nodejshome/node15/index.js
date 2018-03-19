var http = require("http");
var event = require("events").EventEmitter;

var logger = new event();
var port = 3000;
logger.on("login", function () {
    var date1 = new Date();	
    console.log('Logged in: '+ date1);
});

logger.on("someAction", function () {
	var date2 = new Date();		
	console.log('Did action: '+ date2);
});

logger.on("Logged out", function () {
	var date3 = new Date();	
	console.log("User out: "+ date3);  
});

var srvr = http.createServer(function(req, res){

	if (req.url === "/"){
	   
	   logger.emit("login");	
		
	}else if (req.url === "/action") {
		
           logger.emit("someAction");
	   	
	}else if(req.url === "/out") {
		
          logger.emit("logout");		
	}

}).listen(port, function() {
	
	console.log("Server online...");
});