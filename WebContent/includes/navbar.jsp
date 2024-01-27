<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #f8f9fa;">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"
			style="color: #343a40; font-weight: bold;">HMNS Perfume</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp"
					style="color: #343a40;">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp"
					style="color: #343a40;">Cart <span class="badge badge-danger">${cart_list.size()}</span></a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp"
					style="color: #343a40;">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out"
					style="color: #343a40;">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp"
					style="color: #343a40;">Login</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>
