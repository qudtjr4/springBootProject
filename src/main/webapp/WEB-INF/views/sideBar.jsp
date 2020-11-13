<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>MOSS - Management Of School System</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="resources/css/main.css">

<link rel="stylesheet" href="resources/css/calendar.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav id="sidebar">
		<div class="sidebar-header">
			<h3>
				<img class="mr-3" src="/resources/img/logo.jpg" alt="" width="72"
					height="72">MOSS
			</h3>
		</div>

		<ul class="list-unstyled components">
			<li class="active"><a href="/">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/editProfile">Profile</a></li>
			<li><a href="#pageSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-toggle">Announcements</a>
				<ul class="collapse list-unstyled" id="pageSubmenu">
					<li><a href="#">Page 1</a></li>
					<li><a href="#">Page 2</a></li>
					<li><a href="#">Page 3</a></li>
				</ul></li>

			<li><a href="#">Grade</a></li>
			<li><a href="#">Schedule</a></li>
			<%
				int id = (int) ((Map<String, Object>) session.getAttribute("login")).get("id");
			if (id == 0) {
				out.print("<li><a href='/admin'>Admin Page</a></li>");
			}
			%>

		</ul>

		<ul class="list-unstyled CTAs">

			<li><a href="${pageContext.request.contextPath}/login/logout"
				class="article">Log Out</a></li>
		</ul>
	</nav>
</body>
</html>