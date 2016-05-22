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
String rev=request.getParameter("review");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");

String uname=(String)pageContext.getAttribute("uname",PageContext.SESSION_SCOPE);
//int book_id=(int) session.getAttribute("bid");
String s = (String) pageContext.getAttribute("bid",PageContext.SESSION_SCOPE);
int bid = Integer.parseInt(s);
String review=request.getParameter("review");
String bname = (String) pageContext.getAttribute("bname",PageContext.SESSION_SCOPE);
pst=con.prepareStatement("insert into review values (?,?,?,?) ");
pst.setInt(1, bid);
pst.setString(2, bname);
pst.setString(3, review);
pst.setString(4, uname);
pst.executeUpdate();
%>
<div class="wrapper">
<label>
<span class="heading">Your Review have been Recorded</span><br>
</label></div>
<% }
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} %>
</body>
</html>