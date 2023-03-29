<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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
    <div class="container my-5">
      <!-- header, logout and back buttons -->
      <div class="text-center">
        <h1>Products</h1>
        <a href="/" class="btn btn-light">Back</a>
        <a href="/logout" class="btn btn-light">Logout</a>
      </div>
      <hr />
      <!-- navigation buttons -->
      <div class="text-center">
        <a href="/products/create" class="btn btn-outline-success">Add New Product</a>
      </div>
      <!-- search bar -->
      <div></div>
      <center>
        <!-- table displaying all products, or searched products -->
        <table class="table table-striped my-3 w-auto">
          <thead>
            <tr>
              <!-- <th>ID</th> -->
              <th>Name</th>
              <th>Price</th>
              <th>Quantity</th>
              <th>Description</th>
              <th>Category</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${allProducts}" var="product">
              <c:if test="${product.user.id == user.id}">
                <tr>
                  <!-- <td>${product.id}</td> -->
                  <td>${product.name}</td>
                  <td>$${product.price}</td>
                  <td>${product.quantity}</td>
                  <td>${product.description}</td>
                  <td>
                    <c:forEach items="${product.categories}" var="eachCategory"
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
      </center>
    </div>
  </body>
</html>
