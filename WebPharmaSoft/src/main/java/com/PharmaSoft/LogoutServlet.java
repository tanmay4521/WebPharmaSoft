package com.PharmaSoft;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException
	{
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession();
		session.invalidate();
		out.print("<h2>Logged Out Successfully!!!!!</h2>");
		resp.sendRedirect("index.html");
		out.close();
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws IOException
	{
		doPost(req, resp);
	}
}
