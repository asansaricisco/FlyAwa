<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Airlines</title>
</head>
<body>
<h1>All Airlines</h1>
<%@page import="java.sql.*"%>
<table border=1>
    <tr><th>airline</th></tr>
    <%
        try{
            DriverManager.registerDriver(new org.postgresql.Driver());
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Fly","postgres","admin123");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from airlines");
            while(rs.next()){
    %>
    <tr><td><%=rs.getString("airline")%></td></tr>
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