/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.orders.OrderDAO;
import sample.orders.OrderDTO;
import sample.orders.OrderDetailDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "OrderDetailrController", urlPatterns = {"/OrderDetailrController"})
public class OrderDetailrController extends HttpServlet implements Serializable {

    private static final String SUCCESS = "orderManagerDetails.jsp";
    private static final String ERROR = "orderManager.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String id = request.getParameter("id");
            String uId = request.getParameter("uId");
            if (id != null) {
                OrderDAO dao=new OrderDAO();
                UserDAO udao=new UserDAO();
                OrderDTO order=dao.getOrder(id);
                List<OrderDetailDTO> orderDetailList=dao.getListOrderDetail(id);
                UserDTO user=udao.getUser(uId);
                if (orderDetailList != null && user!=null) {
                    request.setAttribute("ORDER", order);
                    request.setAttribute("ORDER_DETAIL", orderDetailList);
                    request.setAttribute("USER", user);
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
