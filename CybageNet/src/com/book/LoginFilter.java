/*This filter verifies the authorized person(user or admin) and redirects them to their respective 
pages as per their type*/

package com.book;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {
Connection con;

//map is declared to store the login details of the user
HashMap<String, Date> map;
Date d;
public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
{
	HttpSession hs =  ((HttpServletRequest) request).getSession();
	//setting the username in the session
	hs.setAttribute("username", request.getParameter("uname"));		
	HttpServletRequest req = (HttpServletRequest) request;
	HttpServletResponse res  =  (HttpServletResponse) response;
	try
	{		
		Class.forName("com.mysql.jdbc.Driver");
			try {
				if(map ==null)
				//creates new map if it is initially null
					map=new HashMap<String, Date>();
				
				
				
				
				//creating connection to the database
				 con = DriverManager.getConnection("jdbc:mysql://localhost/mydb","root","");
				 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			String str=req.getParameter("uname");
			String str1=req.getParameter("pass");
			
			PreparedStatement st,st1,st2,st3,st4;
			try 
			{
				st = con.prepareStatement("select type,uname from Login where uname=? and pass=?");
				st.setString(1, str);
				st.setString(2, str1);
				ResultSet rs =  st.executeQuery();

				if(rs.next())
				{
					//executes only when username and password matches,and checks for the role of the user
					if(rs.getString(1).equals("admin"))
					{ 
						//stores the creation time of session in Date object
						d=Calendar.getInstance().getTime();
						System.out.println("Admin"+d);
						map.put(str, d);
						hs.setAttribute("map", map);	
						hs.setAttribute("name", str);
						st2  = con.prepareStatement("select uname from login where uname=?");
						st2.setString(1, str);
						ResultSet rs1 =  st2.executeQuery();
						while(rs1.next())
						{
							Date date=	 Calendar.getInstance().getTime();
							st1 = con.prepareStatement("insert into logintime values(?,?)");
							
							st1.setString(1, rs1.getString(1));
							st1.setString(2, String.valueOf(date));
							int count=st1.executeUpdate();
								
							if(count>0)
								res.getWriter().append("insert successful");
						}
						st4=con.prepareStatement("select count(*) from (select distinct uname from logintime) x");
						ResultSet rs4=st4.executeQuery();
						while(rs4.next())
						{
							int count1=rs4.getInt(1);
							hs.setAttribute("count", count1);
							System.out.println(count1);
						}
						res.sendRedirect("WelcomeAdmin");
					}
					else
					{
						//stores the creation time of session in Date object
						d=Calendar.getInstance().getTime();
						System.out.println("User"+d);
						map.put(str, d);
						hs.setAttribute("map", map);
						hs.setAttribute("name", str);
						st3  = con.prepareStatement("select uname from login where uname=?");
						st3.setString(1, str);
						ResultSet rs1 =  st3.executeQuery();
						while(rs1.next())
						{
							Date date=	 Calendar.getInstance().getTime();
							st1 = con.prepareStatement("insert into logintime values(?,?)");
							st1.setString(1, rs1.getString(1));
							st1.setString(2,date.toString());
							
								int count=st1.executeUpdate();
								if(count>0)
									response.getWriter().append("insert successful");
						}
						st4=con.prepareStatement("select count(*) from (select distinct uname from logintime) x");
						ResultSet rs4=st4.executeQuery();
						while(rs4.next())
						{
							int count1=rs4.getInt(1);
							System.out.println(count1);
						}
						res.sendRedirect("WelcomeUser");
					}	
			}
			else
				res.sendRedirect("ReLogin.html");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		
	}
		
		
		
	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
