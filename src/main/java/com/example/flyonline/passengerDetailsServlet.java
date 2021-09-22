package com.example.flyonline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "passengerDetails",urlPatterns = "/passengerDetails")
public class passengerDetailsServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Cookie cookie = new Cookie("fname",req.getParameter("fname"));
        Cookie cookie3 = new Cookie("lname",req.getParameter("lname"));
        Cookie cookie1 = new Cookie("age",req.getParameter("age"));
        Cookie cookie2 = new Cookie("phone",req.getParameter("phone"));
        res.addCookie(cookie);
        res.addCookie(cookie1);
        res.addCookie(cookie2);
        res.addCookie(cookie3);
        res.sendRedirect("ConfirmPage.jsp");
    }
}
