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
    int id = Integer.parseInt(request.getParameter("id"));
    Medicine m1 = DAO.getData(id);
    if (m1 != null) {
        request.setAttribute("selectedMed", m1);
        request.getRequestDispatcher("SellMed.jsp").forward(request, response);
    } else {
        out.println("<p style='color:red'>Medicine not found!</p>");
    }
%>

</body>
</html>