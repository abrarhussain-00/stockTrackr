<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> <%@
taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css"/>
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
        <center><h4>Add a Category</h4></center>
        <!-- <a href="/" class="btn btn-light">Back</a>
        <a href="/logout" class="btn btn-light">Logout</a> -->
        <hr />
        <div class="row justify-content-center">
          <div class="col-5 my-3">
            <form:form
              action="/categories/process"
              method="post"
              modelAttribute="categoryName">
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
                value="Add"
                class="btn btn-outline-success"
              />
            </form:form>
          </div>

          <!-- <div>
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
          </div> -->
        </div>
      </div>
    </center>
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
                  <a href="#"><i class="icon ion-social-facebook"></i></a>
                  <a href="#"><i class="icon ion-social-twitter"></i></a>
                  <a href="#"><i class="icon ion-social-snapchat"></i></a>
                  <a href="#"><i class="icon ion-social-instagram"></i></a>
              </div>
          </div>
      </div>
      <p class="copyright">stockTrackr © 2023</p>
  </div>
  </footer>
  </body>
</html>
