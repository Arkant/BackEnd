function Temperature(gradus) {
	this.gradus = gradus;
};

Temperature.prototype.roundValue = function(value) {
	value.gradus = ( Math.round(value.gradus * 100) / 100 );
	return this;
}
Temperature.prototype.CelcToFahr = function(value) {
	value.gradus = value.gradus * 1.8 + 32;
	return this;
};

Temperature.prototype.FahrToCelc = function(value) {
	value.gradus = (value.gradus - 32) / 1.8;
	return this;
};

Temperature.prototype.showTemperature = function(value) {
	console.log("It's " + value.gradus + " now...")
}
exports.Temperature = Temperature;