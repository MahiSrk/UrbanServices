<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
            background: linear-gradient(to right, #b3ffab, #12fff7);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #222831;
        }

        nav a.nav-link {
            color: #fff !important;
        }

        .about-text, .objectives-text {
            color: #3a0066; /* Stylish deep purple */
        }

       .card {
    background: rgba(255, 255, 255, 0.15); /* Match background with semi-transparent white */
    backdrop-filter: blur(8px); /* Optional: frosted glass effect */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    border-radius: 12px;
    color: #2e003e;
    border: 1px solid rgba(255, 255, 255, 0.3);
}


        .card-header, .card-footer {
            background-color: #6c63ff;
            color: white;
            border-radius: 12px 12px 0 0;
        }

        .card-footer {
            border-radius: 0 0 12px 12px;
        }

        h2, h3 {
            color: #2c003e;
        }

        ul li {
            margin-bottom: 8px;
        }

        a {
            color: #0d47a1;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

    <title>Online Urban Services</title>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
	<div class="row">
    	<img src="images/services1.png" alt="Logo" style="width: 100%; height: auto; object-fit: cover;">
        
        <div>
        	<h2>About Us</h2>
       		<p class="about-text" style="text-align:justify;margin:10px;line-height:35px;">
                Welcome to Service for System, your trusted partner in providing professional home and office services.
                We specialize in connecting customers with highly skilled service providers, offering a wide range of solutions, including plumbing, electrical work, beauty services, painting, and more.
                At Service for System, we understand the importance of convenience, reliability, and quality.
                Our platform is designed to help you book trusted professionals quickly and easily, ensuring that all your service needs are met with just a few clicks.
                Whether you need a quick fix, a regular maintenance task, or a major renovation, we've got you covered.
                We bridge the gap between customers and qualified service providers, offering a seamless experience for both.
                Our goal is to make your life easier by bringing top-rated professionals directly to your doorstep, allowing you to focus on what matters most.
            </p>
		</div>
		
		<div style="margin:10px;">
			<h3>Our Objectives</h3>
			<ul class="objectives-text">
				<li>Quality services</li>
				<li>Catering to the needs of every household</li>
				<li>Maintaining strong relationships</li>
				<li>Customer Satisfaction</li>
			</ul>
		</div>
	</div>
</div>

<div class="container col-8" style="margin-top: 50px;">
    <div class="card">
        <div class="card-header text-center">
            <strong>Contact us</strong>
        </div>

        <div class="card-body">
            <strong class="card-title">Connect to us for service and support</strong>
            <ul style="list-style-type: none; padding: 0; margin-top: 15px;">
                <li>
                    <a href="https://www.instagram.com/yourusername" target="_blank" style="text-decoration: none; color: #E1306C;">
                        <i class="fab fa-instagram"></i> Instagram
                    </a>
                </li>
                <li>
                    <a href="mailto:youremail@example.com" style="text-decoration: none; color: #000000;">
                        <i class="fas fa-envelope"></i> Email
                    </a>
                </li>
                <li>
                    <a href="https://www.linkedin.com/in/yourusername" target="_blank" style="text-decoration: none; color: #0077B5;">
                        <i class="fab fa-linkedin"></i> LinkedIn
                    </a>
                </li>
            </ul>
        </div>

        <div class="card-footer text-center">
            
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
