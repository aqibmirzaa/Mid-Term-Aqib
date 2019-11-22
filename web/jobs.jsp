<%@ page import="java.sql.SQLException" %>
<%@ page import="Db.DbConnection" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Shaoor Saeed
  Date: 11/21/2019
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #333;
    }
    p {
        color: white;
    }

    li {
        float: left;
    }

    li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    /* Change the link color to #111 (black) on hover */
    li a:hover {
        background-color: #111;
    }
</style>
<head>
    <title>Jobs</title>
</head>
<script>
    function myFunction() {
        window.open("login.jsp")
    }
    function myFunction1() {
        window.open("postjob.jsp")
    }
</script>
<body>
<form action="postjob.jsp" method="post">
<ul>
    <li><p>BSE163018</p></li>
    <li style="float:right"><button onclick="myFunction()">Logout</button></li>
    <li style="float:right"><button onclick="myFunction1()">PostJob</button></li>

</ul>
</form>
<%
    DbConnection connection=new DbConnection();
    ResultSet resultSet=connection.displayJobRecords();

    response.setContentType("text/html");
    out.println("<html>\n" +
            "<head>\n" +
            "<style>\n" +
            "table {\n" +
            "  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\n" +
            "  border-collapse: collapse;\n" +
            "  width: 100%;\n" +
            "}\n" +
            "\n" +
            " td,th {\n" +
            "  border: 1px solid #ddd;\n" +
            "  padding: 8px;\n" +
            "}\n" +
            "\n" +
            "tr:nth-child(even){background-color: #f2f2f2;}\n" +
            "\n" +
            "tr:hover {background-color: #ddd;}\n" +
            "\n" +
            "th {\n" +
            "  padding-top: 12px;\n" +
            "  padding-bottom: 12px;\n" +
            "  text-align: left;\n" +
            "  background-color: #4CAF50;\n" +
            "  color: white;\n" +
            "}\n" +
            "</style>\n" +
            "</head>\n" +
            "<body>");

    out.print("<table> <tr> <th>Title</th>  <th>Description</th> <th>JobType</th> <th>JobCity</th><th>Postedby</th> </tr>");
    try {

        while (resultSet.next()){

            out.print("<td>"+resultSet.getString("title")+"</td>");
            out.print("<td>"+resultSet.getString("description")+"</td>");
            out.print("<td>"+resultSet.getString("jobtype")+"</td>");
            out.print("<td>"+resultSet.getString("jobcity")+"</td> ");
            out.print("<td>"+resultSet.getInt("postedby")+"</td></tr>");

        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
    out.print("</table></body></html>");
%>
</body>
</html>
