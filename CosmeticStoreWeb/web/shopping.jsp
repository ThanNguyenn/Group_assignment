<%@page import="sample.categories.CategoriesDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">    
        <link href="css/styles.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/28bfb6acdf.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER.roleID == 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

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

        <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="0"
                    class="active"
                    aria-current="true"
                    aria-label="Slide 1"
                    ></button>
                <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="1"
                    aria-label="Slide 2"
                    ></button>
                <button
                    type="button"
                    data-bs-target="#carouselExampleCaptions"
                    data-bs-slide-to="2"
                    aria-label="Slide 3"
                    ></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/background.png" class="d-block w-100" alt="Wild Landscape"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-sm-block mb-5">
                        <h1 class="mb-4">
                            <strong>Welcome to The Beauty Store</strong>
                        </h1>

                        <p>
                            <strong>Shop the Latest in Beauty Trends</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Discover our curated collection of high-quality cosmetics that cater to all your skincare and makeup needs</strong>
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/background2.png" class="d-block w-100" alt="Camera"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-md-block mb-5">
                        <h1 class="mb-4">
                            <strong>Welcome to The Beauty Store</strong>
                        </h1>

                        <p>
                            <strong>Your Journey to Radiant Skin Starts Here</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Dive into our collection and find the perfect match for your skin type and preferences</strong>
                        </p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/background3.png" class="d-block w-100" alt="Exotic Fruits"/>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
                    <div class="carousel-caption d-none d-md-block mb-5">
                        <h1 class="mb-4">
                            <strong>Welcome to The Beauty Store</strong>
                        </h1>

                        <p>
                            <strong>Experience Luxury in Every Drop</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>Our carefully selected products are here to help you look and feel your best</strong>
                        </p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>>
    </div>

    <main>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark mt-3 mb-5 shadow p-2" style="background-color: #e74d86">
                <div class="container-fluid">

                    <a class="navbar-brand" href="#">Products:</a>

                    <button 
                        class="navbar-toggler" 
                        type="button" 
                        data-bs-toggle="collapse" 
                        data-bs-target="#navbarSupportedContent2" 
                        aria-controls="navbarSupportedContent2" 
                        aria-expanded="false" 
                        aria-label="Toggle navigation">
                        <i class="fas fa-bars"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                            <!-- Link -->
                            <li class="nav-item acitve">
                                <a class="nav-link text-white" href="MainController?action=Shopping">All</a>
                            </li>
                            <c:if test="${not empty sessionScope.LIST_CATEGORY}">
                                <c:forEach var="cdto" items="${sessionScope.LIST_CATEGORY}">
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="MainController?search=${cdto.categoryID}&action=Shopping">
                                            ${cdto.categoryName}
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>


                        </ul>

                        <form class="w-auto py-1" style="max-width: 12rem">
                            <input type="hidden" name="action" value="Shopping">
                            <input type="search" name="search" class="form-control rounded-0" placeholder="Search" aria-label="Search">
                        </form>

                    </div>
                </div>
            </nav>

            <section>
                <div class="text-center">
                    <p>${requestScope.MESSAGE}</p>
                    <c:if test="${not empty sessionScope.LIST_COSMETIC && sessionScope.LIST_COSMETIC.size() > 0}">
                        <div class="row">
                            <c:forEach var="cosmetic" items="${sessionScope.LIST_COSMETIC}" varStatus="status">
                                <div class="col-md-4 mb-4">
                                    <div class="card h-100">
                                        <a href="MainController?id=${cosmetic.id}&cId=${cosmetic.categoryID}&action=Detail"><img src="images/${cosmetic.imageURL}" class="card-img-top" alt="${cosmetic.name}"></a>
                                        <div class="card-body">
                                            <h5 class="card-title">${cosmetic.name}</h5>
                                            <p class="card-text">
                                                ${cosmetic.price}$<br>
                                                ${cosmetic.quantity} in stock<br>                      
                                            </p>
                                            <form action="MainController" method="POST">
                                                <div class="mb-3 d-flex align-items-center">
                                                    <label for="cmbQuantity${status.count}" class="form-label me-2"><strong>Select Quantity:</strong></label>
                                                    <select id="cmbQuantity${status.count}" name="cmbQuantity" class="form-select custom-select-width me-2">
                                                        <option value="1">1 item</option>
                                                        <option value="5">5 items</option>
                                                        <option value="10">10 items</option>
                                                    </select>
                                                    <input type="hidden" name="cmbID" value="${cosmetic.id}">
                                                    <input type="hidden" name="cmbCId" value="${cosmetic.categoryID}">
                                                    <input type="hidden" name="cmbName" value="${cosmetic.name}">
                                                    <input type="hidden" name="cmbDescription" value="${cosmetic.description}">
                                                    <input type="hidden" name="cmbPrice" value="${cosmetic.price}">
                                                    <button type="submit" name="action" value="Add" class="btn btn-primary">
                                                        <i class="fas fa-cart-plus"></i>Add
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>

                    <c:if test="${empty sessionScope.LIST_COSMETIC || sessionScope.LIST_COSMETIC.size() == 0}">
                        <p>No cosmetics available currently.</p>
                    </c:if>
                </div>
            </section>

            <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>  
        </div>
    </main>

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
