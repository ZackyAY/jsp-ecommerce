<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>HMNS Perfume</title>
<!-- Referensi lightbox2 CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/css/lightbox.min.css">

<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
}

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

/* Gaya tambahan untuk efek lightbox */
.card-img-top {
	cursor: pointer;
	transition: transform 0.3s ease-in-out;
}

.card-img-top:hover {
	transform: scale(1.1);
}
</style>

<!-- Referensi lightbox2 JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.3/js/lightbox.min.js"></script>

</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<!-- Gambar Utama -->
					<!-- Gambar Utama -->
					<a href="product-image/<%=p.getImage()%>"
						data-lightbox="product-gallery" data-title="<%=p.getName()%>">
						<img class="card-img-top" src="product-image/<%=p.getImage()%>"
						alt="<%=p.getName()%>" data-lightbox="product-gallery"
						style="max-width: 1024px; max-height: 1024px;">
					</a>


					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: $<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add
								to Cart</a> <a class="btn btn-primary"
								href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no products");
			}
			%>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>
