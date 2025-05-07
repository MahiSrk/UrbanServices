<%@include file="config.jsp"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String contact = request.getParameter("contact");
	String adder1 = request.getParameter("adder1");
	String adder2 = request.getParameter("adder2");
	String city = request.getParameter("city");
	String password = request.getParameter("password");

	ResultSet rs = con.createStatement().executeQuery("select * from customer where email='"+email+"'");
	
	if(rs.next()){
%>
<script type="text/javascript">
	alert("Customer already registred. Please continue with login");
	location.href = "cust-login.jsp";
</script>
<%
	}
	else{
		PreparedStatement ps = con.prepareStatement("insert into customer(name, email, contact, adder1, adder2, city, password) values(?,?,?,?,?,?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, contact);
		ps.setString(4, adder1);
		ps.setString(5, adder2);
		ps.setString(6, city);
		ps.setString(7, password);
		ps.executeUpdate();
%>
<script type="text/javascript">
	alert("Customer registred successfully. Please continue with login");
	location.href = "cust-login.jsp";
</script>
<%
	}
%>
