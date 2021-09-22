<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ticket</title>
</head>
<body>
<% Cookie[] cookies = new Cookie[10];
    Cookie[] cookie = request.getCookies();
    for (Cookie c: cookie) {
        if(c.getName().equals("src")){
            cookies[0]=c;
        }
        else if(c.getName().equals("dest")){
            cookies[1]=c;
        }
        else if(c.getName().equals("date")){
            cookies[2]=c;
        }
        else if(c.getName().equals("airline")){
            cookies[3]=c;
        }
        else if(c.getName().equals("price")){
            cookies[4]=c;
        }else if(c.getName().equals("fname")){
            cookies[5]=c;
        }else if(c.getName().equals("age")){
            cookies[6]=c;
        }else if(c.getName().equals("phone")){
            cookies[7]=c;
        }else if(c.getName().equals("lname")){
            cookies[8]=c;
        }
    }%>
<h1><u>Flight details</u></h1>
<table>
    <tr> <td>From</td><td>:</td><td><%=cookies[0].getValue()%></td> </tr>
    <tr> <td>To</td><td>:</td><td><%=cookies[1].getValue()%></td> </tr>
    <tr> <td>Airline</td><td>:</td><td><%=cookies[3].getValue()%></td> </tr>
    <tr> <td>Ticket Price</td><td>:</td><td>Rs.<%=cookies[4].getValue()%></td> </tr>
    <tr> <td>Date</td><td>:</td><td><%=cookies[2].getValue()%></td> </tr>
</table>
<h2>Ticket details</h2>
<table border="1">
    <tr><td>Flight Reservation Id</td><td>JDJBVU1532C</td></tr>
    <tr><td>Seat No </td><td>49</td>
    <tr><td>Departure Time</td><td>10:30PM</td></tr>
    <tr><td>Arrival Time</td><td>12:30PM</td></tr>
    <tr><td>Duration</td><td>2 hours</td></tr>
</table>
<h3><u>Passenger Details</u></h3>
<table border="1">
    <tr><td>Passenger name </td><td><%=cookies[5].getValue()+" "+cookies[8].getValue()%></td></tr>
    <tr><td>Age </td><td><%=cookies[6].getValue()%></td></tr>
    <tr><td>Phone </td><td><%=cookies[7].getValue()%></td></tr>
</table>

<a href="HomePage.jsp"><input type="button" value="Go to Home"></a>
</body>
</html>
