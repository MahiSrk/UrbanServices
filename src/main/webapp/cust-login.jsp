<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #85ffb8); /
            font-family: 'Arial', sans-serif;
        }

        nav a.nav-link {
            color: #fff !important;
        }

        .link {
            text-decoration: none;
            color: yellow;
        }

        .link:hover {
            text-decoration: none;
            color: red;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-body {
            background-color:  #99ffcc;
            border-radius: 12px;
            padding: 30px;
        }

        .card-title h3 {
            color: #333;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #A2C2E8;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #D1E6F1;
        }
    </style>

    <title>Online Urban Services</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container" style="margin-top: 50px; width: 450px;">
        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center">Login for Customer</h3>
                </div>
                <hr>

                <form action="cust-login1.jsp" method="post">
                    <div class="form-group">
                        <label for="">Customer Email</label>
                        <input id="email" name="email" type="email" class="form-control" placeholder="Enter Your Email ID" required>
                    </div>

                    <div class="form-group">
                        <label for="">Password</label>
                        <input id="password" name="password" type="password" class="form-control"
                            placeholder="Enter Password" minlength="4" required>
                    </div>

                    <div class="form-group">
                        <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="login" id="login">Login</button>
                    </div>

                    <div class="form-group">
                        Not registered yet? <a href="cust-register.jsp" class="link">Create Account</a>    
                    </div>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>

</html>
