<%-- 
    Document   : productDetail
    Created on : Aug 18, 2024, 11:15:10 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        <link href="css/styles.css" rel="stylesheet">
        <link href="css/detail-styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>

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
                            loading="lazy"
                            />
                    </a>

                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link " href="MainController?action=Shopping">HOME</a>
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

                    <form action="MainController" method="POST" style="display: inline;">
                        <button type="submit" name="action" value="View" class="btn btn-primary" style="background: none; border: none; padding: 0;">
                            <i class="fas fa-shopping-cart"></i> Cart
                        </button>
                    </form>

                    <div style="width: 10px;"></div> 
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

        <!-- content -->
        <section class="py-5">
            <div class="container">
                <div class="row gx-5">
                    <aside class="col-lg-6">
                        <div class="border rounded-4 mb-3 d-flex justify-content-center">
                            <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image" href="#">
                                <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="images/${requestScope.COSMETIC.imageURL}" />
                            </a>
                        </div>
                        <!--        <div class="d-flex justify-content-center mb-3">
                                  <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big1.webp" class="item-thumb">
                                    <img width="60" height="60" class="rounded-2" src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big1.webp" />
                                  </a>
                                  <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big2.webp" class="item-thumb">
                                    <img width="60" height="60" class="rounded-2" src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big2.webp" />
                                  </a>
                                  <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big3.webp" class="item-thumb">
                                    <img width="60" height="60" class="rounded-2" src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big3.webp" />
                                  </a>
                                  <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big4.webp" class="item-thumb">
                                    <img width="60" height="60" class="rounded-2" src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big4.webp" />
                                  </a>
                                  <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp" class="item-thumb">
                                    <img width="60" height="60" class="rounded-2" src="https://mdbcdn.b-cdn.net/img/bootstrap-ecommerce/items/detail1/big.webp" />
                                  </a>
                                </div>-->
                        <!-- thumbs-wrap.// -->
                        <!-- gallery-wrap .end// -->
                    </aside>
                    <main class="col-lg-6">
                        <div class="ps-lg-3">
                            <h4 class="title text-dark">
                                ${requestScope.COSMETIC.name}
                            </h4>
                            <div class="d-flex flex-row my-3">
                                <div class="text-warning mb-1 me-2">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <span class="ms-1">
                                        4.5
                                    </span>
                                </div>
                                <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>${requestScope.COSMETIC.quantity}</span>
                                <span class="text-success ms-2">In stock</span>
                            </div>

                            <div class="mb-3">
                                <span class="h5">$${requestScope.COSMETIC.price}</span>
                                <span class="text-muted"></span>
                            </div>

                            <p>
                                ${requestScope.COSMETIC.description}
                            </p>

                            <div class="row">
                                <dt class="col-3">Type:</dt>
                                <dd class="col-9">${requestScope.CATEGORY.categoryName}</dd>

                                <dt class="col-3">Brand</dt>
                                <dd class="col-9">Pending Update</dd>
                            </div>

                            <hr />
                            <form action="MainController" method="POST">
                                <div class="row mb-4">
                                    <div class="col-md-4 col-6">
                                        <label class="mb-2">Size</label>
                                        <select class="form-select border border-secondary" style="height: 35px;">
                                            <option>Small</option>
                                            <option>Medium</option>
                                            <option>Large</option>
                                        </select>
                                    </div>
                                    <!-- col.// -->



                                    <div class="col-md-4 col-6 mb-3">
                                        <label class="mb-2 d-block">Quantity</label>
                                        <div class="input-group mb-3" style="width: 170px;">
                                            <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon1" data-mdb-ripple-color="dark" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>
                                            <input id="form1" min="1" name="cmbQuantity" value="1"  type="number" class="form-control text-center border border-secondary" />
                                            <button class="btn btn-white border border-secondary px-3" type="button" id="button-addon2" data-mdb-ripple-color="dark" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="cmbID" value="${requestScope.COSMETIC.id}">
                                <input type="hidden" name="cmbCId" value="${requestScope.COSMETIC.categoryID}">
                                <input type="hidden" name="cmbName" value="${requestScope.COSMETIC.name}">
                                <input type="hidden" name="cmbDescription" value="${requestScope.COSMETIC.description}">
                                <input type="hidden" name="cmbPrice" value="${requestScope.COSMETIC.price}">
                                <a href="#" class="btn btn-warning shadow-0"> Buy now </a>
                                <button type="submit" name="action" value="Add" class="btn btn-info shadow-0">
                                    <i class="me-1 fa fa-shopping-basket"></i> Add to cart
                                </button>
                                <a href="#" class="btn btn-light border border-secondary py-2 icon-hover px-3"> <i class="me-1 fa fa-heart fa-lg"></i> Save </a>
                            </form>
                        </div>
                    </main>
                </div>
            </div>
        </section>
        <!-- content -->
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
