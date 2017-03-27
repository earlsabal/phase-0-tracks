var colors = ["blue", "red", "green", "yellow"];
var names = ["Ed", "Jim", "Bob", "George"];
colors.push("orange");
names.push("Sam");

var horses = {};
if (colors.length == names.length) {
	for (var i = 0; i < names.length; i++) {
		horses[names[i]] = colors[i];
	}
}

//console.log(horses);

function Car (brand, carColor, savesGas) {
	this.brand = brand
	this.carColor = carColor
	this.savesGas = savesGas
	this.honk = function() {
		console.log("HONK!");
	};
}

prius = new Car("Toyota", "black", true);
mustang = new Car("Ford", "grey", false);
console.log("Prius details");
console.log(prius.brand);
console.log(prius.carColor);
console.log(prius.savesGas);
prius.honk()
console.log("Mustang details");
console.log(mustang.brand);
console.log(mustang.carColor);
console.log(mustang.savesGas);
mustang.honk()