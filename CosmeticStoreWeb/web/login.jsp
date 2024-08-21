

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/logincss.css">
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
            <div class="container">    
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent1"
                    aria-controls="navbarSupportedContent1"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent1">      
                    <a class="navbar-brand mt-2 mt-sm-0 " href="#">
                        <img
                            src="images/logo2.png"
                            height="50"
                            alt="Brand Logo"
                            />
                    </a>

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link " href="#">HOME</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">ABOUT US</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">PRODUCT CORNER</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">SHIPPING INFORMATION</a>
                        </li>
                    </ul>     
                </div>

                <div class="d-flex align-items-center">

                    <div style="width: 10px;"></div>

                </div>

            </div>
        </nav>


        <section class="vh-100" style="background-color: #e0798b;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                                         alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">



                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                            <span class="h1 fw-bold mb-0">Welcome</span>
                                        </div>

                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                        <form action="MainController" method="POST">

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" name="userID" class="form-control form-control-lg" />
                                                <label class="form-label" for="form2Example17">User Name</label>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="password" name="password" class="form-control form-control-lg" />
                                                <label class="form-label" for="form2Example27">Password</label>
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <input type="submit" name="action" value="Login" class="btn btn-dark btn-lg btn-block">
                                            </div>
                                        </form>
                                        <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="MainController?action=Create_Page" style="color: #393f81;">Register here</a></br>
                                            <a href="MainController?action=Shopping" style="color: #393f81;">Login later</a>
                                            <br>${requestScope.ERROR}</p>


                                        <a href="#!" class="small text-muted">Terms of use.</a>
                                        <a href="#!" class="small text-muted">Privacy policy</a>
                                        <a href="MainController?action=Top1User"></a>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="footer bg-dark text-white mt-5" style="margin-top: 0px ">
            <div class="container py-4">
                <div class="row">
                    <div class="col-md-3">
                        <h5>Follow Us</h5>
                        <ul class="list-unstyled">
                            <li><i class="fab fa-facebook"></i> Facebook</li>
                            <li><i class="fab fa-twitter"></i> Twitter</li>
                            <li><i class="fab fa-instagram"></i> Instagram</li>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <h5>Help & Info</h5>
                        <ul class="list-unstyled">
                            <li>Contact Us</li>
                            <li>FAQs</li>
                            <li>Returns & Refunds</li>
                            <li>Delivery Information</li>
                            <li>Student, 16-26 Year Old & Apprentice Discount</li>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <h5>Company Info</h5>
                        <ul class="list-unstyled">
                            <li>Terms of Service</li>
                            <li>Privacy Policy</li>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <h5>About TheBeautyStore</h5>
                        <ul class="list-unstyled">
                            <li>About Us</li>
                            <li>Beauty Blog</li>
                            <li>Brands</li>
                            <li>Working with Us</li>
                            <li>Looking for Influencers</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="row">

                    <div class="col-md-12 text-center">
                        <p>&copy; 2024 The Beauty Store. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
