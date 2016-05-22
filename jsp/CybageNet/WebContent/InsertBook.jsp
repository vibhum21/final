<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>

label{
font-family:sans-serif;
display:block;
margin:10px;
padding-left: 60px;
padding-top: 20px;
}
label.login{
padding-left: 100px;
margin-right: 50px;
}
span.reset{
padding-left: 50px;
}
span.heading{
font-family:cursive;
font-style:italic;
font-size:30px;

padding-bottom: 20px;
width:420px;
position: absolute;
}
span{
font-size:20px;
display:inline-block;
width:120px;
}

div.wrapper{
background-color: bisque;
border-radius: 10px;
padding: 20px;
border-color: red;
border-width: 3px;
border-style: solid;
width: 450px;
height: 100px;
margin: auto;
position: absolute;
top: 0;
bottom: 0;
left: 0;
right: 0;
}
h2.heading{

top: 0;
bottom: 0;
left: 0;
right: 0;
}
body
{
background-color: rgba(0,0,0,0,5);
}
input.btn {
border: 0;
background-color: #3bab53;
width: 80px;
height: 30px;
font-size: 16px;
color: white;
}

</style>

</head>
<body>
<%@ page import="java.sql.*" %>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
RequestDispatcher rd;

String title=request.getParameter("bname");
int bookpage=Integer.parseInt(request.getParameter("bpage"));
String author=request.getParameter("bauthor");
int edition=Integer.parseInt(request.getParameter("bedition"));


try {
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
	pst=con.prepareStatement("insert into books(bookname,bookpage,author,edition) values(?,?,?,?)");
	pst.setString(1, title);
	pst.setInt(2, bookpage);
	pst.setString(3, author);
	pst.setInt(4, edition);
	System.out.println("Book inserted successfully....");
	pst.executeUpdate();
	//response.sendRedirect("AdminHome.jsp");
	/* rd=request.getRequestDispatcher("AdminHome.jsp");
	rd.include(request, response);
	 */%>
	<div class="wrapper">
	<label>
	<span class="heading">Your Book have been Inserted</span><br>
	</label>
	</div>
<% }
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