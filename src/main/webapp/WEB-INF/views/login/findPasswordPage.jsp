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
<title>MOSS - Sign In</title>


<!-- Bootstrap core CSS -->
<link href="<c:url value="/static/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/static/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>


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
<link href="<c:url value="/static/css/signin.css" />" rel="stylesheet">
</head>
<body class="text-center">

	<form class="form-signin"
		action="${pageContext.request.contextPath}/login/findPassword"
		method="POST">

		<img class="mb-4" src="<c:url value="/static/img/logo.jpg" />" alt=""
			width="72" height="72">
		<h1 class="h1 mb-3 font-weight-normal">Find Password <br></h1>
		<p class="mb-3 font-weight-normal">Please Enter Username and Password</p>
		<c:if test="${ message != null }">
			<div class="alert alert-success" role="alert">${message}</div>
		</c:if>
		<label for="id" class="sr-only">ID</label> <input type="text" id="id"
			class="form-control" placeholder="ID" name="id" required autofocus>
		<label for="email" class="sr-only">Email</label> <input type="email"
			id="email" class="form-control" placeholder="Email" name="email"
			required>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Send
			Email</button>
		<p class="mt-5 mb-3 text-muted"><a href="${pageContext.request.contextPath}/login">Go Back</a>
		<br><br>&copy; Rhiphumi - MOSS</p>
	</form>
</body>
</html>
