<%--
  Created by IntelliJ IDEA.
  User: Shaoor Saeed
  Date: 11/21/2019
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jobs</title>
</head>
<script>
    function myFunction() {
        window.open("saveJobData.jsp")
    }
</script>

<body>
<form action="saveJobData.jsp" method="post">
<div class="form-group">
    <input type="text" class="form-control" name="title" >
</div>
<div class="form-group">
    <label for="exampleInputDescription">Description</label>
    <input type="text" class="form-control" name="description" id="exampleInputDescription" aria-describedby="Help">
</div>
    <legend>Job Type</legend>
    <div class="form-check">
        <label class="form-check-label">
            <input type="radio" class="form-check-input" name="jobtype" id="optionsRadios1" value="Full time" checked="">
            Full Time
        </label>
    </div>
    <div class="form-check">
        <label class="form-check-label">
            <input type="radio" class="form-check-input" name="jobtype" id="optionsRadios2" value="Part Time">
            Part time
        </label>
    </div>
<div class="form-group">
    <label for="exampleSelect1">Select City</label>
    <select class="form-control" name="city" id="exampleSelect1">
        <option>Karachi</option>
        <option>Lahore</option>
        <option>Islamabad</option>
    </select>
</div>

    <button onclick="myFunction()">PostJob</button>
<style type="text/css">

</style>
</form>
</body>
</html>
