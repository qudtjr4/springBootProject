<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MOSS - Edit Profile</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<link href="<c:url value="/resources/css/signin.css" />"
	rel="stylesheet">

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
				<li class="active"><a href="/">Edit Profile</a></li>
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
			</ul>

			<ul class="list-unstyled CTAs">
				<li><a
					href="https://bootstrapious.com/tutorial/files/sidebar.zip"
					class="download">Download source</a></li>
				<li><a href="https://bootstrapious.com/p/bootstrap-sidebar"
					class="article">Back to article</a></li>
			</ul>
		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i>
					</button>

					<h2 class="col-10 mt-2">Home</h2>

					<a href="${pageContext.request.contextPath}/addCourse"><i
						type="button" class="fas fa-plus"></i> Add Course</a>

				</div>
			</nav>
			<div class="text-center">
				<form:form class="form-signin"
					action="${pageContext.request.contextPath}/editProfile/"
					method="POST" modelAttribute="user">
					<img class="mb-4" src="<c:url value="/resources/img/logo.jpg" />"
						alt="" width="72" height="72">
					<h1 class="h3 mb-3 font-weight-normal">Edit Profile</h1>
					<c:if test="${ message != null }">
						<div class="alert alert-success" role="alert">${message}</div>
					</c:if>
					<label for="username" class="sr-only">User Name</label>
					<form:hidden path="password" />
					<form:hidden path="id" />
					<form:input type="text" id="id" class="form-control"
						placeholder="ID" name="User Name" required="required"
						path="username" />
					<label for="email" class="sr-only">Email</label>
					<form:input type="text" id="email" class="form-control mt-3"
						placeholder="Email" name="email" required="required" path="email" />
					<label for="address" class="sr-only">Address</label>
					<form:input type="text" id="address" class="form-control mt-3"
						placeholder="Address" name="address" required="required"
						path="address" />
					<label for="phoneNum" class="sr-only">Phone Number</label>
					<form:input type="text" id="phoneNum" class="form-control mt-3"
						placeholder="Phone Num" name="phoneNum" required="required"
						path="phoneNum" />
					<label for="dateOfBirth" class="sr-only">Date Of Birth</label>
					<form:input type="date" id="dateOfBirth" class="form-control mt-3"
						placeholder="Date Of Birth" name="dateOfBirth" required="required"
						path="dateOfBirth" />
					<label for="typeId" class="sr-only">Type of user</label>
					<table class="table">
						<tr>
							<td><form:radiobutton class="form-control mt-3"
									placeholder="Type Id" name="typeId" required="required"
									path="typeId" value="1" />Instructor</td>
							<td><form:radiobutton class="form-control mt-3"
									placeholder="Type Id" name="typeId" required="required"
									path="typeId" value="2" />Student</td>
						</tr>
					</table>
					<form:button class="btn btn-lg btn-primary btn-block" type="submit">Edit</form:button>
					<p class="mt-5 mb-3 text-muted">&copy; Rhiphumi - MOSS</p>
				</form:form>
			</div>
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
</body>
</html>