<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
        <script src="https://kit.fontawesome.com/5492dab26b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/css/main.css" />
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>StockTrackr</title>
        </head>
<body>
            <!-- ============================Main Header============================ -->
		<nav class="navbar na navbar-expand-md bg-body-tertiary navbar-dark bg-dark">
			<div class="container-fluid">
				<img src="/images/logo.png" alt="logo" />
                <div class="collapse navbar-collapse" id="navlinks">
                    <ul class="navbar-nav align-items-start">
                        <li class="nav-item">
                            <a class="nav-link active" href="/">Home</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav align-items-start">
                        <li class="nav-item">
                            <a class="nav-link active" href="/categories/create">Add Category</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav align-items-start">
                        <li class="nav-item">
                            <a class="nav-link active" href="/products/create">Add Product</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav align-items-start">
                        <li class="nav-item">
                            <a class="nav-link active" href="/products">View all Products</a>
                        </li>
                    </ul>
                </div>
				<span>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navlinks"
						aria-controls="navlinks" aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa-solid fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navlinks">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-end">
							<li class="nav-item">
								<!-- <a class="nav-link active" href="/logout">Logout</a> -->
							</li>
						</ul>
        </div>
				</span>
			</div>
			</div>
		</nav>


    <center>
    <div class="container my-5">
        <center><h4 class="">Add a Product</h4></center>
        <!-- <a href="/" class="btn btn-light">Back</a>
        <a href="/logout" class="btn btn-light">Logout</a> -->
        <hr />
        
        <div class="col-5 my-3">
            <form:form action="/products/process"  method="post" modelAttribute="productName">
                <form:input type="hidden" path="user" value="${user_id}"/>
                <div class="form-group">
                    <!-- <label>Name</label> -->
                        <form:input path="name" class="form-control" type="text" placeholder="Enter product name"/>
                        <form:errors path="name" class="text-danger"/>			
                </div>
            
                <div class="form-group">
                    <!-- <label>Quantity</label> -->
                        <form:input path="quantity" class="form-control mt-3" type="number" placeholder="Quantity amount"/>
                        <form:errors path="quantity" class="text-danger"/>			
                </div>
            
                <div class="form-group">
                    <!-- <label>Price</label> -->
                        <form:input path="price" class="form-control mt-3" type="number" placeholder="Price"/>
                        <form:errors path="price" class="text-danger"/>			
                </div>

                <div class="form-group">
                    <!-- <label>Description</label> -->
                        <form:input path="description" class="form-control mt-3" type="text" placeholder="Brief description"/>
                        <form:errors path="description" class="text-danger"/>			
                </div>
            
                <div class="form-group">
                    <label class="scrollCategory">Category</label>
                    <form:select path="categories" class="form-select">
                        <c:forEach items="${allCategories}" var="eachCategory">
                            <c:if test="${eachCategory.user.id == user.id}">
                                <form:option value="${eachCategory.id}"><c:out value="${eachCategory.name}"/></form:option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </div>
                <input type="submit" value="Add" class="btn btn-outline-success"/>
            </form:form>
        </div>
    </div>
    </center>

        <!-- ============================Potential Bottom NavBar============================ -->
<div>
    <footer class="footer-dark mt-5">
        <div class="container">
            <div class="row">
                <div class="col-sm-3 item">
                    <h3>About</h3>
                    <ul>
                        <li><a href="#">Learn More</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 item">
                    <h3>Meet the Developers</h3>
                    <ul>
                        <li><a href="www.abrarbiz.net">Abrar Hussain</a></li>
                        <li><a href="">Jessica Petrey</a></li>
                    </ul>
                </div>
                <div class="col-sm-5 item">
                    <div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a
                            href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i
                                class="icon ion-social-snapchat"></i></a><a href="#"><i
                                class="icon ion-social-instagram"></i></a></div>
                </div>
            </div>
            <p class="copyright">stockTrackr © 2023</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</body>
</html>