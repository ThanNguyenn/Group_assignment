package sample.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.cosmetic.Cart;
import sample.user.UserDTO;

@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "checkoutSuccess.jsp";
    private static final String LOGIN = "login.jsp";
    private static final String QUANTITY_ERROR = "Payment failed because the product is out of stock! Please change product quantity!";
    private static final String NOT_LOGIN_ERROR = "Please login to check out!";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                request.setAttribute("ERROR", NOT_LOGIN_ERROR);
                url = LOGIN;
            } else {
                String userID = loginUser.getUserID();
                if (cart != null&& userID != null && !userID.isEmpty() ) {
                    boolean chekQuantity = cart.checkQuantity();
                    if (!chekQuantity) {
                        request.setAttribute("CHECKOUT_ERROR", QUANTITY_ERROR);
                    } else if (chekQuantity) {
                        String orderID = cart.generateID();
                        boolean isUpdate = cart.updateProductQuantity();
                        if (isUpdate) {
                            boolean isSuccesCreate = cart.createOrder(userID, orderID);
                            if (isSuccesCreate) {
                                cart.addOrderDetail(orderID);
                                url = SUCCESS;
                                session.removeAttribute("CART");}

                            }
                        }
                    }
                }

            }catch (Exception e) {
        }finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
