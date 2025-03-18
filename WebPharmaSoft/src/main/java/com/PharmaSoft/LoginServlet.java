package com.PharmaSoft;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String storedPassword = null;

        try (Connection con = DAO.getConnection();
             PreparedStatement pst = con.prepareStatement("SELECT password FROM user WHERE username=?")) {
            
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                storedPassword = rs.getString(1);
            }

            rs.close();
            if (storedPassword == null) {
                request.setAttribute("errorMessage", "Invalid Username!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (password.equals(storedPassword)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home.html");
            } else {
                request.setAttribute("errorMessage", "Invalid Credentials! Please try again.");
                request.getRequestDispatcher("index.html").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database Error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
