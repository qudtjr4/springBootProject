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
</style>
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/signin.css" />" rel="stylesheet">
</head>
<body class="text-center">
	<form:form class="form-signin" action="${pageContext.request.contextPath}/login/register" 
	method="POST" oninput='password2.setCustomValidity(password2.value != password.value ? "Passwords do not match." : "")' modelAttribute="user">
		<img class="mb-4" src="<c:url value="/resources/img/logo.jpg" />" alt=""
			width="72" height="72">
			<c:if test="${user.username != null}">
				<h1 class="h3 mb-3 font-weight-normal">Edit Profile</h1>
			</c:if>
			<c:if test="${user.username == null}">
				<h1 class="h3 mb-3 font-weight-normal">Sign up</h1>
			</c:if>
		<c:if test="${ message != null }" >
				<div class="alert alert-success" role="alert">${message}</div>
			 </c:if>	
		<label for="username" class="sr-only">ID</label> 
		<form:input type="text" id="id" class="form-control" placeholder="ID" name="username" required="required" path="username"/>
		<label for="password" class="sr-only">Password</label> 
		<form:input type="password" id="password" class="form-control mt-3" placeholder="Password" name="password" required="required" path="password"/>
		<label for="confirmPassword" class="sr-only">Confirm Password</label> 
		<input type="password" id="password2" class="form-control mt-3" placeholder="Confirm Password" name="password2" required="required" />
		<c:if test="${user.username != null}">
		<form:button class="btn btn-lg btn-primary btn-block" type="submit">Edit</form:button>
		</c:if>
		<c:if test="${user.username == null}">
		<form:button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</form:button>
		</c:if>
		<p class="text-center mt-5 mb-5">
			<a href="${pageContext.request.contextPath}/login">Login</a>
		</p>
		<p class="mt-5 mb-3 text-muted">&copy; Rhiphumi - MOSS</p>
	</form:form>
</body>
</html>
