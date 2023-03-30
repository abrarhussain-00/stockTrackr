<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap"
        rel="stylesheet">
        <script src="https://kit.fontawesome.com/5492dab26b.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="/css/main.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StockTrackr</title>
</head>
<body>
<center>
    <div class="container my-5">
        <center><h1 class="">Edit a Product</h1></center>
        <a href="/logout" class="btn btn-light">Logout</a>
        <a href="/" class="btn btn-light">Back to Home</a>
        <hr />
        
        <div class="col-5 my-3">
            <form:form action="/process/${id}/edit"  method="post" modelAttribute="productName">
                <input type="hidden" name="_method" value="put"/>
                <form:hidden path="user"/>
                <input type= "hidden" name= "_method" value="put"/>
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
                    <label>Category</label>
                    <form:select path="categories" class="form-select">
                        <c:forEach items="${user.categories}" var="eachCategory">
                            <form:option value="${eachCategory.id}" >
                                <c:out value="${eachCategory.name}"/>
                            </form:option>
                        </c:forEach>
                    </form:select>
                </div>
                
                    <a href="/products" class="btn btn-outline-primary btn-sm mt-3">Cancel</a>
                    <input type="submit" value="Edit" class="btn btn-outline-success btn-sm mt-3"/>
                </div>
            </form:form>
        </div>
    </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</body>
</html>