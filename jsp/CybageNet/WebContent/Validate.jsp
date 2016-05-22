<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>
      <%@ page import="java.util.Date" %>
           <%@ include file="Session.jsp" %>
       <%@ page errorPage="Error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!HashMap<String, Date> map;%>
<%
	Connection con;
	Statement st;
	ResultSet rs,rs1;
	RequestDispatcher rd;
	
	String name=request.getParameter("uname");
	String pass=request.getParameter("pass");
	pageContext.setAttribute("uname",name,PageContext.SESSION_SCOPE);
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","");
	System.out.println("connection");
	st=con.createStatement();
	rs=st.executeQuery("select * from login where uname='"+name+"'and pass='"+pass+"'");
	System.out.println("connection");
	if(map ==null)
	{
	 map=new HashMap<String, Date>();
	}
	Date d= Calendar.getInstance().getTime();;
	
	if(rs.next())
	{
		pageContext.setAttribute("uname",name,PageContext.SESSION_SCOPE); 
		String type=rs.getString(3);
		if(type.equals("admin"))
		{
			map.put(name, d);
			session.setAttribute("map", map);
			PreparedStatement st3  = con.prepareStatement("select uname from login where uname=?");
			st3.setString(1, name);
			rs1 =  st3.executeQuery();
			while(rs1.next())
			{
				Date date=	 Calendar.getInstance().getTime();
				PreparedStatement st1 = con.prepareStatement("insert into logintime values(?,?)");
				st1.setString(1, rs1.getString(1));
				st1.setString(2,date.toString());				
				int count=st1.executeUpdate();
				if(count>0)
					response.getWriter().append("insert successful");
			}
			PreparedStatement st4=con.prepareStatement("select count(*) from (select distinct uname from logintime) x");
			ResultSet rs4=st4.executeQuery();
			while(rs4.next())
			{
				int count1=rs4.getInt(1);
				System.out.println(count1);
			}%>
			<jsp:forward page="AdminHome.jsp"></jsp:forward>
		<%}
		else
		{
			map.put(name, d);
			session.setAttribute("map", map);
			PreparedStatement st3  = con.prepareStatement("select uname from login where uname=?");
			st3.setString(1, name);
			rs1 =  st3.executeQuery();
			int date=Calendar.MONTH;
			System.out.println(date);
			while(rs1.next())
			{
				
				Date time=Calendar.getInstance().getTime();
				PreparedStatement st1 = con.prepareStatement("insert into logintime values(?,?,?)");
				st1.setString(1, rs1.getString(1));
				st1.setInt(2,date);		
				st1.setString(3, time.toString());
				int count=st1.executeUpdate();
				if(count>0)
					response.getWriter().append("insert successful");
			}
			PreparedStatement st4=con.prepareStatement("select count(*) from (select distinct uname from logintime where date=? ) x");
			st4.setInt(1, date);
			ResultSet rs4=st4.executeQuery();
			while(rs4.next())
			{
				int count1=rs4.getInt(1);
				pageContext.setAttribute("count",count1,PageContext.SESSION_SCOPE);
				
			}%>
			<jsp:forward page="UserHome.jsp"></jsp:forward>
		<%}	
	}
	else %>
		<jsp:forward page="Relogin.jsp"></jsp:forward>
 </body>
</html>