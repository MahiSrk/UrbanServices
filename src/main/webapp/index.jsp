<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Service 4 Support</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #ccffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
        }

        nav a.nav-link {
            color: #333;
        }

        h2 {
            font-family: 'Anton', sans-serif;
            background-color: #66ffd1;
            color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        .form-control {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            color: #333;
        }

        .btn-search {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            width: 100%;
        }

        .card {
            background-color:  #66ffff;
            color: #333;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            height: 200px;
            object-fit: cover;
        }

        .card-title {
            font-weight: bold;
        }

        .card-text {
            text-align: justify;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .table-responsive {
            margin-top: 30px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<%
    String cities[] = new String[]{"Ahmednagar", "Akola", "Akot", "Amalner", "Ambejogai", "Amravati", "Anjangaon", "Arvi", "Aurangabad", "Bhiwandi", "Dhule", "Kalyan-Dombivali", "Ichalkaranji", "Karjat", "Latur", "Loha", "Lonar", "Lonavla", "Mahad", "Malegaon", "Malkapur", "Mangalvedhe", "Mangrulpir", "Manjlegaon", "Manmad", "Manwath", "Mehkar", "Mhaswad", "Mira-Bhayandar", "Morshi", "Mukhed", "Mul", "Greater Mumbai*", "Murtijapur", "Nagpur", "Nanded-Waghala", "Nandgaon", "Nandura", "Nandurbar", "Narkhed", "Nashik", "Navi Mumbai", "Nawapur", "Nilanga", "Osmanabad", "Ozar", "Pachora", "Paithan", "Palghar", "Pandharkaoda", "Pandharpur", "Panvel", "Parbhani", "Parli", "Partur", "Pathardi", "Pathri", "Patur", "Pauni", "Pen", "Phaltan", "Pulgaon", "Pune", "Purna", "Pusad", "Rahuri", "Rajura", "Ramtek", "Ratnagiri", "Raver", "Risod", "Sailu", "Sangamner", "Sangli", "Sangole", "Sasvad", "Satana", "Satara", "Savner", "Sawantwadi", "Shahade", "Shegaon", "Shendurjana", "Shirdi", "Shirpur-Warwade", "Shirur", "Shrigonda", "Shrirampur", "Sillod", "Sinnar", "Solapur", "Soyagaon", "Talegaon Dabhade", "Talode", "Tasgaon", "Thane", "Tirora", "Tuljapur", "Tumsar", "Uchgaon", "Udgir", "Umarga", "Umarkhed", "Umred", "Uran", "Uran Islampur", "Vadgaon Kasba", "Vaijapur", "Vasai-Virar", "Vita", "Wadgaon Road", "Wai", "Wani", "Wardha", "Warora", "Warud", "Washim", "Yavatmal", "Yawal", "Yevla"};
%>

<div class="container">
    <h2>Service 4 Support</h2>
    <hr>
    <div class="row">
        <div class="form-group col-md-5">
            <label for="city">City</label>
            <select class="form-control" name="city" id="city">
                <option value="none">-- Select City --</option>
                <% for(String city : cities) { %>
                    <option value="<%= city %>"><%= city %></option>
                <% } %>
            </select>
        </div>

        <div class="form-group col-md-5">
            <label for="profession">Who's Required</label>
            <select class="form-control" name="profession" id="profession" required>
                <option value="none">Select Profession</option>
                <option value="Body Spa">Body Spa</option>
                <option value="Electrician">Electrician</option>
                <option value="Photographer">Photographer</option>
                <option value="Plumber">Plumber</option>
                <option value="Beautician">Beautician</option>
                <option value="Painter">Painter</option>
                <option value="house maid">Maid</option>
            </select>
        </div>

        <div class="form-group col-md-2">
            <label for="search">Action</label>
            <button id="search" class="btn btn-search" type="button" onclick="show()">Search</button>
        </div>
    </div>

    <div class="table-responsive">
        <table id="providers" class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Profession</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="result">
                <tr>
                    <td colspan="5" class="text-center">Select city and profession to view providers.</td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="spa_body.png" class="card-img-top" alt="Body Spa">
                <div class="card-body">
                    <h5 class="card-title">Body Spa</h5>
                    <p class="card-text">Relax and rejuvenate with our certified body spa specialists. Enjoy soothing massages, body treatments, and wellness therapies at the comfort of your home.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="electrician.jpg" class="card-img-top" alt="Electrician">
                <div class="card-body">
                    <h5 class="card-title">Electrician</h5>
                    <p class="card-text">Find experienced electricians on our website for all types of electrical work, including wiring, lighting installation, and electrical repairs, ensuring safety and quality.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="photugraphur.jpg" class="card-img-top" alt="Photographer">
                <div class="card-body">
                    <h5 class="card-title">Photographer</h5>
                    <p class="card-text">Capture your special moments with our professional photographers. From weddings to corporate events, we offer tailored photography services to fit every occasion.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <img src="plumber.jpg" class="card-img-top" alt="Plumber">
                <div class="card-body">
                    <h5 class="card-title">Plumber</h5>
                    <p class="card-text">Our platform connects you with professional plumbers who can handle all your plumbing needs, from fixing leaks and clogged drains to installing new fixtures.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="beauty-salon-square-flyer_788472-166.jpg" class="card-img-top" alt="Beautician">
                <div class="card-body">
                    <h5 class="card-title">Beautician</h5>
                    <p class="card-text">Book expert beauticians through our platform for a wide range of beauty services, including haircuts, facials, makeup, and personal grooming, right at your doorstep.</p>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <img src="painetur.jpg" class="card-img-top" alt="Painter">
                <div class="card-body">
                    <h5 class="card-title">Painter</h5>
                    <p class="card-text">Whether you need a fresh coat of paint for your home or office, our skilled painters provide high-quality painting services to revamp your space with precision and care.</p>
</div>
    	</div>
  	</div>
</div>
    
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>