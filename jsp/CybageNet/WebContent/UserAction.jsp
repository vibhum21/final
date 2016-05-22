<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="Error.jsp" %>
 <%@ include file="Session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
RequestDispatcher rd;
HttpSession ses=request.getSession();
String btn=request.getParameter("b1");
if(btn.equals("Show_Review"))
{
	rd=request.getRequestDispatcher("ShowReview.jsp");
	rd.include(request, response);
}
else
{
rd=request.getRequestDispatcher("AddReview.jsp");
rd.include(request, response);
}
%>
</body>
</html>