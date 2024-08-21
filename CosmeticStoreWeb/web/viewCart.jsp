<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="sample.cosmetic.Cart" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
        <link href="css/bootstrap2.min.css" rel="stylesheet">    
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>
    </style>
</head>
<body>
    <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

    <nav class="navbar navbar-expand-lg navbar-light bg-white">
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
                <a class="navbar-brand mt-2 mt-sm-0 " href="MainController?action=Shopping">
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
    <section class="h-100 gradient-custom">
        <div class="container py-5">
            <div class="row d-flex justify-content-center my-4">
                <div class="col-md-8">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Cart - ${CART != null ? CART.cart.size() : 0} items</h5>
                        </div>
                        <div class="card-body">
                            <c:set var="CART" value="${sessionScope.CART}" />
                            <c:if test="${CART != null}">
                                <c:set var="total" value="0.0" />
                                <c:forEach var="comestics" items="${CART.cart.values()}" varStatus="status">
                                    <div class="row mb-4">
                                        <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                            <div class="bg-image hover-overlay hover-zoom ripple rounded" data-bs-ripple-color="light">
                                                <img src="images/${comestics.id}.png" class="w-100" alt="${comestics.name}" />
                                            </div>
                                        </div>
                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                            <p><strong>Product Name:</strong> ${comestics.name}</p>
                                            <p><strong>Individual Price:</strong> ${comestics.price}$</p>
                                            <p><strong>Total:</strong> ${comestics.price * comestics.quantity}$</p>
                                            <form action="MainController" method="post" class="d-inline">
                                                <input type="hidden" name="id" value="${comestics.id}">
                                                <button type="submit" name="action" value="Remove" class="btn btn-danger btn-sm me-1 mb-2" data-bs-tooltip-init title="Remove item">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                            <div class="d-flex mb-4" style="max-width: 300px">
                                                <form action="MainController" method="post" class="d-flex">
                                                    <button type="button" class="btn btn-primary px-3 me-2" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <div class="form-outline">
                                                        <input id="form1" min="1" name="quantity" value="${comestics.quantity}" type="number" class="form-control" />
                                                    </div>
                                                    <button type="button" class="btn btn-primary px-3 ms-2" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                    <input type="hidden" name="id" value="${comestics.id}">
                                                    <button type="submit" name="action" value="Edit" class="btn btn-primary btn-sm mt-2 ms-2">Edit</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <hr class="my-4" />
                                    <c:set var="itemTotal" value="${comestics.price * comestics.quantity}" />
                                    <c:set var="total" value="${total + itemTotal}" />
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-body">
                            <p><strong>Expected shipping delivery</strong></p>
                            <p class="mb-0">2-3 days</p>
                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body">
                            <p><strong>We accept</strong></p>
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                                 alt="Visa" />
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                                 alt="American Express" />
                            <img class="me-2" width="45px"
                                 src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                                 alt="Mastercard" />
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Summary</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                    Products
                                    <span>${total}$</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    Shipping
                                    <span>Fast</span>
                                </li>
                                <li
                                    class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>Total amount</strong>
                                        <strong>
                                            <p class="mb-0">(including VAT)</p>
                                        </strong>
                                    </div>
                                    <span><strong>${total}$</strong></span>
                                </li>
                            </ul>
                            <form action="MainController" method="POST">
                                <button type="submit" name="action" value="Checkout" class="btn btn-outline-danger btn-lg btn-block">Go to checkout</button>
                            </form>
                        </div>
                    </div>

                    <%-- Display the checkout error message here --%>
                    <c:if test="${not empty requestScope.CHECKOUT_ERROR}">
                        <div class="alert alert-danger mt-3">
                            ${requestScope.CHECKOUT_ERROR}
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </section>



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
