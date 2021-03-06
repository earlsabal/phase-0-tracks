/*
Function to find longest phrase:
input: array
steps:
	- create a variable to record an index
	- create a variable to record the longest length
	- Iterate through each element in the array
		- find the LENGTH of the element
		- set the recorder to that index IF its the longest length 
	- RETURN the string at the recorded index
output: string
*/

function longestPhrase (phraseList) {
	var targetIndex = 0;
	var longestLength = 0;
	for (var i = 0; i < phraseList.length; i++) {
		var current_length = phraseList[i].length;
		if (current_length > longestLength) {
			targetIndex = i;
			longestLength = current_length;
		}
	}
	return phraseList[targetIndex];
}

console.log(longestPhrase(["long phrase","longest phrase","longer phrase"]));

/*
Function to check if any key-value pairs match in two objects
input: two objects
steps:
	- take in both objects
	- iterate through one object
		- FOR each element, iterate through the second object checking if the element exists
		- IF element exists in second object and have the same value
			- RETURN true
	- IF no key-value matches are found, RETURN false
output: boolean
*/

function keyValueChecker (object1, object2) {
	for (var property1 in object1) {
		for (var property2 in object2) {
			if (property1 == property2 && object1[property1] == object2[property2]) {
				return true;
			}
		}
	}
	return false;
}


var obj1 = {name: "Earl", age: 25};
var obj2 = {name: "Jim", age: 25};
var obj3 = {name: "Joe", age: 27};

console.log(keyValueChecker(obj1, obj2));
console.log(keyValueChecker(obj1, obj3));

/*
Function that generates random test data
input: integer
steps:
	- Function takes in an integer
	- Creates an empty array
	- Inserts strings into the array until the array size reaches the input integer
		- Strings inserted will be randomized with lengths between 1 and 10
	- RETURN array
output: array
*/

function generateRandomData (limit) {
	var randomData = [];
	while (randomData.length < limit) {
		randomData.push(generateRandomString(1, 10));
	}
	return randomData;
}

function generateRandomString (minLength, maxLength) {
	var randomLength = Math.floor(Math.random() * (maxLength - minLength)) + minLength;
	var randomString = "";
	var possibleCharacters = "abcdefghijklmnopqrstuvwxyz";
	for(var i = 0; i < randomLength; i++){
		randomString += possibleCharacters.charAt(Math.floor(Math.random() * possibleCharacters.length));
	}
	return randomString;
}

console.log(generateRandomData(3));
console.log(generateRandomData(5));
console.log(generateRandomData(2));