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
		$("#showtable #editbook").click(function() {
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
				
				<!-- ============================================================== -->
				<!-- Search -->
				<!-- ============================================================== -->
				
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
						class="mdi mdi-border-inside"></i><span class="hide-menu">User Ticket</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/reportlibrary" />" aria-expanded="false" id="report"><i
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
			<div class="page-breadcrumb">
			<br>
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">Book Management</h4>

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
				<input id="role" value="<%=session.getAttribute("role")%>"
							type="hidden" />
				<div id="showtable">
					<p align="right">
						<input type="text" id="search" placeholder="Search.." />
					</p>
					<table class="table" id="table">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Book's Title</th>
								<th scope="col">Author</th>
								<th scope="col">Category</th>
								<th scope="col">ISBN</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Remain</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach items="${listbook}" var="item">
								<tr>
									<td>${item.bookID}</td>
									<td>${item.bookTitle}</td>
									<td>${item.author}</td>
									<td>${item.category}</td>
									<td>${item.isbnNumber}</td>
									<td>${item.price}</td>
									<td>${item.quantity}</td>									
									<td>${item.remain}</td>
									<%-- <td><a href="<c:url value='/updateBook${item.bookID}'></c:url>" id="edit">Update</a>&nbsp/&nbsp<a href="<c:url value='/deleteBook${item.bookID}'></c:url>">Delete</a></td> --%>
									<td><a href="#" id="editbook">Edit</a>&nbsp/&nbsp<a
										href="<c:url value='/deleteBook${item.bookID}'></c:url>">Delete</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<div align="center">
					<br /> <br />
					<form:form action="addBook" method="POST" modelAttribute="addBook"
						id="formAddBook">
						<table class="table">
							<form:hidden path="bookID" />
							<tr>
								<td>Title :</td>
								<td><form:input path="bookTitle" size="130dp" required="required"/></td>
							</tr>
							<tr>
								<td>Author</td>
								<td><form:input path="author" size="130dp" required="required" /></td>
							</tr>
							<tr>
								<td>Category</td>
								<td><form:input path="category" size="130dp" required="required"/></td>
							</tr>
							<tr>
								<td>ISBN</td>
								<td><form:input path="isbnNumber" size="130dp" required="required" pattern=".{13}" title="Either 13 chars" maxlength="13"/></td>
							</tr>
							<tr>
								<td>Price</td>
								<td><form:input path="price" size="130dp" required="required" type="number"/></td>
							</tr>
							<tr>
								<td>Quantity</td>
								<td><form:input path="quantity" size="130dp" id ="quantity" required="required" type="number"/></td>
							</tr>
							<tr>								
								<form:input path="remain" value="10" size="130dp" id="remain" type="hidden"/>
								<script>
								$('#quantity').keyup(function() {
									var quantity = $('#quantity').val();
									$("#remain").val(quantity);
									});
								</script>
							</tr>
							<tr>
								<td>Image</td>
								<td><form:input path="imageBook" size="130dp" type="url" required="required"/></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Add" size="40dp"><input
									type="reset" value="Reset" size="40dp"></td>
							</tr>
						</table>
					</form:form>

				</div>
				<center>
					<button type="submit" class="btn btn-success btn-lg"
						id="addBookForm">Add Book</button>
				</center>
				<form:form id="validation" action="updatebook" method="POST">
					<table class="table">
						<tr>
							<td>ID:</td>
							<td><input type="text" id="id" name="id" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Title:</td>
							<td><input type="text" id="updatetitle" name="updatetitle"
								size="130dp" required /></td>
						</tr>
						<td>Author:</td>
						<td><input type="text" id="updateauthor" name="updateauthor"
							size="130dp" required /></td>
						</tr>
						<tr>
							<td>Category:</td>
							<td><input type="text" id="updatecategory"
								name="updatecategory" size="130dp" required /></td>
						</tr>
						<tr>
							<td>ISBN:</td>
							<td><input type="text" id="updateisbn" name="updateisbn"
								size="130dp" required/></td>
						</tr>
						<tr>
							<td>Price:</td>
							<td><input type="number" id="updateprice" name="updateprice"
								size="130dp" required /></td>
						</tr>
						<tr>
							<td>Add more:</td>
							<td><input type="number" id="updatequantity"
								name="updatequantity" size="130dp" required/></td>
						</tr>						
						<tr>
							<td></td>
							<td><center><input class="btn btn-success btn-lg" id="result"
								type="submit" value="Update" /></center></td>
						</tr>
					</table>
				</form:form>
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