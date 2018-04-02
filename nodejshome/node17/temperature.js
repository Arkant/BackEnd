var module = require("./module");

var temp1 = new module.Temperature("27");
var temp2 = new module.Temperature("60");

temp1.CelcToFahr(temp1).roundValue(temp1);
temp2.FahrToCelc(temp2).roundValue(temp2);

temp1.showTemperature(temp1);
temp2.showTemperature(temp2);