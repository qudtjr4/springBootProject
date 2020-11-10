<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Explorer</title>
<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/resources/js/jquery-1.11.1.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
</head>
<body>

	<nav
		class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-between">
		<a class="navbar-brand" href="#">MOSS</a>
		<!-- <p class="navbar-text">Management Of School System</p> -->
		<button class="navbar-toggler navbar-left" type="button"
			data-toggle="collapse" data-target="#navbarContent"
			aria-controls="navbarContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toogler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav nav-justified ">
				<li class="nav-item dropdown navbar-right"><a
					class="nav-link dropdown-toggle" id="navbarInstructor"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Menu Instructor</a>
					<div class="dropdown-menu" aria-labelledby="navbarInstructor">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editProfile">Edit
							Profile</a> <a class="dropdown-item" href="#">Edit member List</a> <a
							class="dropdown-item" href="#">Create new folder</a>
					</div></li>
				<li class="nav-item dropdown navbar-right"><a
					class="nav-link dropdown-toggle" id="navbarStudent" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Menu Student</a>
					<div class="dropdown-menu" aria-labelledby="navbarStudent">
						<a class="dropdown-item"
							href="${pageContext.request.contextPath}/editProfile">Edit
							Profile</a> <a class="dropdown-item" href="#">Leave room</a>
					</div></li>
				<li>
					<button type="button" class="bt	n btn-dark navbar-btn bg-dark">
						<a href="${pageContext.request.contextPath}/login/logout">Sign
							out</a>
					</button>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Pop up, add new folder -->
	<div class="modal fade" id="newFolder" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New folder</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form class="form-signin"
					action="${pageContext.request.contextPath}/fileExplorer/"
					method="POST" modelAttribute="folders">
					<form:hidden path="fatherId" value="${folders.getId()}"/>
					<div class="modal-body">
						<label for="name" class="sr-only">Folder name</label>
						<form:input type="text" id="name" class="form-control"
							placeholder="name" name="Name" required="required" path="name" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-dark">Create</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<!-- Pop up, add file -->
	<div class="modal fade" id="newFile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New folder</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form:form class="form-signin"
					action="${pageContext.request.contextPath}/fileExplorer/AddFile/"
					method="POST" modelAttribute="file">
					<form:hidden path="folderId" value="${folders.getId()}"/>
					<div class="modal-body">
						<label for="name" class="sr-only">File name</label>
						<form:input type="text" id="name" class="form-control"
							placeholder="name" name="Name" required="required" path="name" />
						<label for="location" class="sr-only">File location</label>
						<form:input type="file" placeholder="file location" path="location"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-dark">Upload</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="" id="fileExplorer">
			<div class="row border rounded">
				<div class="col-sm-1 border">|||</div>
				<div class="col-sm-9 border">${folders.getName()}</div>
				<div class="col-sm-1 border"><a href="#" onClick="$('#newFolder').modal('show')">+ Folder</a></div>
				<div class="col-sm-1 border"><a href="#" onClick="$('#newFile').modal('show')">+ File</a></div>
			</div>
			<div class="row border rounded">
				<div class="col-sm-2 border">
					<ul class="nav flex-colum">
						<c:forEach var="folder" items="${folders.getFolderList()}">
							<li class="nav-item"><a class="nav-link" href="#"><c:out
										value="${folder.getName()}" /></a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-sm-10 border">
					<div class="container">
						<c:set var="count" value="0" />
						<div class="row">
							<c:forEach var="folder" items="${folders.getFolderList()}">
								<div class="col-sm-4">
									<div class="card" style="width: 18rem;">
										<img class="mb-4"
											src="<c:url value="/resources/img/folder.png" />" alt=""
											width="72" height="72">
										<div class="card-body">
											<a class="nav-link" href="${pageContext.request.contextPath}/fileExplorer?id=${folder.getId()}"><h5 class="card-tittle">
													<c:out value="${folder.getName()}" />
												</h5></a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>