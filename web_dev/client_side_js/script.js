console.log("Script is running");

function changeBorder(event) {
	document.getElementById("first_art_header").innerText = "This is one of my most proud drawings";
	document.getElementById("temp_head").innerText = "";
	document.body.style.backgroundImage = "url('red-planet-background.jpg')";
	document.body.style.backgroundSize = "100%";
	document.body.style.backgroundColor = "maroon";
	document.getElementsByClassName("home_text")[1].innerText = "This is Deadpool";
	event.target =  document.getElementById("first_painting").src="Deadpool.jpg";
}

var photo = document.getElementById("first_painting");

photo.addEventListener("click", changeBorder); 