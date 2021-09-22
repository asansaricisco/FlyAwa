package com.example.flyonline;

import java.io.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

public class loginServlet extends HttpServlet {
    Connection connection=null;
    HttpServletResponse response;
    String passwordDb=null;
    String username = null;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.response=response;
        connect();
        this.passwordDb=passCheck();
        String password = request.getParameter("password");
        username = request.getParameter("username");
        Cookie un = new Cookie("username",username);
        response.addCookie(un);
        PrintWriter out = response.getWriter();

        if (password.equals(passwordDb)){
            out.println("login Successful");
            response.sendRedirect(request.getContextPath()+"/databaseAdmin.jsp");
        }
        else out.println("login failed");
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void connect(){
        String url = "jdbc:postgresql://localhost:5432/Fly";
        String username ="postgres";
        String password="admin123";
        try {
            DriverManager.registerDriver(new org.postgresql.Driver());
            this.connection = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            System.out.println(e);
        }
        if(this.connection != null){
            System.out.println("Database connection established");
        }
        else System.out.println("Database connection failed");
    }

    public String passCheck(){
        String passwordDb = null;
        try {
            Statement statement = this.connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select password from  login where email='"+username+"';");
            while (resultSet.next()){
                passwordDb = resultSet.getString("password");
            }
            System.out.println("passCheck complete");
        } catch (SQLException e) {
            System.out.println(e);
        }
        return passwordDb;
    }
}