<%--
  Created by IntelliJ IDEA.
  User: Asif
  Date: 21-09-2021
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to FlyAway</title>
</head>
<body>
<h1>Search the flight</h1>
<form action="SearchFlight">
  <table>
        <tr><td>source</td><td>:</td> <td><input type="text" name="src" ></td> </tr>
        <tr><td>destination</td><td>:</td><td><input type="text" name="dest"></td></tr>
        <tr><td>date of journey</td><td>:</td><td><input type="date" name="date"></td></tr>
  </table>
    <input type="submit" value="Search">
</form>

</body>
</html>
