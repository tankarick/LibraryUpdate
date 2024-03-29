<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="style/assets/images/favicon.png">
<title>Admin library</title>
<!-- Custom CSS -->
<link href="style/assets/libs/flot/css/float-chart.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="style/dist/css/style.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.js"></script>
<script>
	
	$(function() {	
		$('#table ${"#editbook"}')
				.click(
						function(e) {
							e.preventDefault();
							$('#id').val(
									$(this).closest('tr').find('td:first')
											.text());
							$('#updatetitle').val(
									$(this).closest('tr').find(
											'td:nth-child(2)').text());
							$('#updateauthor').val(
									$(this).closest('tr').find(
											'td:nth-child(3)').text());
							$('#updatecategory').val(
									$(this).closest('tr').find(
											'td:nth-child(4)').text());
							$('#updateisbn').val(
									$(this).closest('tr').find(
											'td:nth-child(5)').text());
							$('#updateprice').val(
									$(this).closest('tr').find(
											'td:nth-child(6)').text());
							$('#updatequantity').val(
									$(this).closest('tr').find(
											'td:nth-child(7)').text());
							$('#updateremain').val(
									$(this).closest('tr').find(
											'td:nth-child(8)').text());
						});
	});
</script>
<script>
	$(document).ready(function() {
		$("#search").on("keyup", function() {
			var value = $(this).val();
			$("#myTable tr").filter(function() {
				$(this).toggle($(this).text().indexOf(value) > -1)
			});
		});
	});
</script>
<script>
	function myFunction() {
		$("#validation").hide();
		$("#showtable a").click(function() {
			// 			$("#showtable").hide();
			$("#validation").show();
			$("#formAddBook").hide();
		});
		$("#formAddBook").hide();
		$("#addBookForm").click(function() {
			$("#formAddBook").slideToggle();
			$("#validation").hide();
			// 			$("#showtable").hide();
		});
		var role = document.getElementById("role").value;
		if (role == 'admin') {
		} else if (role == 'management') {
			$('#usermanagement').hide();
		} else {
			$('#usermanagement').hide();
			$('#bookmanagement').hide();
			$('#ticketmanagement').hide();
			$('#report').hide();
		}
	}
