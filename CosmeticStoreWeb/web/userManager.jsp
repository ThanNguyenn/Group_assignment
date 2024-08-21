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
                        <button class="btn btn-outline-success" type="submit" name="action" value="Search">Search</button>
                    </form>
                </div>
            </div>

            <c:if test="${not empty requestScope.LIST_USER}">
    <div class="container mt-4">
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">User List</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="thead-dark" >
                            <tr>
                               <th style="text-align: center;">No</th>
                                <th style="text-align: center;">User ID</th>
                               <th style="text-align: center;">Full Name</th>
                                <th style="text-align: center;">Role ID</th>
                               <th style="text-align: center;">Password</th>
                               <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">
                                <tr>
                                    <form action="MainController" method="POST">
                                        <td>${counter.count}</td>
                                        <td><input type="text" class="form-control" name="userID" value="${user.userID}" readonly/></td>
                                        <td><input type="text" class="form-control" name="fullName" value="${user.fullName}" required/></td>
                                        <td><input type="text" class="form-control" name="roleID" value="${user.roleID}" required/></td>
                                        <td>${user.password}</td>
                                        <td>
                                            <button class="btn btn-warning btn-sm" type="submit" name="action" value="Update" data-toggle="tooltip" data-placement="top" title="Update User">
                                                <i class="fas fa-edit"></i> Update
                                            </button>
                                            <input type="hidden" name="search" value="${param.search}"/>
                                            <c:url var="deleteLink" value="MainController">
                                                <c:param name="action" value="Delete"/>
                                                <c:param name="userID" value="${user.userID}"/>
                                                <c:param name="roleID" value="${user.roleID}"/>
                                                <c:param name="search" value="${param.search}"/>
                                            </c:url>
                                            <a class="btn btn-danger btn-sm ml-2" href="${deleteLink}" onclick="return confirm('Are you sure you want to delete this user?');" data-toggle="tooltip" data-placement="top" title="Delete User">
                                                <i class="fas fa-trash"></i> Delete
                                            </a>
                                        </td>
                                    </form>
                                </tr>
                            </c:forEach>
                            <c:if test="${not empty requestScope.DELETE_ERROR}">
                                <tr>
                                    <td colspan="7">
                                        <div class="alert alert-danger mb-0">
                                            ${requestScope.DELETE_ERROR}
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:if>
    
        </div>

                        <footer class="footer" style="margin-top: 30px">
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
