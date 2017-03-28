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
	targetIndex = 0;
	longestLength = 0;
	for (var i = 0; i < phraseList.length; i++) {
		current_length = phraseList[i].length;
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

