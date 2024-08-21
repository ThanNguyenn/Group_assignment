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
                            
      <!-- Order Manager Page Content -->
<div class="container mt-5">
    <h2 class="mb-4">Order Management</h2>

    <!-- Order Details (Outside of the table) -->
    <div class="order-details mb-4">
        <h5>Order ID: 12345</h5>
        <p><strong>User Name:</strong> John Doe</p>
        <p><strong>Date of Order:</strong> 2024-08-21</p>
        <p><strong>Status:</strong> 
            <select class="form-select form-select-sm w-auto d-inline">
                <option value="processing">Processing</option>
                <option value="canceled">Canceled</option>
            </select>
        </p>
    </div>

    <!-- Products in Order (Inside the table) -->
    <div class="order-products">
        <h6>Products:</h6>
        <table class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Cosmetic Product A</td>
                    <td>2</td>
                    <td>$20.00</td>
                </tr>
                <tr>
                    <td>Cosmetic Product B</td>
                    <td>1</td>
                    <td>$15.00</td>
                </tr>
                <tr>
                    <td>Cosmetic Product C</td>
                    <td>3</td>
                    <td>$45.00</td>
                </tr>
            </tbody>
        </table>
        <p><strong>Total Price:</strong> $80.00</p>
    </div>

    <!-- Update Button -->
    <button type="button" class="btn btn-primary mt-3">Update</button>

    <hr />

    <!-- Another Order Example -->
    <div class="order-details mb-4">
        <h5>Order ID: 67890</h5>
        <p><strong>User Name:</strong> Jane Smith</p>
        <p><strong>Date of Order:</strong> 2024-08-20</p>
        <p><strong>Status:</strong> 
            <select class="form-select form-select-sm w-auto d-inline">
                <option value="processing">Processing</option>
                <option value="canceled">Canceled</option>
            </select>
        </p>
    </div>

    <!-- Products in Order (Inside the table) -->
    <div class="order-products">
        <h6>Products:</h6>
        <table class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Cosmetic Product D</td>
                    <td>1</td>
                    <td>$25.00</td>
                </tr>
                <tr>
                    <td>Cosmetic Product E</td>
                    <td>4</td>
                    <td>$60.00</td>
                </tr>
                <tr>
                    <td>Cosmetic Product F</td>
                    <td>2</td>
                    <td>$40.00</td>
                </tr>
            </tbody>
        </table>
        <p><strong>Total Price:</strong> $125.00</p>
    </div>

    <!-- Update Button -->
    <button type="button" class="btn btn-primary mt-3">Update</button>

    <hr />
</div>

    <hr />
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
