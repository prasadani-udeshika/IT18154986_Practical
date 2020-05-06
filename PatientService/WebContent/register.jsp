<%@page import="com.register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Service  Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/register.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-6">
<h1>Patient Registration Service  </h1>
<form id="formItem" name="formItem">
 User Name :
 <input id="UName" name="UName" type="text" class="form-control form-control-sm"placeholder=" Meena Perera" >
 <br> User NIC:
 <input id="NIC" name="NIC" type="text" class="form-control form-control-sm" placeholder="912345678V">
 <br> User Phone Number:
 <input id="userPhon" name="userPhon" type="text"  class="form-control form-control-sm" placeholder=" 0112234567 or 0771234567">
 <br> User Email :
 <input id="email" name="email" type="text" class="form-control form-control-sm" placeholder="meena@gmail.com" >
 <br> Enter Password :
 <input id="passw" name="passw" type="text" class="form-control form-control-sm" placeholder="meena123" >
 <br> Confirm password:
 <input id="cpass" name="cpass" type="text" class="form-control form-control-sm" placeholder="meena123">
 <br>
 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave"  name="hidItemIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divItemsGrid">
 <%
 register itemObj = new register();
 out.print(itemObj.readRe());
 %>
</div>
</div>
 </div>
</div>

</body>
</html>