<%@ page import="Db.DbConnection" %><%--
  Created by IntelliJ IDEA.
  User: Shaoor Saeed
  Date: 11/21/2019
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DbConnection connection=new DbConnection();

    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String password=request.getParameter("password");

    out.println("name is: "+name);
    out.println("email is: "+email);
    out.println("password is: "+password);

    connection.insertUserData(name,email,password);
%>
</body>
</html>
