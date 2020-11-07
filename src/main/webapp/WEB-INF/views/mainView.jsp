<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MOSS</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/static/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/static/css/main.css" />" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<a class="navbar-brand" href="#">MOSS</a>
		<!-- <p class="navbar-text">Management Of School System</p> -->
		<button class="navbar-toggler navbar-left" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toogler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav nav-justified ">
				<li class="nav-item dropdown navbar-right">
					<a class="nav-link dropdown-toggle" id="navbarInstructor" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Menu Instructor</a>
					<div class="dropdown-menu" aria-labelledby="navbarInstructor">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/editProfile">Edit Profile</a>
						<a class="dropdown-item" href="#">Edit member List</a>
						<a class="dropdown-item" href="#">Create new folder</a>
					</div>
				</li>
				<li class="nav-item dropdown navbar-right">
					<a class="nav-link dropdown-toggle" id="navbarStudent" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Menu Student</a>
					<div class="dropdown-menu" aria-labelledby="navbarStudent">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/editProfile">Edit Profile</a>
						<a class="dropdown-item" href="#">Leave room</a>
					</div>
				</li>
				<li>
					<button type="button" class="bt	n btn-dark navbar-btn bg-dark"><a href="${pageContext.request.contextPath}/login/logout">Sign out</a></button>
				</li>
			</ul>
		</div>
	</nav>
	<c:if test="${ message != null }" >
				<div class="alert alert-success" role="alert">${message}</div>
			 </c:if>	
	<div class="page-header" id="mainHeader">
		<h1>Welcome to MOSS</h1>
	</div>
	<div class="container" id="container">
		<div class="row">
			<div class="col-sm-6 col-md-4 border m-3">
				<div class="thumbnail">
					<div class="caption">
						<h3>Feature 1</h3>
						<p>Container for next features</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4 border m-3">
				<div class="thumbnail">
					<div class="caption">
						<h3>Feature 2</h3>
						<p>Container for next features</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4 border m-3">
				<div class="thumbnail">
					<div class="caption">
						<h3>Feature 3</h3>
						<p>Container for next features</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>