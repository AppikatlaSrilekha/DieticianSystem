<!DOCTYPE html>
<html>
<head>
    <title>NutriTrack</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script>
	 // Function to toggle theme
	    function toggleTheme() {
	        const body = document.body;
	        const isDark = body.classList.toggle("dark-theme");
	        localStorage.setItem("theme", isDark ? "dark" : "light");
	    }
	
	    // Apply theme on page load based on stored preference
	    document.addEventListener("DOMContentLoaded", () => {
	        const savedTheme = localStorage.getItem("theme");
	        if (savedTheme === "dark") {
	            document.body.classList.add("dark-theme");
	        }
	    });
    </script>
</head>
<body>
	<header>
		<div class="header-content">
            <img src="logo.png" alt="Logo" class="logo">
            <h1 class="title">Dieitican DashBoard</h1>
            <img src="toggle.png" alt="Toggle" class="logo" onclick="toggleTheme()">
        </div>
    </header>
</body>
</html>