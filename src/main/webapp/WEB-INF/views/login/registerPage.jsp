<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MOSS - Sign up</title>


<!-- Bootstrap core CSS -->
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

.center_div {
	margin: 0 auto;
	width: 50% /* value of your choice which suits your alignment */
}
</style>
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/signin.css" />"
	rel="stylesheet">
</head>
<body class="text-center">
	
	<div class="container center_div">
		<form:form action="${pageContext.request.contextPath}/login/register"
			method="POST"
			oninput='password2.setCustomValidity(password2.value != password.value ? "Passwords do not match." : "")'
			modelAttribute="user">
			<img class="mb-4" src="<c:url value="/resources/img/logo.jpg" />"
				alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-normal">Sign up</h1>
			<c:if test="${ message != null }">
				<div class="alert alert-success" role="alert">${message}</div>
			</c:if>


			<div class="form-group row">
				<label for="username" class="col-sm-2 col-form-label">User
					Name</label>
				<div class="col-sm-10">
					<form:input type="text" id="username" class="form-control"
						placeholder="User Name" name="username" required="required"
						path="username" />
				</div>
			</div>
			<div class="form-row align-items-center">

				<div class="form-group col-md-6">
					<form:input type="password" id="password" class="form-control mt-3"
						placeholder="Password" name="password" required="required"
						path="password" />
				</div>
				<div class="form-group col-md-6">
					<input type="password" id="password2" class="form-control mt-3"
						placeholder="Confirm Password" name="password2"
						required="required" />
				</div>
			</div>
			<br>
			<div class="form-group row">
				<label for="email" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<form:input type="email" id="id" class="form-control"
						placeholder="EMAIL" name="email" required="required" path="email" />
				</div>
			</div>
			<div class="form-group row">
				<label for="address" class="col-sm-2 col-form-label">Address</label>
				<div class="col-sm-10">
					<form:input type="text" id="address" class="form-control"
						placeholder="ADDRESS" name="address" required="required"
						path="address" />
				</div>
			</div>
			<div class="form-group row">
				<label for="phoneNum" class="col-sm-2 col-form-label">Phone</label>
				<div class="col-sm-10">
					<form:input type="tel" id="phoneNum" class="form-control"
						placeholder="###-####-####" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
						name="phoneNum" required="required" path="phoneNum" />
				</div>
			</div>
			<div class="form-group row">
				<label for="dateOfBirth" class="col-sm-2 col-form-label">Birth
					Date</label>
				<div class="col-sm-10">
					<form:input type="date" id="dateOfBirth" class="form-control"
						name="dateOfBirth" required="required" path="dateOfBirth" />
				</div>
			</div>
			<form:radiobutton class="" name="typeId" id="typeId" value="0"
				path="typeId" />
			<label class="form-check-label" for="gridRadios1">Instructor</label>
			<form:radiobutton class="" name="typeId" id="typeId" value="1"
				path="typeId" />
			<label class="form-check-label" for="gridRadios2">Student</label>
			<form:hidden id="status" name="status" value="false"
				path="status" />
			<br>
			<br>


			<form:button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</form:button>
			<p class="text-center mt-5 mb-5">
				<a href="${pageContext.request.contextPath}/login">Login</a>
			</p>
			<p class="mt-5 mb-3 text-muted">&copy; Rhiphumi - MOSS</p>
		</form:form>
	</div>
</body>
</html>
