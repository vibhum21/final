
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ include file="Session.jsp" %>
    <%-- <%@ page errorPage="Error.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
RequestDispatcher rd;
String action=request.getParameter("action");
if(action.equals("Add Book"))
{
	rd = request.getRequestDispatcher("Add_Book.jsp");
	rd.forward(request, response);
}
else if(action.equals("Remove Book"))
{
	rd = request.getRequestDispatcher("Remove_Book.jsp");
	rd.forward(request, response);
}
else if(action.equals("Show Users"))
{
	rd = request.getRequestDispatcher("ShowUsers.jsp");
	rd.forward(request, response);
}
else
{
	rd = request.getRequestDispatcher("Logout.jsp");
	rd.forward(request, response);
}
%>
</body>
</html>