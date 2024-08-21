<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link href="css/bootstrap2.min.css" rel="stylesheet">    
        <link href="css/user-styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID != 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent1">
                    <a class="navbar-brand mt-2 mt-sm-0" href="MainController?action=Shopping">
                        <img src="images/logo2.png" height="50" alt="Brand Logo"/>
                    </a>

                    <div class="navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <span class="nav-link">Welcome: ${sessionScope.LOGIN_USER.fullName}</span>
                            </li>
                            <li class="nav-item">
                                <c:url var="logoutLink" value="MainController">
                                    <c:param name="action" value="Logout"/>
                                </c:url>
                                <a class="nav-link" href="${logoutLink}">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>



        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-body-tertiary rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="MainController?action=Shopping">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">User</a></li>
                                <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                                <img src="images/Guest.png" alt="avatar"
                                     class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3">${sessionScope.LOGIN_USER.fullName}</h5>
                                <p class="text-muted mb-1"><button  type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-danger">Update your Avatar</button></p>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.LOGIN_USER.fullName}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">User ID</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.LOGIN_USER.userID}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Role ID</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${sessionScope.LOGIN_USER.roleID}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Password</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">***</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>

        <footer class="footer">
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
