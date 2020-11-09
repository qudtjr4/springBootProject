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
<link rel="stylesheet" href="resources/css/style.css">

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
</head>

<body>
	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<h3>
					<img class="mr-3" src="/resources/img/logo.jpg" alt="" width="72"
						height="72">MOSS
				</h3>
			</div>

			<ul class="list-unstyled components">
				<li class="active"><a href="/">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/editProfile">Profile</a>
				</li>
				<li><a href="#pageSubmenu" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle">Pages</a>
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="#">Page 1</a></li>
						<li><a href="#">Page 2</a></li>
						<li><a href="#">Page 3</a></li>
					</ul></li>
				<li><a href="#">Portfoli</a></li>
				<li><a href="#">Contact</a></li>
				
				
				<% 
				int id = (int)((Map<String, Object>)session.getAttribute("login")).get("id");
				if(id == 0){
					out.print("<li><a href='/admin'>Admin Page</a></li>");
				}
				%>
				
				
			</ul>

			<ul class="list-unstyled CTAs">

				<li><a href="${pageContext.request.contextPath}/login/logout"
					class="article">Log Out</a></li>
			</ul>
		</nav>

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i>
					</button>
					<h2 class="col-10 mt-2">Home</h2>

					<a href="${pageContext.request.contextPath}/addCourse"><i
						type="button" class="fas fa-plus"></i> Add Course</a>

				</div>
			</nav>
			<div class="row">
				<c:if test="${ courses != null }">
					<c:forEach var="course" items="${courses}">
						<div class="col-sm-4 mb-3">
							<div class="card">
								<div class="image">
									<img src="http://loremflickr.com/320/150?random=4" />
								</div>
								<div class="card-inner">
									<div class="header">
										<h2>${course.courseShortName }- ${course.courseName }</h2>
									</div>
									<div class="content">
										<p>Content area</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>

			</div>
			<div class="line"></div>
			<div class="row">
				<div id="calendar-wrap" class="col-8">
					<header>
						<h1 class="text-center">November 2020</h1>
					</header>
					<div id="calendar">
						<ul class="weekdays">
							<li>Sunday</li>
							<li>Monday</li>
							<li>Tuesday</li>
							<li>Wednesday</li>
							<li>Thursday</li>
							<li>Friday</li>
							<li>Saturday</li>
						</ul>

						<!-- Days from previous month -->

						<ul class="days">
							<li class="day other-month">
								<div class="date">27</div>
							</li>
							<li class="day other-month">
								<div class="date">28</div>
							</li>
							<li class="day other-month">
								<div class="date">29</div>
							</li>
							<li class="day other-month">
								<div class="date">30</div>
							</li>
							<li class="day other-month">
								<div class="date">31</div>
							</li>

							<!-- Days in current month -->

							<li class="day">
								<div class="date">1</div>
							</li>
							<li class="day">
								<div class="date">2</div>
								<div class="event">
									<div class="event-desc">Career development @ Community
										College room #402</div>
									<div class="event-time">2:00pm to 5:00pm</div>
								</div>
							</li>
						</ul>

						<!-- Row #2 -->

						<ul class="days">
							<li class="day">
								<div class="date">3</div>
							</li>
							<li class="day">
								<div class="date">4</div>
							</li>
							<li class="day">
								<div class="date">5</div>
							</li>
							<li class="day">
								<div class="date">6</div>
							</li>
							<li class="day">
								<div class="date">7</div>
								<div class="event">
									<div class="event-desc">Group Project meetup</div>
									<div class="event-time">6:00pm to 8:30pm</div>
								</div>
							</li>
							<li class="day">
								<div class="date">8</div>
							</li>
							<li class="day">
								<div class="date">9</div>
							</li>
						</ul>

						<!-- Row #3 -->

						<ul class="days">
							<li class="day">
								<div class="date">10</div>
							</li>
							<li class="day">
								<div class="date">11</div>
							</li>
							<li class="day">
								<div class="date">12</div>
							</li>
							<li class="day">
								<div class="date">13</div>
							</li>
							<li class="day">
								<div class="date">14</div>
								<div class="event">
									<div class="event-desc">Board Meeting</div>
									<div class="event-time">1:00pm to 3:00pm</div>
								</div>
							</li>
							<li class="day">
								<div class="date">15</div>
							</li>
							<li class="day">
								<div class="date">16</div>
							</li>
						</ul>

						<!-- Row #4 -->

						<ul class="days">
							<li class="day">
								<div class="date">17</div>
							</li>
							<li class="day">
								<div class="date">18</div>
							</li>
							<li class="day">
								<div class="date">19</div>
							</li>
							<li class="day">
								<div class="date">20</div>
							</li>
							<li class="day">
								<div class="date">21</div>
							</li>
							<li class="day">
								<div class="date">22</div>
								<div class="event">
									<div class="event-desc">Conference call</div>
									<div class="event-time">9:00am to 12:00pm</div>
								</div>
							</li>
							<li class="day">
								<div class="date">23</div>
							</li>
						</ul>

						<!-- Row #5 -->

						<ul class="days">
							<li class="day">
								<div class="date">24</div>
							</li>
							<li class="day">
								<div class="date">25</div>
								<div class="event">
									<div class="event-desc">Conference Call</div>
									<div class="event-time">1:00pm to 3:00pm</div>
								</div>
							</li>
							<li class="day">
								<div class="date">26</div>
							</li>
							<li class="day">
								<div class="date">27</div>
							</li>
							<li class="day">
								<div class="date">28</div>
							</li>
							<li class="day">
								<div class="date">29</div>
							</li>
							<li class="day">
								<div class="date">30</div>
							</li>
						</ul>

						<!-- Row #6 -->

						<ul class="days">
							<li class="day">
								<div class="date">31</div>
							</li>
							<li class="day other-month">
								<div class="date">1</div> <!-- Next Month -->
							</li>
							<li class="day other-month">
								<div class="date">2</div>
							</li>
							<li class="day other-month">
								<div class="date">3</div>
							</li>
							<li class="day other-month">
								<div class="date">4</div>
							</li>
							<li class="day other-month">
								<div class="date">5</div>
							</li>
							<li class="day other-month">
								<div class="date">6</div>
							</li>
						</ul>

					</div>
					<!-- /. calendar -->
				</div>
				<!-- /. wrap -->

				<div class="col-4 text-center">
					<h1>Announcements</h1>
				</div>
			</div>
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

	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>
</body>

</html>