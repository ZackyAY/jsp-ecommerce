<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>HMNS Login</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
}

.navbar {
	background-color: #ffffff; /* Putih bersih */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
	color: #007bff; /* Biru cerah */
}

.navbar-toggler {
	border: none;
}

.navbar-toggler-icon {
	background-color: #007bff; /* Biru cerah */
}

.navbar-nav {
	margin-left: auto;
}

.nav-item {
	margin-right: 10px;
}

.nav-link {
	font-size: 1rem;
	color: #007bff; /* Biru cerah */
	transition: color 0.3s;
}

.nav-link:hover {
	color: #0056b3; /* Biru lebih gelap */
}

.badge-danger {
	background-color: #dc3545;
}

.card {
	width: 400px;
	margin: auto;
	margin-top: 50px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #007bff; /* Biru cerah */
	color: #fff;
	font-size: 1.5rem;
	font-weight: bold;
}

.card-body {
	padding: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.btn-primary {
	background-color: #007bff; /* Biru cerah */
	border-color: #007bff; /* Biru cerah */
	padding: 10px 20px;
}

.btn-primary:hover {
	background-color: #0056b3; /* Biru lebih gelap */
	border-color: #0056b3; /* Biru lebih gelap */
}
</style>

</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> <input type="email"
							name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							name="login-password" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>
