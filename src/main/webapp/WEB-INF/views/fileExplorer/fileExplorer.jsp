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
	/* debugger; */
	getFolder(${folders.getId()});
});

function postFolder(){
	var folder = JSON.stringify({
		'parentId':${folders.getId()},
		'name':$('#name').val(),
	});
	
	
	$.ajax({
		url:'${pageContext.request.contextPath}/fileExplorer/',
		type:'POST',
		contentType : 'application/json',
		dataType:'json',
		success:function(data){getFolder(${folders.getId()})},
	    done: function(){alert("Done")},
	    error: function(error){alert(error)},
	    data: folder
	});
}

function postFile(){
	var form = $('#formFile')[0];
	 
	 var data = new FormData(form);
	
	 
	/* $.post("${pageContext.request.contextPath}/fileExplorer/AddFile/", {'fileInfo':fileInfo, 'file': file})
	.done(function(data){
		success(data)
	}); */
	
	$.ajax({
		url:'${pageContext.request.contextPath}/fileExplorer/AddFile/',
		type:'POST',
		contentType : false,
		enctype: 'multipart/form-data',
		dataType:'json',
		success:function(data){getFolder(${folders.getId()})},
	    done: function(){getFolder(${folders.getId()})},
	    error: function(error){getFolder(${folders.getId()})},
	    data: data,
	    processData: false
	});
}

function getFolder(id){
	$.ajax({
		url:'${pageContext.request.contextPath}/findFolder/',
		type:'GET',
		contentType : 'application/json; charset=utf-8',
		success:function(data){success(data)},
	    fail: function(response){alert(response)},
	    data: {'id':id}
	});
}
	
function success(data){
	$("#folderContainer").empty();
	$.each(data.folderList, function(index, value){
		$("#folderContainer").append(
				'<div class="col-sm-2">'
						+'<div class="card ">'
							+'<span aria-hidden="true" class="deleteElement" onClick="openDeleteFolderDialog(\'Do you want to delete '+value.name+' folder?\', '+value.id+')">&times;</span>'
							+'<a class="nav-link"'
							+'href="${pageContext.request.contextPath}/fileExplorer?id='+value.id+'">'
								+'<div>'
									+'<img class="align-self-center"'
									+'src="/resources/img/folder.png" alt="'+value.name+'"'
									+'width="72" height="72">'
									+'<div class="card-body">'
										+'<span class="">'+value.name+'</span>'
									+'</div>'
								+'</div>'
							+'</a>'
						+'</div>'
				+'</div>'
				
		);
	});
	$.each(data.fileList, function(index, value){
		$("#folderContainer").append(
				'<div class="col-sm-2">'
						+'<div class="card " style="width: 10rem">'
							+'<span aria-hidden="true" class="deleteElement" onClick="openDeleteFileDialog(\'Do you want to delete '+value.name+' file?\', '+value.id+')">&times;</span>'
							+'</a>'	
							+'<a class="nav-link"'
							+'href="${pageContext.request.contextPath}/downloadFile?id='+value.id+'">'
								+'<div>'
									+'<img class="align-self-center"'
									+'src="/resources/img/file.png" alt=""'
									+'width="72" height="72">'
									+'<div class="card-body">'
										+'<span class="">'+value.name+'</span>'
									+'</div>'
								+'</div>'
							+'</a>'
						+'</div>'
					+'</div>'
		);
	});
	
	$('#newFolder').modal('hide');
	$('#newFile').modal('hide');
}

function openDeleteFolderDialog(message, id){
	$('#deleteFolder').modal('show');
	$("#messageDeleteFolder").text(message);
	$('#buttonDeleteFolder').click(function(){alert("You need to fix this!!!")});
	
}

function openDeleteFileDialog(message, id){
	$('#deleteFile').modal('show');
	$("#messageDeleteFile").text(message);
	$('#buttonDeleteFile').click(function(){deleteFile(id)});
	
}

function deleteFile(id){
	debugger;
	$.ajax({
		url:'${pageContext.request.contextPath}/deleteFile/',
		type:'GET',
		contentType : 'application/json; charset=utf-8',
		success:function(data){if(data != ""){getFolder(${folders.getId()}); alert("The file "+data+" was deleted.");$('#deleteFile').modal('hide');}},
	    fail: function(response){alert(response)},
	    data: {'id':id}
	});
}

function deleteFolder(id){
	debugger;
	$.ajax({
		url:'${pageContext.request.contextPath}/deleteFolder/',
		type:'GET',
		contentType : 'application/json; charset=utf-8',
		success:function(data){if(data != ""){getFolder(${folders.getId()}); alert("The folder "+data+" was deleted.");$('#deleteFile').modal('hide');}},
	    fail: function(response){alert(response)},
	    data: {'id':id}
	});
}
</script>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<%@include file="/WEB-INF/views/sideBar.jsp"%>

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
						<div class="modal-body">
							<label for="name" class="sr-only">Folder name</label> <input
								type="text" id="name" class="form-control"
								placeholder="Folder name" name="Name" required="required" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-dark" onClick="postFolder()">Create</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Pop up, add file -->
			<div class="modal fade" id="newFile" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New file</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="formFile" class="sr-only">File location</label>
							<form method="POST" enctype="multipart/form-data" id="formFile">
								<input multiple="multiple" type="file" name="file" id="file" />
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-dark" onClick="postFile()">Upload</button>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div>
			
			<!-- Pop up, confirm dele folder -->
			<div class="modal fade" id="deleteFolder" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Delete folder</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<span id="messageDeleteFolder">You are deleting </span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-dark" id="buttonDeleteFolder" >Delete</button>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div>


			<!-- Pop up, confirm dele file -->
			<div class="modal fade" id="deleteFile" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Delete file</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<span id="messageDeleteFile">You are deleting </span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-dark" id="buttonDeleteFile" >Delete</button>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
			</div>

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