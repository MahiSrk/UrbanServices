<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #c7faff,  #99ccff); /* Vibrant gradient */
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        nav a.nav-link {
            color: #fff !important;
        }

        .card {
            background-color: #0fd9e8;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
            max-width: 600px;
        }

        .card-title h3 {
            color: #333;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #ff7e5f;
            border: none;
        }

        .btn-primary:hover {
            background-color: #feb47b;
        }

        .form-group label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 5px;
        }

        hr {
            border-top: 1px solid #ccc;
        }

        .form-control-file {
            padding: 6px 12px;
        }
    </style>

    <title>Online Urban Services</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <%@include file="config.jsp"%>

    <%
    ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'urban' AND TABLE_NAME = 'providers';");
    rs.next();
    int id = rs.getInt(1);

    String cities[] = new String[]{"Ahmednagar", "Akola", "Akot", "Amalner", "Ambejogai", "Amravati", "Anjangaon", "Arvi", "Aurangabad", "Bhiwandi", "Dhule", "Kalyan-Dombivali", "Ichalkaranji", "Kalyan-Dombivali", "Karjat", "Latur", "Loha", "Lonar", "Lonavla", "Mahad", "Malegaon", "Malkapur", "Mangalvedhe", "Mangrulpir", "Manjlegaon", "Manmad", "Manwath", "Mehkar", "Mhaswad", "Mira-Bhayandar", "Morshi", "Mukhed", "Mul", "Greater Mumbai*", "Murtijapur", "Nagpur", "Nanded-Waghala", "Nandgaon", "Nandura", "Nandurbar", "Narkhed", "Nashik", "Navi Mumbai", "Nawapur", "Nilanga", "Osmanabad", "Ozar", "Pachora", "Paithan", "Palghar", "Pandharkaoda", "Pandharpur", "Panvel", "Parbhani", "Parli", "Partur", "Pathardi", "Pathri", "Patur", "Pauni", "Pen", "Phaltan", "Pulgaon", "Pune", "Purna", "Pusad", "Rahuri", "Rajura", "Ramtek", "Ratnagiri", "Raver", "Risod", "Sailu", "Sangamner", "Sangli", "Sangole", "Sasvad", "Satana", "Satara", "Savner", "Sawantwadi", "Shahade", "Shegaon", "Shendurjana", "Shirdi", "Shirpur-Warwade", "Shirur", "Shrigonda", "Shrirampur", "Sillod", "Sinnar", "Solapur", "Soyagaon", "Talegaon Dabhade", "Talode", "Tasgaon", "Thane", "Tirora", "Tuljapur", "Tumsar", "Uchgaon", "Udgir", "Umarga", "Umarkhed", "Umred", "Uran", "Uran Islampur", "Vadgaon Kasba", "Vaijapur", "Vasai-Virar", "Vita", "Wadgaon Road", "Wai", "Wani", "Wardha", "Warora", "Warud", "Washim", "Yavatmal", "Yawal", "Yevla"};
    %>

    <div class="container" style="margin-top: 30px; max-width: 800px; margin-bottom: 60px;">
        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center">Register as Service Provider</h3>
                </div>
                <hr>
                <form action="register_provider_new.jsp" method="post">
                    <div class="form-group">
                        <label for="">ID</label>
                        <input id="id" name="id" type="text" class="form-control" value="<%=id%>" readOnly style="background: white;">
                    </div>

                    <div class="form-group">
                        <label for="">Name</label>
                        <input id="name" name="name" type="text" class="form-control" placeholder="Name" required>
                    </div>

                    <div class="form-group">
                        <label for="">Contact No.</label>
                        <input id="contact" name="contact" type="text" class="form-control" placeholder="Contact" minlength="10" maxlength="10" pattern="^[6789]\d{9}$" required>
                    </div>

                    <div class="form-group">
                        <label for="">Email</label>
                        <input id="contact" name="email" type="email" class="form-control" placeholder="Email" required>
                    </div>

                    <div class="form-group">
                        <label for="">Address Line 1</label>
                        <input id="adder1" name="adder1" type="text" class="form-control" placeholder="Enter Address line-1" required>
                    </div>

                    <div class="form-group">
                        <label for="">Address Line 2</label>
                        <input id="adder2" name="adder2" type="text" class="form-control" placeholder="Enter Address line-2" required>
                    </div>

                    <div class="form-group">
                        <label for="">City</label>
                        <select class="form-control" name="city" id="city">
                            <option value="none">-- Select City --</option>
                            <% for(String city : cities) { %>
                                <option value="<%=city%>"><%= city %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="">Photo(Square Size)</label>
                        <input id="photo" name="photo" type="file" class="form-control-file" placeholder="Select Photo 1">
                    </div>

                    <div class="form-group">
                        <label for="">Add Description</label>
                        <textarea name="descr" id="descr" class="form-control" cols="30" rows="5" placeholder="Tell something about you..." required></textarea>
                    </div>

                    <div class="form-group">
                        <label for="">Password</label>
                        <input id="password" name="password" type="password" class="form-control" placeholder="Enter 6 Character Password" minlength="4" required>
                    </div>

                    <div class="form-group">
                        <label for="">Category</label>
                        <select class="form-control" name="profession" id="profession" required>
                            <option value="">Select Category</option>
                            <option value="Body Spa">Body Spa</option>
                            <option value="Electrician">Electrician</option>
                            <option value="Photographer">Photographer</option>
                            <option value="Plumber">Plumber</option>
                            <option value="Beautician">Beautician</option>
                            <option value="Painter">Painter</option>
                            <option value="Maid">Maid</option>
                        </select>
                    </div>

                    <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="register" id="register">Register</button>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
