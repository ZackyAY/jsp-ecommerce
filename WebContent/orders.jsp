<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OrderDao"%>
<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
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
<title>HMNS Orders</title>
<style>
.navbar {
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
	color: #007bff;
}

.navbar-toggler {
	border: none;
}

.navbar-toggler-icon {
	background-color: #007bff;
}

.navbar-nav {
	margin-left: auto;
}

.nav-item {
	margin-right: 10px;
}

.nav-link {
	font-size: 1rem;
	color: #007bff;
	transition: color 0.3s;
}

.nav-link:hover {
	color: #0056b3;
}

.badge-danger {
	background-color: #dc3545;
}
</style>

</head>
<body>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>

				<%
			if(orders != null){
				for(Order o:orders){%>
				<tr>
					<td><%=o.getDate() %></td>
					<td><%=o.getName() %></td>
					<td><%=o.getCategory() %></td>
					<td><%=o.getQunatity() %></td>
					<td><%=dcf.format(o.getPrice()) %></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
				</tr>
				<%}
			}
			%>

			</tbody>
		</table>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>