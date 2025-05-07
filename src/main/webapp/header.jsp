<nav class="nav" style="background-color: #00c9a7;box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
<% if(session.getAttribute("user")==null) {%>
	<a class="nav-link text-dark" href="index.jsp">Find Service Provider</a>
	<a class="nav-link text-dark" href="login.jsp">Service Provider Login</a>
    <a class="nav-link text-dark" href="register.jsp">Service Provider Register</a>
	<a class="nav-link text-dark" href="cust-login.jsp">Customer Login</a>
    <a class="nav-link text-dark" href="cust-register.jsp">Customer Register</a>
    <a class="nav-link text-dark" href="admin-login.jsp">Admin Login</a>
	<a class="nav-link text-dark" href="about.jsp">About</a>
	<a class="nav-link text-dark" href="feedback.jsp">Feedback</a>
<% } else if (session.getAttribute("user").equals("admin")) {%>
	<a class="nav-link text-dark" href="admin-home.jsp">Home</a>
	<a class="nav-link text-dark" href="manage-service-providers.jsp">Manage Service Providers</a>
	<a class="nav-link text-dark" href="manage-customers.jsp">Manage Customers</a>
    <a class="nav-link text-dark" href="logout.jsp">Log Out</a>
<% } else if (session.getAttribute("user").equals("provider")) {%>
	<a class="nav-link text-dark" href="service-provider-home.jsp">Home</a>
	<a class="nav-link text-dark" href="view-service-provider-profile.jsp">View Profile</a>
    <a class="nav-link text-dark" href="view-service-provider-bookings.jsp">View Bookings</a>
    <a class="nav-link text-dark" href="manage-services.jsp">Manage Services</a>
    <a class="nav-link text-dark" href="logout.jsp">Log Out</a>
<% } else if (session.getAttribute("user").equals("customer")) {%>
	<a class="nav-link text-dark" href="cust-home.jsp">Home</a>
	<a class="nav-link text-dark" href="find-service-provider.jsp">Find Service Provider</a>	
	<a class="nav-link text-dark" href="view-customer-profile.jsp">View Profile</a>
    <a class="nav-link text-dark" href="view-cust-bookings.jsp">View Bookings</a>
    <a class="nav-link text-dark" href="logout.jsp">Log Out</a>
<% } %>
</nav>
