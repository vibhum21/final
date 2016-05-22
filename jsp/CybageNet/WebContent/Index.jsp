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
				padding-left: 39px;
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
				height: 200px;
				margin: auto;
				position: absolute;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
			}
			body{
				background-color: rgba(0,0,0,0,5);
			}
			input.btn {
				border: 0;
				background-color: #3bab53;
				width: 152px;
				height: 30px;
				font-size: 16px;
				color: white;
			}
		</style>
	</head>
	<body>
	<%!int hitnumber=0; %>
	<%
		hitnumber=hitnumber+1;
		String hitnumber1=Integer.toString(hitnumber);
		Cookie cookie=new Cookie("Hit",hitnumber1);
		cookie.setMaxAge(10 * 365 * 24 * 60 * 60);
		response.addCookie(cookie);
		%>
		<form method="get" action="Login.jsp">
		<div class="wrapper">
		<label>
		<span class="heading">Welcome To CybageNet</span>
		</label><br><br>
		
		<span>Total Hits : </span><%=hitnumber%></label>
		<label class="login"><input class="btn" type ="submit" value="Go To Login Page..."></label>
		</div>
		</form>
		
 
                            
		</body>
</html>