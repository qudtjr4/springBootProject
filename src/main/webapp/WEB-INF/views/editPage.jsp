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
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
</head>
<body>
<body class="text-center">
	<form:form class="form-signin"
		action="${pageContext.request.contextPath}/editProfile/" method="POST"
		modelAttribute="user">
		<img class="mb-4" src="<c:url value="/resources/img/logo.jpg" />" alt=""
			width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal">Edit Profile</h1>
		<c:if test="${ message != null }">
			<div class="alert alert-success" role="alert">${message}</div>
		</c:if>
		<label for="username" class="sr-only">User Name</label>
		<form:hidden path="password" />
		<form:hidden path="id" />
		<form:input type="text" id="id" class="form-control" placeholder="ID"
			name="User Name" required="required" path="username" />
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
</body>
</body>
</html>