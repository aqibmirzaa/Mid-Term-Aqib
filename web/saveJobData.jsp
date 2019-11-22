<%@ page import="Db.DbConnection" %><%--
  Created by IntelliJ IDEA.
  User: Shaoor Saeed
  Date: 11/22/2019
  Time: 12:22 AM
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
    String title=request.getParameter("title");
    String description=request.getParameter("description");
    String  jobtype=request.getParameter("jobtype");
    String  jobcity=request.getParameter("city");

    out.println("Job title is:"+title);
    out.println("Job Description is:"+description);
    out.println("Job Type is"+jobtype);
    out.println("Job City is"+jobcity);

    connection.insertJobData(title,description,jobtype,jobcity,1);

%>

</body>
</html>
