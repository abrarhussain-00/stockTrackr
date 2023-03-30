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
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <script src="https://kit.fontawesome.com/5492dab26b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="/css/main.css">
        <!-- ============================Application Info============================ -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StockTrackr</title>
    </head>
    <html>

    <body>
        <!-- ============================Navbar============================ -->
        <nav class="navbar navbar-expand-md bg-body-tertiary navbar-dark bg-dark">
            <div class="container-fluid">
                <img src="/images/logo.png" alt="logo" />
                <span>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navlinks"
                        aria-controls="navlinks" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa-solid fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navlinks">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 align-items-end">
                            <li class="nav-item">
                                <a class="nav-link active" href="/login">Login</a>
                            </li>
                        </ul>
                </span>
            </div>
            </div>
        </nav>
        <!-- body AND footer -->
        <div>
            <!-- ============================Header============================ -->
            <div class="text-center my-5 wrapper">
                <h1 class="loginRegHeader">Welcome to stockTrackr Web</h1>
                <h3>Manage your inventory anywhere, anytime.</h3>
            </div>
            <!-- ============================Body============================ -->
            <div class="container my-5">
                <div class="d-flex justify-content-center text-center gap-5">
                    <div class="col-5 descriptionBox">
                        <h5>What is StockTrackr?</h5>
                        <br/>
                        <p>
                            A free inventory app helping small businesses track their inventory in real-time, leading to better 
                            customer service, improved accuracy, and cost savings. It is a useful investment for businesses 
                            looking to optimize their inventory management process and increase efficiency.
                        </p>
                    </div>
                    <div class="vl"></div>
                    <div class="col-5 align-items-center">
                        <h2 class="loginRegHeader mb-4">Register</h2>
                        <!-- =========== FORM =============Username Input============================-->
                        <form:form action="/process/register" method="post" modelAttribute="newUser">
                            <div class="form-group">
                                <form:input path="userName" type="text" class="form-control" placeholder="Username" />
                                <form:errors path="userName" class="text-danger" />
                            </div>
                            <!-- ============================Email Input============================-->
                            <div class="form-group ">
                                <form:input path="email" type="email" class="form-control" placeholder="Email" />
                                <form:errors path="email" class="text-danger" />
                            </div>
                            <!-- ============================Password Input============================ -->
                            <div class="form-group">
                                <form:input path="password" type="password" class="form-control" placeholder="Password" />
                                <form:errors path="password" class="text-danger" />
                            </div>
                            <!-- ============================Confirm Password Input============================ -->
                            <div class="form-group">
                                <form:input path="confirm" type="password" class="form-control"
                                    placeholder="Confirm Password" />
                                <form:errors path="confirm" class="text-danger" />
                            </div>
                            <!--============================Submit============================-->
                            <div class=" d-flex justify-content-start">
                                <input type="submit" value="Submit" class="btn btn-success btn-sm" />
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- ============================ Footer ============================ -->
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
            crossorigin="anonymous"></script>
    </body>

    </html>