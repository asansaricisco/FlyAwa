package com.example.flyonline;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "changePass",urlPatterns = "/changePass")
public class changePassServlet extends HttpServlet {
    Connection connection = null;
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        connect();
        PrintWriter out = res.getWriter();
        String pass1 = req.getParameter("pass1");
        String pass2 = req.getParameter("pass2");
        Cookie[] cookies = req.getCookies();
        String username = null;
        for (Cookie c:cookies) {
            if(c.getName().equals("username")){
                username=c.getValue();
            }
        }
        String query ="update login set password ='"+pass1+"'where email='"+username+"';";
        try {
            if(pass1.equals(pass2)) {
                System.out.println("both password matched");
                Statement statement = connection.createStatement();
                statement.execute(query);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        out.println("password changed");

        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher rq = req.getRequestDispatcher("databaseAdmin.jsp");
        rq.forward(req, res);
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
}

