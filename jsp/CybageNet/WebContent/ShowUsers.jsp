<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
         <%@ include file="Session.jsp" %>
    
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
padding-left: 10px;
padding-top: 20px;
}
label.login{
padding-left: 100px;
margin-right: 50px;
}

span.heading{
font-family:cursive;
font-style:italic;
font-size:30px;
padding-left:35px;
padding-bottom: 20px;
width:420px;
position: absolute;
}
span{
font-size:20px;
display:inline-block;
width:140px;
}

div.wrapper{
background-color: bisque;
border-radius: 10px;
padding: 20px;
border-color: red;
border-width: 3px;
border-style: solid;
width: 400px;
height: 300px;
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
<%
HttpSession hs = request.getSession();
@SuppressWarnings("unchecked")
HashMap<String, Date> map=(HashMap<String, Date>) hs.getAttribute("map");

System.out.println("map");
Iterator<Map.Entry<String, Date>> entries = map.entrySet().iterator();%>
<div class="wrapper">
<span class="heading">Welcome To CybageNet</span>
<br><br>
<%while (entries.hasNext()) 
{
    Map.Entry<String, Date> entry = entries.next();%>

<label><span>Name : </span> <%=entry.getKey()%><br> <span> Login Time : </span>  <%= entry.getValue() %></label>
<%
}
%>

</div>
</body>
</html>