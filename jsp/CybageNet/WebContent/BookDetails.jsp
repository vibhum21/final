<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ include file="Session.jsp" %>
<%@ page errorPage="Error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<style>

label{
font-family:sans-serif;
display:block;
padding-left: 60px;

}
label.login{
padding-left: 100px;
margin-right: 50px;
}
label.logout{
float:right;
}
span.reset{
padding-left: 50px;
}
span.heading{
font-family:cursive;
font-style:italic;
font-size:30px;
padding-left:60px;
padding-bottom: 20px;
width:420px;
position: absolute;
}
span{
font-size:20px;

display:inline-block;
width:142px;
}

div.wrapper{
background-color: bisque;
border-radius: 10px;
padding: 20px;
border-color: red;
border-width: 3px;
border-style: solid;
width: 450px;
height: 400px;
margin: auto;
position: absolute;
top: 0;
bottom: 0;
left: 0;
right: 0;
}
h3{


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
<%
Connection con;
Statement pst;
ResultSet rs;
RequestDispatcher rd;
String bname=request.getParameter("bname");
try {
	String name=(String)pageContext.getAttribute("uname",PageContext.SESSION_SCOPE);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
	
	PreparedStatement ps=con.prepareStatement("select * from books where bookname=?");
	ps.setString(1, bname);
	rs=ps.executeQuery();
	int i=1;
	int  bookid=0;
	if(!rs.next())
	{
		rd=request.getRequestDispatcher("BookError.jsp");
		rd.forward(request, response);
	}
	else
	{
		bookid=rs.getInt(1);%>
		<div class='wrapper'><span class='heading'>Book Found : </span>
		<br><br><br>
		<table>
		<tr><td><label>Book Name 	: </label></td><td><label><%=rs.getString(2)%></label></td></tr>
		<tr><td><label>No. Of Pages : </label></td><td><label><%=rs.getString(3)%></label></td></tr>
		<tr><td><label>Author Name 	: </label></td><td><label><%=rs.getString(4)%></label></td></tr>
		<tr><td><label>Edition 		: </label></td><td><label><%=rs.getString(5)%></label></td></tr>
		</table>
	<%}
	                        
	PreparedStatement ps1=con.prepareStatement
			("select review,name from books,review where books.bookname=review.bookname and books.bookname=?");
	ps1.setString(1, bname);
	rs=ps1.executeQuery();%>
	<h3>Review(s) By User(s)</h3>
	<table>
	<%
	while(rs.next())
	{%>
	
	<tr><td><label><%=rs.getString(2)%>		: </label></td><td><label><%=rs.getString(1)%></label></td></tr>
	<%}%>
	</table>
	<br>
	<form action='ReviewSucc.jsp' method='post'>
	<span>Enter a Review : &nbsp;</span><textarea name='review'></textarea><br><br>
	<input type='submit' value='Add review'>
	
	
	<% String s=Integer.toString(bookid);
	
	pageContext.setAttribute("bname",bname,PageContext.SESSION_SCOPE);
	pageContext.setAttribute("bid",s,PageContext.SESSION_SCOPE);
	%>
	</form>
	<form method="post" action="Logout.jsp">
		<label class="logout"><input class="btn" type="submit" value="Logout"/></label>
	</form>
	</div>
<% }


catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
</body>
</html>