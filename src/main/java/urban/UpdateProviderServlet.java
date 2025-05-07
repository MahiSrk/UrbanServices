package urban;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;
 
@WebServlet("/UpdateProviderServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateProviderServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	
		try{
	        String appPath = request.getServletContext().getRealPath("/");

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/urban","root","");
		
			int id = Integer.parseInt(request.getParameter("id"));
		    String name = request.getParameter("name");
		    String contact = request.getParameter("contact");
		    String email = request.getParameter("email");
		    String descr = request.getParameter("descr");
		    String adder1 = request.getParameter("adder1");
		    String adder2 = request.getParameter("adder2");
		    String city = request.getParameter("city");
		    String password = request.getParameter("password");
		    String profession = request.getParameter("profession");

		    ResultSet rs = con.createStatement().executeQuery("select * from providers where email='"+email+"' and providers_id<>"+id);
		    
		    if(rs.next()) {
		    	out.print("<script>alert('Email of service provider already registered'); location.href='service-provider-home.jsp';</script>");
		    	return;
		    }
		
			for(Part part : request.getParts()) {
				String fileName = extractFileName(part);

		    	if(!fileName.equals("")){
                    part.write(appPath + "/uploads/" + id + ".jpg");
				}
		    }

			PreparedStatement ps = con.prepareStatement("UPDATE providers set name=?,contact=?,email=?,description=?,addr1=?,addr2=?,city=?,password=?,category=? where providers_id=?");		

			ps.setString(1,name);
			ps.setString(2,contact);
			ps.setString(3, email);
			ps.setString(4,descr);
			ps.setString(5,adder1);
			ps.setString(6,adder2);
			ps.setString(7,city);
			ps.setString(8,password);
			ps.setString(9, profession);
			ps.setInt(10, id);
			
			ps.executeUpdate();

			out.print("<script>alert('Service provider profile updated successfully');location.href = 'service-provider-home.jsp';</script>");
		}
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length()-1);
	            }
	        }
		return "";
	}
}
