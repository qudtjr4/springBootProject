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

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
	
	
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

			<div id="manageStudent" class="text-center mt-5">
				<a href="${pageContext.request.contextPath}/manageStudent?id=${folders.getId()}"><i
					class="fas fa-plus"></i>Manage Student</a>
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