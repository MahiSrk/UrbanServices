<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
  <title>Online Urban Services</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css" />

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />

  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    nav a.nav-link {
      color: #fff !important;
    }

    .link {
      text-decoration: none;
      color: #f1c40f;
    }

    .link:hover {
      text-decoration: none;
      color: #e74c3c;
    }

    .login-container {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 30px 15px;
    }

    .card {
      width: 100%;
      max-width: 450px;
      border: none;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      background-color: #4fe8c7;
    }

    .card-title h3 {
      font-weight: 700;
      color: #2c3e50;
    }

    .form-control {
      border-radius: 8px;
    }

    .btn-primary {
      background-color: #3498db;
      border: none;
      border-radius: 8px;
    }

    .btn-primary:hover {
      background-color: #2980b9;
    }

    footer {
      background-color: #2c3e50;
      color: #ecf0f1;
      text-align: center;
      padding: 15px 0;
    }
  </style>
</head>

<body>
  <jsp:include page="header.jsp"></jsp:include>

  <div class="login-container">
    <div class="card p-4">
      <div class="card-body">
        <div class="card-title text-center mb-4">
          <h3>Login for Service Providers</h3>
        </div>
        <hr />
        <form action="login1.jsp" method="post">
          <div class="form-group">
            <label for="email">Email</label>
            <input
              id="email"
              name="email"
              type="email"
              class="form-control"
              placeholder="Enter Your Email"
              required
            />
          </div>

          <div class="form-group">
            <label for="password">Password</label>
            <input
              id="password"
              name="password"
              type="password"
              class="form-control"
              placeholder="Enter Password"
              minlength="4"
              required
            />
          </div>

          <div class="form-group">
            <button
              style="margin-top: 30px;"
              class="btn btn-block btn-primary"
              type="submit"
              name="login"
              id="login"
            >
              Login
            </button>
          </div>

          <div class="form-group text-center">
            Not registered yet? <a href="register.jsp" class="link">Create Account</a>
          </div>
        </form>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
