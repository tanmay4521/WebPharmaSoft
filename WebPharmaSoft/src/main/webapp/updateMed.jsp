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
	<jsp:useBean id="m1" class="com.PharmaSoft.Medicine"></jsp:useBean>
	<jsp:setProperty property="*" name="m1"/>
	<%
		int status=DAO.UpdateMed(m1);
		if(status>0)
		{
			out.print("Data Updated Successfully!!!");
			response.sendRedirect("ViewMed.jsp");
		}
		else
		{
			out.print("Something Went Wrong, Please Try Again Later!!!!");
		}
	%>
</body>
</html>