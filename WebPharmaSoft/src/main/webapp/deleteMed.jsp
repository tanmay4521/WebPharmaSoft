<%@page import="com.PharmaSoft.Medicine"%>
<%@page import="com.PharmaSoft.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int id=Integer.parseInt(request.getParameter("id"));
		int status=DAO.deleteMedicine(id);
		if(status>0)
		{
			response.sendRedirect("ViewMed.jsp");		
		}
		else
		{
			response.sendRedirect("error.jsp");
		}
	%>
</body>
</html>