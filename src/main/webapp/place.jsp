<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>places</title>
</head>
<body>
<h1>All places</h1>
<%@page import="java.sql.*"%>
<table border=1>
    <tr><th>place</th></tr>
    <%
        try{
            DriverManager.registerDriver(new org.postgresql.Driver());
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Fly","postgres","admin123");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from places");
            while(rs.next()){
    %>
    <tr><td><%=rs.getString("place")%></td></tr>
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