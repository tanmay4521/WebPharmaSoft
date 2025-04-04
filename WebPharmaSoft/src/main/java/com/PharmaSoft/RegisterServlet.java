package com.PharmaSoft;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username == null || username.trim().isEmpty() || 
           password == null || password.trim().isEmpty()) {
            response.sendRedirect("register.jsp?error=emptyFields");
            return;
        }

        User u = new User();
        u.setUserName(username);
        u.setPassword(password);

        try {
            int status = DAO.registerUser(u);
            if (status > 0) {
                response.sendRedirect("index.html?msg=registered");
            } else {
                response.sendRedirect("register.jsp?error=registrationFailed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Replace with logger in production
            response.sendRedirect("error.jsp");
        }
    }
}
