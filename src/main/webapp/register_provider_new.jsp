
<%@include file="config.jsp"%>
<%
try {
	response.setContentType("text/html; charset=UTF-8");

    String appPath = application.getRealPath("/");
   

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String email = request.getParameter("email");
    
    String adder1 = request.getParameter("adder1");
    String adder2 = request.getParameter("adder2");
    String city = request.getParameter("city");
    String descr = request.getParameter("descr");
    String password = request.getParameter("password");
    String profession = request.getParameter("profession");

    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM providers WHERE email='" + email + "'");

    if (rs.next()) {
%>
        <script type = "text/javascript">
            alert('Contact of service provider already registered');
            location.href = "<%= request.getContextPath() %>/login.jsp";

        </script>
        
      
<%
        return;
    }

  /*  for (Part part : request.getParts()) {
       String fileName = part.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            part.write(appPath + "/uploads/" + id + ".jpg");
        }
    }
*/
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO providers(name,contact,email,address1,address2,city,descr,password,profession) VALUES(?,?,?,?,?,?,?,?,?)");

    ps.setString(1, name);
    ps.setString(2, contact);
    ps.setString(3, email);
    ps.setString(4, adder1);
    ps.setString(5, adder2);
    ps.setString(6, city);
    ps.setString(7, descr);
    ps.setString(8, password);
    ps.setString(9, profession);

    ps.executeUpdate();
%>
    <script type = "text/javascript">
        alert('Service provider registered successfully');
        location.href = "login.jsp";
    </script>
<%
} catch (Exception e) {
%>
    <h4>Error: <%= e.getMessage() %></h4>
<%
}
%>