</script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body onload="myFunction()">
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin5"> <nav
			class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" data-logobg="skin5">
			<!-- This is for the sidebar toggle which is visible on mobile only -->
			<a class="nav-toggler waves-effect waves-light d-block d-md-none"
				href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<a class="navbar-brand" href="<c:url value="/admin" />"> <!-- Logo icon -->
				<b class="logo-icon p-l-10"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> <img width="50dp" height="50dp"
					src="style/book.png" alt="homepage"
					class="light-logo" />

			</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
					<!-- dark Logo text --> <img
					src="style/dashboard.PNG" alt="homepage"
					class="light-logo" height="28px" width="152px" />

			</span> <!-- Logo icon --> <!-- <b class="logo-icon"> --> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
				<!-- Dark Logo icon --> <!-- <img src="style/assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->

				<!-- </b> --> <!--End Logo icon -->
			</a>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Toggle which is visible on mobile only -->
			<!-- ============================================================== -->
			<a class="topbartoggler d-block d-md-none waves-effect waves-light"
				href="javascript:void(0)" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation"><i class="ti-more"></i></a>
		</div>
		<!-- ============================================================== -->
		<!-- End Logo --> <!-- ============================================================== -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent"
			data-navbarbg="skin5">
			<!-- ============================================================== -->
			<!-- toggle and nav items -->
			<!-- ============================================================== -->
			<ul class="navbar-nav float-left mr-auto">

			</ul>
			<!-- ============================================================== -->
			<!-- Right side toggle and nav items -->
			<!-- ============================================================== -->
			<ul class="navbar-nav float-right">
				<!-- ============================================================== -->
				<!-- Comment -->
				<!-- ============================================================== -->

				<!-- ============================================================== -->
				<!-- End Comment -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Messages -->
				<!-- ============================================================== -->

				<!-- ============================================================== -->
				<!-- End Messages -->
				<!-- ============================================================== -->

				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->

				<li class="nav-item dropdown"><br> <a
					class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
					href="" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><img
						src="style/assets/images/users/1.jpg" alt="user"
						class="rounded-circle" width="31"></a>
					<div class="dropdown-menu dropdown-menu-right user-dd animated">
						<a class="dropdown-item" href="javascript:void(0)"><i
							class="ti-user m-r-5 m-l-5"></i> <%
 							if (session.getAttribute("username") != null) {
 								%> <strong><%=session.getAttribute("username")%></strong> <%
 							} %></a>
						<div class="dropdown-divider"></div>
						
						<div class="dropdown-divider"></div>
						<input id="role" value="<%=session.getAttribute("role")%>"
							type="hidden" /> <a class="dropdown-item"
							href="<c:url value="/logout" />"><i
							class="fa fa-power-off m-r-5 m-l-5"></i> Logout </a>
						<div class="dropdown-divider"></div>
						<div class="p-l-30 p-10">
							<a href="javascript:void(0)"
								class="btn btn-sm btn-success btn-rounded" data-toggle="modal" data-target="#exampleModal">View Profile</a>
						</div>
					</div></li>
				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->
			</ul>
		</div>
		</nav> </header>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5"> <!-- Sidebar scroll-->
		<div class="scroll-sidebar">
			<!-- Sidebar navigation-->
			<nav class="sidebar-nav">
			<ul id="sidebarnav" class="p-t-30">
				<li class="sidebar-item" id="usermanagement"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/usermanagement" />" aria-expanded="false"><i
						class="mdi mdi-view-dashboard"></i><span class="hide-menu">User
							Management</span></a></li>

				<li class="sidebar-item" id="bookmanagement"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/bookmanagement" />" aria-expanded="false"><i
						class="mdi mdi-chart-bar"></i><span class="hide-menu">Book
							Management</span></a></li>
				<li class="sidebar-item" id="ticketmanagement"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/ticketmanagement" />" aria-expanded="false"><i
						class="mdi mdi-chart-bubble"></i><span class="hide-menu">Ticket
							Management</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/userticket" />" aria-expanded="false"><i
						class="mdi mdi-border-inside"></i><span class="hide-menu">User
							Ticket</span></a></li>
				<li class="sidebar-item" id="report"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/reportlibrary" />" aria-expanded="false"><i
						class="mdi mdi-blur-linear"></i><span class="hide-menu">Report</span></a></li>
			</ul>
			</nav>
			<!-- End Sidebar navigation -->
		</div>
		<!-- End Sidebar scroll--> </aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<br>
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">All books in Library</h4>

					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title" id="exampleModalLabel">User Information</h1>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table align="center">
									
									<tr>
										<td>UserName: </td> <td>${user.userName}</td>
									</tr>
									<tr>
										<td>FullName: </td> <td>${user.fullName}</td>
									</tr>
									<tr>
										<td>Email: </td> <td>${user.email}</td>
									</tr>
									<tr>
										<td>Quantity of book can borrow: </td> <td>${user.quantityOfBookCanBorrow}</td>
									</tr>
									<tr>
										<td>Role: </td> <td>${user.role}</td>
									</tr>
								</table>
							
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>



				<div id="showtable">
					<p align="right">
						<input type="text" id="search" placeholder="Search.." />
					</p>
					<table class="table table-bordered" id="table">
						<tbody id="myTable">
							<c:forEach items="${listbook}" var="item">
								<center>
									<tr>
										<%-- <td>${item.imageBook}</td> --%>
										<td><center>
												<img src="${item.imageBook}" width="200dp" height="150dp" />
											</center></td>
										<td><center>
												<h2 style="color: blue">${item.bookTitle}</h2>
												<h4 style="color: black; font-style: italic">${item.author}</h4>
												<span style="color: red">Price: ${item.price}</span><br>${item.category}<br>
												<span id="bookRemain">Remain: ${item.remain}</span><br>

											</center></td>
										<td><br>
										<br>
										<center>
												<c:if test="${item.remain > 0}">

													<c:if test="${limitBorrowBook == 0} ">
														<p class="btn btn-success btn-lg">Out of limit</p>
													</c:if>
													<c:if test="${limitBorrowBook > 0}">
														<a id="buttonBorrow"
															href="<c:url value='/openTicket${item.bookID}/${item.price}'></c:url>"
															id="openTicket" class="btn btn-success btn-lg">Borrow</a>
													</c:if>

												</c:if>
												<c:if test="${item.remain <= 0}">
													<p class="btn btn-success btn-lg">Out of book</p>
												</c:if>
											</center></td>

									</tr>
								</center>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<!-- ============================================================== -->
				<!-- End Container fluid  -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- footer -->
				<!-- ============================================================== -->
				<footer class="footer text-center"></footer>
				<!-- ============================================================== -->
				<!-- End footer -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Page wrapper  -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Wrapper -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- All Jquery -->
		<!-- ============================================================== -->
		<script src="style/assets/libs/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap tether Core JavaScript -->
		<script src="style/assets/libs/popper.js/dist/umd/popper.min.js"></script>
		<script src="style/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
		<script
			src="style/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
		<script src="style/assets/extra-libs/sparkline/sparkline.js"></script>
		<!--Wave Effects -->
		<script src="style/dist/js/waves.js"></script>
		<!--Menu sidebar -->
		<script src="style/dist/js/sidebarmenu.js"></script>
		<!--Custom JavaScript -->
		<script src="style/dist/js/custom.min.js"></script>
		<!--This page JavaScript -->
		<!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
		<!-- Charts js Files -->
		<script src="style/assets/libs/flot/excanvas.js"></script>
		<script src="style/assets/libs/flot/jquery.flot.js"></script>
		<script src="style/assets/libs/flot/jquery.flot.pie.js"></script>
		<script src="style/assets/libs/flot/jquery.flot.time.js"></script>
		<script src="style/assets/libs/flot/jquery.flot.stack.js"></script>
		<script src="style/assets/libs/flot/jquery.flot.crosshair.js"></script>
		<script
			src="style/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
		<script src="style/dist/js/pages/chart/chart-page-init.js"></script>
</body>
</html>