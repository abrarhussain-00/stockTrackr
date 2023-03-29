<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link 
    href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap"
    rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/main.css" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>StockTrackr</title>
</head>
<body>
    <center>
    <div class="container my-5">
        <center><h1 class="">Add a Product</h1></center>
        <a href="/" class="btn btn-light">Back</a>
        <a href="/logout" class="btn btn-light">Logout</a>
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
                    <label>Category</label>
                    <form:select path="categories" class="form-select">
                        <c:forEach items="${allCategories}" var="eachCategory">
                            <c:if test="${eachCategory.user.id == user.id}">
                                <form:option value="${eachCategory.id}"><c:out value="${eachCategory.name}"/></form:option>
                            </c:if>
                        </c:forEach>
                    </form:select>
                </div>
                <input type="submit" value="Add" class="btn btn-outline-success mt-3"/>
            </form:form>
        </div>
    </div>
    </center>
</body>
</html>