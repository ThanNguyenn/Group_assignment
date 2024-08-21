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
import javax.servlet.http.HttpSession;
import sample.categories.CategoriesDAO;
import sample.categories.CategoriesDTO;
import sample.cosmetic.CosmeticsDTO;
import sample.cosmetic.CosmeticsDAO;
import sample.user.UserDTO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "ShoppingController", urlPatterns = {"/ShoppingController"})
public class ShoppingController extends HttpServlet implements Serializable {

    private static final String ERROR = "shopping.jsp";
    private static final String US = "shopping.jsp";
    private static final String AD = "productManager.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            CosmeticsDAO dao = new CosmeticsDAO();
            CategoriesDAO cdao = new CategoriesDAO();
            List<CosmeticsDTO> cosmetics = dao.getAllProducts(search);
            List<CategoriesDTO> categories = cdao.getAllCategories();
            if (cosmetics.size() > 0 && categories.size()>0) {
                HttpSession session = request.getSession();
                session.setAttribute("LIST_COSMETIC", cosmetics);
                session.setAttribute("LIST_CATEGORY", categories);
                UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
                if (user.getRoleID() == null || user.getRoleID().equals("US")) {
                    url = US;
                } else {
                    url = AD;
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
