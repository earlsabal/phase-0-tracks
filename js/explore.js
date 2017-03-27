/**
Method that takes in a string and reverses it
input: string
steps:
	- Take in the string
	- Create a new empty string
	- go through each letter of the original string 
		- add it to the beginning of the new string
	- return new string
output: string
**/

function reverse(stringToReverse) {
	var reversedString = ""
	for (var i = stringToReverse.length - 1; i >= 0; i--) {
		reversedString = reversedString + stringToReverse[i]
	}
	return reversedString
}
