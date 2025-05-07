<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #A8C0FF, #3E8E41); /* Light blue-green gradient */
            font-family: 'Arial', sans-serif;
        }

        nav a.nav-link {
            color: #fff !important;
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
            background-color: #99ffcc;
            border-radius: 12px;
            padding: 30px;
        }

        .card-title h3 {
            color: #333;
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #3E8E41;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #A8C0FF;
        }

        .form-group input {
            border-radius: 8px;
        }
    </style>

    <title>Online Maid Services</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div class="container" style="margin-top: 50px; width: 450px;">
        <div class="card">
            <div class="card-body">
                <div class="card-title">
                    <h3 class="text-center">Login for Admin</h3>
                </div>
                <hr>

                <form action="admin-login1.jsp" method="post">
                    <div class="form-group">
                        <label for="">Admin Email</label>
                        <input id="email" name="email" type="email" class="form-control" placeholder="Enter Your Email ID" required>
                    </div>

                    <div class="form-group">
                        <label for="">Password</label>
                        <input id="password" name="password" type="password" class="form-control"
                            placeholder="Enter Password" minlength="4" required>
                    </div>

                    <button style="margin-top: 30px;" class="btn btn-block btn-primary" type="submit" name="login"
                        id="login">Login</button>
                </form>

            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
