<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ include file="Session.jsp" %>
<%@ page errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Logout From CybageNet</title>
	</head>
	<body>
		<%
		HttpSession hs = request.getSession(false);
		String name=(String) hs.getAttribute("uname");
		
		HashMap<String, Date> map=(HashMap<String, Date>) hs.getAttribute("map");
		
		Iterator<Map.Entry<String, Date>> entries = map.entrySet().iterator();
		while (entries.hasNext()) 
		{
		    Map.Entry<String, Date> entry = entries.next();
		    if(name.equals(entry.getKey()))
		    {
		    	entries.remove();
		    	//hs.removeAttribute(entry.getKey());
		    }
		}
		hs.setAttribute("map", map);
		hs.invalidate();
		/*  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
		 rd.forward(request, response);  */ 
		%>
		<jsp:forward page="Login.jsp"></jsp:forward>
	</body>
</html>