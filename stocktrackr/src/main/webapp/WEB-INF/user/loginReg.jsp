<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- ============================Bootstrap============================ -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <!-- ============================Google Fonts API============================ -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Coming+Soon&family=Indie+Flower&family=Roboto&family=Shadows+Into+Light&display=swap"
		rel="stylesheet">
	<!-- ============================CSS File============================ -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="/css/main.css">
    <!-- ============================Application Info============================ -->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>stockTrackr</title>
</head>
<html>
	<body class="" >
	<!-- ============================Main Header============================ -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<img src="/images/logo.png" alt="logo" />
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<span class="">

				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="/register">Register</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/login">Login</a>
					</li>
				</ul>
			</span>
		  </div>
		</div>
	  </nav>
		<div class="d-flex flex-column">
			<div class="text-center">
				<div class="d-flex justify-content-center"></div>
				<h1 class="loginRegHeader">Welcome to stockTrackr Web</h1>
				<h3>Manage your inventory anywhere, anytime.</h3>
			</div>
	<!-- ============================Body============================ -->
			<div class="row justify-content-center gap-5 mt-5">
				<div class="col-2">
					<div>
						<h2 class="loginRegHeader">Login</h2>
						<hr>
				<!--============================Email Input============================-->
						<form:form action="/process/login" method="post" modelAttribute="loginUser">
							<div class="form-group">
								<!-- <label style="color: whitesmoke;">Email</label> -->
								<form:input path="email" type="email" class="form-control mt-3" placeholder="Email"/>
								<form:errors path="email" class="text-danger" />
							</div>
				<!--============================Password Input============================ -->
							<div class="form-group">
								<!-- <label style="color: whitesmoke;">Password</label> -->
								<form:input path="password" type="password" class="form-control mt-3" placeholder="Password"/>
								<form:errors path="password" class="text-danger" />
							</div>
				<!--============================Submit============================-->
							<div class="d-flex justify-content-between align-items-center">
								<a href="/register" class="btn btn-primary btn-sm">Register now</a>
								<input type="submit" value="Submit" class="btn btn-success btn-sm my-1" />
							</div>
						</form:form>
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
                                <li><a href="">Jessica Petrey</a></li>
                            </ul>
                        </div>
						<div class="col-md-6 item text">
							<div class="col item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a></div>
						</div>
                    </div>
                    <p class="copyright">stockTrackr © 2023</p>
                </div>
            </footer>
        </div>
	</body>
</html>