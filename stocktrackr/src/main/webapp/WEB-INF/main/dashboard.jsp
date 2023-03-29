<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link
href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap"
rel="stylesheet"
/>
<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
/>
<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"
/>
<link rel="stylesheet" href="/css/main.css" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>StockTrackr</title>
</head>
<body style="background-color: gainsboro;">
<nav class="navbar navbar-expand-lg bg-body-tertiary">
<div class="container-fluid">
<img src="/images/logo.png" alt="logo" />
<button
    class="navbar-toggler"
    type="button"
    data-bs-toggle="collapse"
    data-bs-target="#navbarSupportedContent"
    aria-controls="navbarSupportedContent"
    aria-expanded="false"
    aria-label="Toggle navigation"
>
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <span class="">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        <a class="nav-link" href="/logout">Logout</a>
        </li>
    </ul>
    </span>
</div>
</div>
</nav>
<center>
<h1 class="">
Welcome, <c:out value="${loggedInUser.userName}"></c:out>
</h1>
</center>
<hr />

<div class="container">
<div class="d-flex justify-content-center text-center gap-5">
<div>
    <b><p>View and manage categories</p></b>
    <a href="/categories/create" class="btn btn-success">Categories</a>
    <!-- ------------------------- -->
    <h4 class="mt-4">All Categories</h4>
    <table class="table table-striped w-auto">
        <tbody>
        <c:forEach items="${allCategories}" var="category">
            <c:if test="${category.user.id == loggedInUser.id}">
            <tr>
                <td>${category.name}</td>
                <td>
                <form action="/categories/${category.id}" method="post">
                    <input type="hidden" name="_method" value="delete" />
                    <input
                    type="submit"
                    value="Delete"
                    class="btn btn-outline-danger btn-sm"
                    />
                </form>
                </td>
            </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>

</div>
<div class="d-flex text-center">
    <div class="">
    <b><p>View and manage products</p></b>
    <a href="/products" class="btn btn-success">Products</a>
    <!-- table displaying all products, or searched products -->
    <table class="table table-striped my-3 w-auto">
        <thead>
        <tr>
            <!-- <th>ID</th> -->
            <th>Name</th>
            <!-- <th>Price</th>
            <th>Quantity</th>
            <th>Description</th> -->
            <th>Category</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${allProducts}" var="product">
            <c:if test="${product.user.id == loggedInUser.id}">
            <tr>
                <!-- <td>${product.id}</td> -->
                <td>${product.name}</td>
                <!-- <td>$${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.description}</td> -->
                <td>
                <c:forEach
                    items="${product.categories}"
                    var="eachCategory"
                    >${eachCategory.name}</c:forEach
                >
                </td>
                <td class="d-flex gap-2">
                <a
                    href="/products/${product.id}/edit"
                    class="btn btn-outline-primary btn-sm"
                    >Edit</a
                >
                <form action="/products/${product.id}" method="post">
                    <input type="hidden" name="_method" value="delete" />
                    <input
                    type="submit"
                    value="Delete"
                    class="btn btn-outline-danger btn-sm"
                    />
                </form>
                </td>
            </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    </div>
</div>
</div>
</div>

<!-- ============================Potential Bottom NavBar============================ -->
<div class="footer-dark fixed-bottom">
<footer>
<div class="container">
    <div class="row">
    <div class="col-sm-6 col-md-3 item">
        <h3>About</h3>
        <ul>
        <li><a href="#">Learn More</a></li>
        <li><a href="#">FAQ</a></li>
        </ul>
    </div>
    <div class="col-sm-6 col-md-3 item">
        <h3>Meet the Developers</h3>
        <ul>
        <li><a href="www.abrarbiz.net">Abrar Hussain</a></li>
        <li><a href="/">Jessica Petrey</a></li>
        </ul>
    </div>
    <div class="col-md-6 item text">
        <div class="col item social">
        <a href="#"><i class="icon ion-social-facebook"></i></a
        ><a href="#"><i class="icon ion-social-twitter"></i></a
        ><a href="#"><i class="icon ion-social-snapchat"></i></a
        ><a href="#"><i class="icon ion-social-instagram"></i></a>
        </div>
    </div>
    </div>
    <p class="copyright">stockTrackr © 2023</p>
</div>
</footer>
</div>
</body>
</html>
