<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight details</title>
</head>
<body>
<h1>All flights details</h1>
<%@page import="java.sql.*"%>
<table border=1>
    <tr><th>source</th><th>destination</th><th>airline</th><th>ticket_price</th></tr>
    <%
        try{
            DriverManager.registerDriver(new org.postgresql.Driver());
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Fly","postgres","admin123");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from flights");
            while(rs.next()){
    %>
    <tr><td><%=rs.getString("source")%></td><td><%=rs.getString("destination")%></td><td><%=rs.getString("airline")%></td><td><%="Rs "+rs.getString("ticket_price")%></td></tr>
    <%
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