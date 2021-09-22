<%--
  Created by IntelliJ IDEA.
  User: Asif
  Date: 21-09-2021
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight details</title>
</head>
<body>
<h1><u>Flight details</u></h1><br>
<table>
    <tr> <td>From</td><td>:</td><td><%=request.getParameter("src")%></td> </tr>
    <tr> <td>To</td><td>:</td><td><%=request.getParameter("dest")%></td> </tr>
    <tr> <td>Airline</td><td>:</td><td><%=request.getParameter("airline")%></td> </tr>
    <tr> <td>Ticket Price</td><td>:</td><td>Rs.<%=request.getParameter("price")%></td> </tr>
    <tr> <td>Date</td><td>:</td><td><%=request.getParameter("date")%></td> </tr>
</table>
<h2><u>Passenger Details</u></h2>
<form action="passengerDetails">
    <table border="1">
        <tr><td>First Name</td> <td><input type="text" name="fname"></td></tr>
        <tr><td>Last Name</td> <td><input type="text" name="lname"></td></tr>
        <tr><td>Age</td> <td><input type="number" name="age"></td></tr>
        <tr><td>Phone no</td> <td><input type="number" name="phone"></td></tr>
    </table>
    <input type="submit">
</form>

</body>
</html>
