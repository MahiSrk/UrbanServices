<%@include file="config.jsp"%>

<%
	String city = request.getParameter("x");
	String prof = request.getParameter("y");
	
	PreparedStatement ps = con.prepareStatement("select * from providers where city=? and profession=? and status='Active'");
	ps.setString(1, city);
	ps.setString(2, prof);
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
		do{
%>    
<tr>
	<td><img style='height:150px' src='uploads/<%=rs.getInt(1)%>.jpg' width=150 height=150></td>
	<td><%=rs.getString("name")%></td>
	<td><%=rs.getString("address1")%>,<br><%=rs.getString("address2")%>,<br><%=rs.getString("city")%></td>
	<td><%=rs.getString("profession")%></td>
	<td><a href='view-services.jsp?provider=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>View Services</a></td>
	<td><a href='booking.jsp?provider=<%=rs.getInt(1)%>' class='btn btn-primary btn-block'>Book</a></td>
</tr>

<%
		}while(rs.next());
	}
	else{
%>
<tr><td colspan='5'>No Service Providers found...</td></tr>
<%
	}
%>

</script>
