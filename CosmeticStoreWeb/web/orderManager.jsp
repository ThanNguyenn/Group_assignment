<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        <!--    <link href="css/styles.css" rel="stylesheet">-->
        <link href="css/admin-styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID != 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent1">
                    <a class="navbar-brand mt-2 mt-sm-0" href="#">
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
        <div class="container">
            <div class="bg-dark py-2 px-3 rounded">
                <form class="d-flex justify-content-between align-items-center" action="MainController" method="POST">
                    <div class="d-flex align-items-center">
                        <span class="text-white fw-bold me-3">Products:</span>
                        <button type="submit" class="btn btn-link text-white" name="action" value="Search">User</button>
                        <button type="submit" class="btn btn-link text-white" name="action" value="Shopping">Products</button>
                        <button type="submit" class="btn btn-link text-white" name="action" value="Order">Orders</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="container mt-4 content">
            <div class="row search-bar">
                <div class="col-md-6">
                    <form action="MainController" method="POST" class="d-flex">
                        <input class="form-control me-2" type="text" name="search" value="${param.search}" placeholder="Search"/>
                        <input type="hidden" name="action" value="Order">
                        <button class="btn btn-outline-success" type="submit"  value="Search">Search</button>
                    </form>
                </div>
            </div> </div> 

            <div class="container mt-5">
    <h2 class="mb-4">Order Management</h2>
    
    
    
    <!-- Loop through the list of orders -->
    <c:forEach var="order" items="${LIST_ORDER}">
        <form action="MainController" method="POST">
        <!-- Order Details (Outside of the table) -->
        <div class="order-details mb-4">
            <h5>Order ID: ${order.orderID}</h5>
            <p><strong>User Name:</strong> ${order.user.fullName}</p> <!-- Assuming UserDTO has a `name` property -->
            <p><strong>Date of Order:</strong> ${order.date}</p>
            <p><strong>Status:</strong> 
                <select name="status" class="form-select form-select-sm w-auto d-inline">
                    <option value="true" ${order.status ? "selected" : ""}>Processing</option>
                    <option value="false" ${!order.status ? "selected" : ""}>Canceled</option>
                </select>
            </p>
        </div>

        <!-- Products in Order (Inside the table) -->
        <div class="order-products">
            <h6>Products:</h6>
            <table class="table table-bordered table-sm">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through each product in the order -->
                    <c:forEach var="detail" items="${order.orderDetai}">
                        <tr>
                            <td>${detail.productID}</td>
                            <td>${detail.quantity}</td>
                            <td>$${detail.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p><strong>Total Price:</strong> $${order.total}</p>
        </div>
            <input type="hidden" name="id" value="${order.orderID}">
            <input type="hidden" name="search" value="${param.search}">
            <input type="hidden" name="action" value="UpdateOrder">
        <!-- Update Button -->
        <button type="submit" class="btn btn-primary mt-3">Update</button>

        <hr />
        </form>
    </c:forEach>

                            </div>








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
