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
	$(document).ready(function() {
		$("#search").on("keyup", function() {
			var value = $(this).val();
			$("#myTable tr").filter(function() {
				$(this).toggle($(this).text().indexOf(value) > -1)
			});
		});
	});
</script>
<!-- <script>
    $(function () {
        $('#table ${"#edit"}').click(function (e) {
            e.preventDefault();
            $('#id').val($(this).closest('tr').find('td:first').text()); 
            $('#userName').val($(this).closest('tr').find('td:nth-child(2)').text()); 
            $('#passWord').val($(this).closest('tr').find('td:nth-child(3)').text());           
            $('#roless').val($(this).closest('tr').find('td:nth-child(4)').text());
            $('#ticketnumber').val($(this).closest('tr').find('td:nth-child(5)').text());
            $('#quantitycanborrow').val($(this).closest('tr').find('td:nth-child(6)').text());
            $('#canborrow').val($(this).closest('tr').find('td:nth-child(7)').text());
        });
    });
</script> -->
<script>
	$(function() {
		$('#table ${"#edit"}')
				.click(
						function(e) {
							e.preventDefault();
							$('#id').val(
									$(this).closest('tr').find('td:first')
											.text());
							$('#userName').val(
									$(this).closest('tr').find(
											'td:nth-child(2)').text());
							$('#passWord').val(
									$(this).closest('tr').find(
											'td:nth-child(3)').text());
							$('#roless').val(
									$(this).closest('tr').find(
											'td:nth-child(4)').text());
							$('#ticketnumber').val(
									$(this).closest('tr').find(
											'td:nth-child(5)').text());
							$('#quantitycanborrow').val(
									$(this).closest('tr').find(
											'td:nth-child(6)').text());
							$('#canborrow').val(
									$(this).closest('tr').find(
											'td:nth-child(7)').text());
						});
	});
	function myFunction() {
		$("#validation").hide();
		$("#table a").click(function() {
			//    			$("#showtable").hide();
			$("#validation").show();

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
					<!-- Dark Logo icon --> <img
					src="style/assets/images/logo-icon.png" alt="homepage"
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
				<li class="nav-item d-none d-md-block"></li>
				<!-- ============================================================== -->
				<!-- create new -->
				<!-- ============================================================== -->
				<li class="nav-item dropdown">
					
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
				<li class="nav-item dropdown">
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						
					</div></li>
				<!-- ============================================================== -->
				<!-- End Comment -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Messages -->
				<!-- ============================================================== -->
				<li class="nav-item dropdown">
					</li>
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
						class="mdi mdi-border-inside"></i><span class="hide-menu">User
							Ticket</span></a></li>
				<li class="sidebar-item"><a
					class="sidebar-link waves-effect waves-dark sidebar-link"
					href="<c:url value="/reportlibrary" />" aria-expanded="false"
					id="report"><i class="mdi mdi-blur-linear"></i><span
						class="hide-menu">Report</span></a></li>

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
		<input id="role" value="<%=session.getAttribute("role")%>"
							type="hidden" />
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
			<br>
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">Report</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
							
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" ng-app="myApp" ng-controller="myCtrl">

				<p align="right" style="position: relative;">
					<input id="search" type="text" placeholder="Search..">
				</p>
				<p align="left" style="position: absolute;">
				<form action="sortReport" method="post">
					From :<input type="date" id="startDate" required name="startDate"
						value="${startDate}">To : <input type="date" id="endDate"
						required name="endDate" value="${endDate}"> <input
						type="submit" name="Sort" value="Sort">
				</form>
				</p>


				<br>
				<p id="test"></p>
				<br>

				<table id="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>User Name</th>
							<th>Book's Title</th>
							<th>Status</th>
							<th>Date open</th>
							<th>Date close</th>
							<th>User closed</th>
							<th>Price</th>
						</tr>
					<thead>
						<c:forEach var="ticket" items="${listTicket}" varStatus="current">
							<tbody id="myTable">
								<tr>
									<td>${ticket.id}</td>
									<td>${listUser[current.index].userName}</td>
									<td>${listBook[current.index].bookTitle}</td>
									<c:if test="${ticket.status == 1}">
										<td><p>Borrowing</p></td>
									</c:if>
									<c:if test="${ticket.status == 0}">
										<td><p>Returned</p></td>
									</c:if>
									<td id="tableDateOpen">${ticket.dateOpen}</td>

									<td>
										<%-- 									<c:if test="> --%> <%-- 										<td><p>Hom qua</p></td> --%>
										<%-- 									</c:if> --%> ${ticket.dateClose}
									</td>
									<td>${ticket.userNameClosed}</td>
									<td>${ticket.price}</td>
								</tr>
							</tbody>
						</c:forEach>
				</table>
				<br>
				<p align="justify">
				<h1>
					Income: <span id="income"><script>
         var formatter = new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'VND',
            minimumFractionDigits: 2,
         });
      
         document.write(formatter.format(${income}));
      </script></span>
				</h1>
				</p>


			</div>
			<div align="center">
				<button onclick="saveExcel()" class="btn btn-success btn-lg" >Save Report</button>
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
	<script>
		var saveExcel = function(){
		XLSX.utils.html.save_table_as_excel(document.getElementById('table'), {name: 'report.xlsx'});
	}
	
	</script>
	
	<script src="https://cdn.rawgit.com/linways/table-to-excel/master/dist/xlsx_html.full.min.js"></script>
	
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