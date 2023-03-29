<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
        <center><h1>Categories</h1></center>
        <a href="/" class="btn btn-light">Back</a>
        <a href="/logout" class="btn btn-light">Logout</a>
        <hr />
        <div class="row justify-content-center">
          <div class="col-5 my-3">
            <form:form
              action="/categories/process"
              method="post"
              modelAttribute="categoryName"
            >
              <form:input type="hidden" path="user" value="${user_id}" />
              <div class="form-group">
                <!-- <label>Category</label> -->
                <form:input
                  path="name"
                  class="form-control"
                  type="text"
                  placeholder="Enter category"
                />
                <form:errors path="name" class="text-danger" />
              </div>
              <input
                type="submit"
                value="Add New Category"
                class="btn btn-outline-success mt-3"
              />
            </form:form>
          </div>

          <div>
            <h4 class="mt-4">All Categories</h4>
            <div class="col-5 scrollBar">
              <table class="table table-striped w-auto">
                <tbody>
                  <c:forEach items="${allCategories}" var="category">
                    <c:if test="${category.user.id == user.id}">
                      <tr>
                        <td>${category.name}</td>
                        <td>
                          <form
                            action="/categories/${category.id}"
                            method="post"
                          >
                            <input
                              type="hidden"
                              name="_method"
                              value="delete"
                            />
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
    </center>
  </body>
</html>
