package com.example.flyonline;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SearchFlight" , urlPatterns = "/SearchFlight")
public class SearchFlightResult extends HttpServlet {
    public  void service(HttpServletRequest req , HttpServletResponse res ){
        String source = req.getParameter("src");
        String destination = req.getParameter("dest");
        String date = req.getParameter("date");
        Cookie src = new Cookie("src",source);
        Cookie dest = new Cookie("dest",destination);
        Cookie dat = new Cookie("date",date);
        res.addCookie(src);
        res.addCookie(dat);
        res.addCookie(dest);
        try {
            res.sendRedirect(req.getContextPath()+"/SearchFlightRes.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
