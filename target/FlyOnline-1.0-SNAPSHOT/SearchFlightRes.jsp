<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Asif
  Date: 21-09-2021
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Flights</title>
</head>
<%Cookie[] cookie = request.getCookies();
ArrayList<Cookie> AlCookie = new ArrayList<>();
    for (Cookie c: cookie) {
        if(c.getName().equals("src")){
            AlCookie.add(c);
        }
    }for (Cookie c: cookie) {
        if(c.getName().equals("dest")){
            AlCookie.add(c);
        }
    }for (Cookie c: cookie) {
        if(c.getName().equals("date")){
            AlCookie.add(c);
        }
    }
%>
<body>
           <h1>All flights available from <%=AlCookie.get(0).getValue()%> to <%=AlCookie.get(1).getValue()%> on <%=AlCookie.get(2).getValue()%></h1>
       <table border=1>
           <tr><th>source</th><th>destination</th><th>airline</th><th>ticket_price</th></tr>
           <%
               String query = "select * from flights where source ='"+AlCookie.get(0).getValue()+"' and destination ='"+AlCookie.get(1).getValue()+"';";
               try{
                   DriverManager.registerDriver(new org.postgresql.Driver());
                   Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Fly","postgres","admin123");
                   Statement st=con.createStatement();
                   ResultSet rs=st.executeQuery(query);
                   while(rs.next()){
           %>
           <tr><form action="passengerDetails.jsp">
               <td><%=rs.getString("source")%> <input type="hidden" name="src" value="<%=rs.getString("source")%>"></td>
               <td><%=rs.getString("destination")%> <input type="hidden" name="dest" value="<%=rs.getString("destination")%>"></td>
               <td><%=rs.getString("airline")%> <input type="hidden" name="airline" value="<%=rs.getString("airline")%>"></td>
               <td><%="Rs "+rs.getString("ticket_price")%> <input type="hidden" name="price" value="<%=rs.getString("ticket_price")%>"></td>
               <td><input type="submit" value="Reserve"> </td>
               <input type="hidden" name="date" value="<%=AlCookie.get(2).getValue()%>">
           </form></tr>
           <% Cookie cookie1 = new Cookie("airline",rs.getString("airline"));
              Cookie cookie2 = new Cookie("price",rs.getString("ticket_price"));
              response.addCookie(cookie1);
              response.addCookie(cookie2);
                   }
                   rs.close();
                   st.close();
                   con.close();
               }
               catch(Exception e){
                   System.out.println(e);
               }
           %>
       </table>
</body>
</html>
