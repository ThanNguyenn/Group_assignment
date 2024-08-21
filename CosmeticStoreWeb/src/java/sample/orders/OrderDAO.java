/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.orders;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class OrderDAO {

    private static final String SEARCH = "SELECT orderID, userID, date, total, status FROM tblOrders WHERE orderID LIKE ?";
    private static final String SEARCH_DETAIL = "SELECT productID, price, quantity FROM tblOrderDetails WHERE orderID=?";
    private static final String UPDATE = "UPDATE tblOrders SET status = ?  WHERE orderID=?";
    private static final String GET_ORDER = "SELECT orderID, userID, date, total, status FROM tblOrders WHERE orderID = ? ";


    public List<OrderDTO> getListOrder(String search) throws SQLException, ParseException {
        List<OrderDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String userID = rs.getString("userID");
                    Date date = rs.getDate("date");
                    double total = rs.getDouble("total");
                    boolean status = rs.getBoolean("status");
                    List <OrderDetailDTO> orders=getListOrderDetail(orderID);
                    UserDAO dao=new UserDAO();
                    UserDTO user=dao.getUser(userID);
                    list.add(new OrderDTO(orderID, userID, date, total, status, user, orders));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;

    }

    public List<OrderDetailDTO> getListOrderDetail(String orderID) throws SQLException {
         List<OrderDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_DETAIL);
                ptm.setString(1, orderID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    list.add(new OrderDetailDTO(orderID, productID, price, quantity));
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return list;

    }

    public boolean update(String id, boolean status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(2, id);
                ptm.setBoolean(1, status);
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public OrderDTO getOrder(String id) throws SQLException {
         OrderDTO order = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ORDER);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    Date date=rs.getDate("date");
                    double total = rs.getDouble("total");
                     boolean status = rs.getBoolean("status");
                    order = new OrderDTO(id, userID, date, total, status);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return order;
    }

}
