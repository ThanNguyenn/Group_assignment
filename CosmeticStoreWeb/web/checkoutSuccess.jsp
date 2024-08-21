<%-- 
    Document   : checkoutSuccess
    Created on : Jun 21, 2024, 10:01:21 AM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout Success</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        <!--        <link href="css/styles.css" rel="stylesheet">-->
        <link href="css/checkout-styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-white">
            <div class="container">    
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent1">      
                    <a class="navbar-brand mt-2 mt-sm-0" href="MainController?action=Shopping">
                        <img src="images/logo2.png" height="50" alt="Brand Logo" loading="lazy" />
                    </a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="MainController?action=Shopping">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Product Corner</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Shipping Information</a>
                        </li>
                    </ul>      
                </div>
                <div class="d-flex align-items-center">
                    <c:choose>
                        <c:when test="${sessionScope.LOGIN_USER == null}">
                            <form action="MainController" method="POST" style="display: inline;">
                                <button type="submit" name="action" value="LoginPage" class="nav-link me-3 btn btn-primary" style="background: none; border: none; padding: 0;">
                                    <i class="fas fa-sign-in-alt"></i> Login
                                </button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <form action="MainController" method="POST" style="display: inline;">
                                <button type="submit" name="action" value="Profile" class="nav-link me-3 btn btn-primary" style="background: none; border: none; padding: 0;">
                                    <i class="fas fa-user-circle"></i> Profile
                                </button>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        <div class="container content">
            <h1>Thank you for your order!</h1>
            <a href="MainController?action=Shopping" class="btn btn-primary mt-3">Continue Browsing</a>
        </div>

        <footer class="footer bg-dark text-white mt-5">
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
