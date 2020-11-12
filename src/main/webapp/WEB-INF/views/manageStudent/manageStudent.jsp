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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
		$('#search').autocomplete({
			source: '${pageContext.request.contextPath}/manageStudent/searchEmail',
			
		});

	});
	</script>
	
</head>

<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<jsp:include page="../sideBar.jsp"></jsp:include>

		<!-- Page Content  -->
		<div id="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<div class="row">
						<div class="col-1">
							<button type="button" id="sidebarCollapse" class="btn btn-info">
								<i class="fas fa-align-left"></i>
							</button>
						</div>
					</div>
					<div class="col-8">
						<h2 class="col-10 mt-2">Home</h2>
					</div>
					<div class="col-3">
						<div class="float-right">
							<a href="${pageContext.request.contextPath}/addCourse"><i
								type="button" class="fas fa-plus"></i> Add Course</a>
						</div>
					</div>
				</div>
			</nav>

			<div class="row justify-content-center">
				<div class="col-8">
					<form:form method="post" action="${pageContext.request.contextPath}/manageStudent/addStudent">
						<h5>Search Student</h5>
						<form:input class="form-control" type="text" id="search" path="email"/>
						<p class="text-center pt-3">
							<input type="submit" class="btn btn-primary" value="Add">
						</p>
					</form:form>

				</div>
			</div>





		</div>
	</div>




	
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