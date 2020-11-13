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
<script type="text/javascript">
var root;

$(document).ready(function(){
	debugger;
	getFolder(${folders.getId()});
});

function postFolder(){
	var folder = JSON.stringify({
		'parentId':$('#parentId').val(),
		'name':$('#name').val(),
	});
	
	
	$.ajax({
		url:'${pageContext.request.contextPath}/fileExplorer/',
		type:'POST',
		contentType : 'application/json; charset=utf-8',
		success:function(data){getFolder(${folders.getId()})},
	    done: function(){alert("Done")},
	    fail: function(){alert("Fail")},
	    data: folder
	});
}

function getFolder(id){
	$.ajax({
		url:'${pageContext.request.contextPath}/findFolder/',
		type:'GET',
		contentType : 'application/json; charset=utf-8',
		success:function(data){success(data)},
	    done: function(data){success(data)},
	    fail: function(response){alert(response)},
	    data: {'id':id}
	});
}
	
function success(data){
	$("#folderContainer").empty();
	$.each(data.folderList, function(index, value){
		$("#folderContainer").append(
				'<a class="nav-link"'
					+'href="${pageContext.request.contextPath}/fileExplorer?id='+value.id+'">'
					+'<div class="col-sm-2">'
						+'<div class="card " style="width: 10rem">'
							+'<img class="align-self-center"'
								+'src="/resources/img/folder.png" alt=""'
								+'width="72" height="72">'
							+'<div class="card-body">'
								+'<h5 class="">'+value.name+'</h5>'
							+'</div>'
						+'</div>'
					+'</div>'
				+'</a>'
		);
	});
	
	$('#newFolder').modal('hide');
}

</script>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="sideBar.jsp"%>

		<!-- Page Content  -->
		<div id="content">

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
							<form:hidden path="parentId" value="${folders.getId()}" />
							<div class="modal-body">
								<label for="name" class="sr-only">Folder name</label>
								<form:input type="text" id="name" class="form-control"
									placeholder="name" name="Name" required="required" path="name" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-dark"
									onClick="postFolder()">Create</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>

			<%-- <!-- Pop up, add file -->
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
						<hidden path="folderId" value="${folders.getId()}" />
						<div class="modal-body">
							<label for="name" class="sr-only">File name</label>
							<form:input type="text" id="name" class="form-control"
								placeholder="name" name="Name" required="required" path="name" />
							<label for="path" class="sr-only">File location</label> <input
								multiple="multiple" type="file" name="file1" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-dark">Upload</button>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div> --%>


			<div class="container">
				<div class="" id="fileExplorer">
					<div class="row border rounded">
						<div class="col-sm-1 border">|||</div>
						<div class="col-sm-9 border">
							<c:forEach var="i" items="${path}">
								<a
									href="${pageContext.request.contextPath}/fileExplorer?id=${i.key}">
									<c:out value="${i.value}" />
								</a> /
					</c:forEach>
						</div>
						<div class="col-sm-1 border">
							<a href="#" onClick="$('#newFolder').modal('show')">+ Folder</a>
						</div>
						<div class="col-sm-1 border">
							<a href="#" onClick="$('#newFile').modal('show')">+ File</a>
						</div>
					</div>
					<div class="row border rounded">
						<div class="col-sm border">
							<div class="container">
								<c:set var="count" value="0" />
								<div class="row" id="folderContainer"></div>
							</div>
						</div>
					</div>


				</div>
			</div>

		</div>
	</div>

</body>
</html>