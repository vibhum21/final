<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
padding-left: 60px;
padding-top: 10px;
}
label.remove{
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
padding-left:100px;
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
height: 150px;
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
width: 120px;
height: 30px;
font-size: 16px;
color: white;
}

</style>

</head>
<body>
<div class="wrapper">
<form method="post" action="DeleteBook.jsp">
<span class="heading">Welcome :-</span>
<br><br>
<label>
<span>Book Name : </span><input type="text" name="bname"><br></label>

<label class="add"><input class="btn" type="submit" value="Delete Book"></label>
</form></div></body>
</html>