<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Add Course</title>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="resources/css/main.css">

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
		<jsp:include page="../sideBar.jsp"></jsp:include>
		
		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i>
					</button>

					<h2 class="col-12 ml-5 mt-2">Add Course</h2>

				</div>
			</nav>
			<div class="add-course">
				<h2>Course info</h2>
				</br>
				<form:form class="form-horizontal" role="form"
					action="${pageContext.request.contextPath}/addCourse" method="post"
					modelAttribute="course">
					<div class="form-group">
						<label class="col-md-3 control-label">Course Name:</label>
						<div class="">
							<form:input class="form-control" type="text" path="courseName"
								required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Course Short Name:</label>
						<div class="">
							<form:input class="form-control" type="text"
								path="courseShortName" required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-md-3 control-label">Start
							Date</label>
						<div class="">
							<form:input type="date" path="startDate" cssClass="form-control"
								required="required" />
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-md-3 control-label">End Date</label>
						<div class="">
							<form:input type="date" path="endDate" cssClass="form-control"
								required="required" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="">
							<form:button type="submit" class="btn btn-primary">Add Course</form:button>
							<span></span> <input type="reset" class="btn btn-default"
								value="Cancel">
						</div>
					</div>
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

	<script src="resources/js/main.js" type="text/javascript"></script>
</body>

</html>