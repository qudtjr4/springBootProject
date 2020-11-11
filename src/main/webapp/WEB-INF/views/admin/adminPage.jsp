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
<link rel="stylesheet" href="resources/css/style.css">

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
	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<h3>
					<img class="mr-3" src="/resources/img/logo.jpg" alt="" width="72"
						height="72">MOSS
				</h3>
			</div>

			<ul class="list-unstyled components">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/editProfile">Profile</a>
				</li>
				<li><a href="#pageSubmenu" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle">Pages</a>
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="#">Page 1</a></li>
						<li><a href="#">Page 2</a></li>
						<li><a href="#">Page 3</a></li>
					</ul></li>
				<li><a href="#">Portfoli</a></li>
				<li><a href="#">Contact</a></li>
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

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i>
					</button>
					<h2 class="col-10 mt-2">Accept Permission</h2>

					<a href="${pageContext.request.contextPath}/addCourse"><i
						type="button" class="fas fa-plus"></i> Add Course</a>

				</div>
			</nav>
			<c:if test="${ instructors.size() != 0 }">
				<h1>Instructors</h1>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Accept</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="instructor" items="${instructors}">
							<tr>
								<th scope="row">${ instructor.id }</th>
								<td>${ instructor.username }</td>
								<td>${ instructor.email }</td>
								<td>${ instructor.phoneNum }</td>
								<td><a href="/admin/acceptPermission?id=${instructor.id}"><button type="button"
											class="btn btn-primary">Accept</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${ students.size() != 0 }">
				<h1>Students</h1>
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Accept</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="student" items="${students}">
							<tr>
								<th scope="row">${ student.id }</th>
								<td>${ student.username }</td>
								<td>${ student.email }</td>
								<td>${ student.phoneNum }</td>
								<td><a href="/admin/acceptPermission?id=${student.id}"><button type="button"
											class="btn btn-primary">Accept</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>






			
					

		</div>
	</div>

	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>
</body>

</html>