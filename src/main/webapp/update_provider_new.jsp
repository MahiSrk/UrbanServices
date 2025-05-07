<%@include file="config.jsp"%>
<%
response.setContentType("text/html; charset=UTF-8");

String appPath = application.getRealPath("/");

PreparedStatement ps = null;
ResultSet rs = null;

try {
    
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String email = request.getParameter("email");
    String descr = request.getParameter("descr");
    String adder1 = request.getParameter("address1");
    String adder2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String password = request.getParameter("password");
    String profession = request.getParameter("profession");
    
    Statement stmt = con.createStatement();
    rs = stmt.executeQuery("SELECT * FROM providers WHERE email='" + email + "' AND provider_id<>" + id);
    
    if (rs.next()) {
        out.print("<script>alert('Email of service provider already registered'); location.href='service-provider-home.jsp';</script>");
    } else { /* 
      for (Part part : request.getParts()) {
            String fileName = part.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                part.write(appPath + "/uploads/" + id + ".jpg");
            }
        }
*/        
        ps = con.prepareStatement("UPDATE providers SET name=?, contact=?, email=?, descr=?, address1=?, address2=?, city=?, password=?, profession=? WHERE provider_id=?");
        
        ps.setString(1, name);
        ps.setString(2, contact);
        ps.setString(3, email);
        ps.setString(4, descr);
        ps.setString(5, adder1);
        ps.setString(6, adder2);
        ps.setString(7, city);
        ps.setString(8, password);
        ps.setString(9, profession);
        ps.setInt(10, id);
        
        ps.executeUpdate();
        
        out.print("<script>alert('Service provider profile updated successfully');location.href='service-provider-home.jsp';</script>");
    }
} catch (Exception e) {
    out.println("<h4>" + e + "</h4>");
} finally {
    if (rs != null) rs.close();
    if (ps != null) ps.close();
    if (con != null) con.close();
}
%>