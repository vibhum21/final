<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*;" %>
<%

Connection con;
		Statement pst;
		ResultSet rs;
		
		
		String bid=(String)pageContext.getAttribute("bid",PageContext.SESSION_SCOPE);
		int id=Integer.parseInt(bid);
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
		pst=con.createStatement();
		rs=pst.executeQuery("select * from review where bookid='"+id+"'");
		out.println("<table border=2><tr><td>Book ID</td><td>Book Name</td><td>Review</td><td>User Name</td></tr>");
		while(rs.next())
		{
			out.println("<tr><td>"+rs.getInt(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td></tr>");
		}
		out.print("</table>");
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		%>
</body>
</html>