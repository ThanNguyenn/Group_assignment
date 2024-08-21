/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cosmetic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import sample.utils.DBUtils;

public class Cart {

    private static final String QUANTITY = "SELECT quantity FROM tblProducts WHERE productID = ?";
    private static final String UPDATE_QUANTITY = "UPDATE tblProducts SET quantity = quantity - ? WHERE productID = ?";
    private static final String UPDATE_ORDER = "INSERT INTO tblOrders (orderID, userID, date, total, status) VALUES (?, ?, GETDATE(), ?, 1)";
    private static final String UPDATE_ORDER_DETAIL = "INSERT INTO tblOrderDetails (orderID, productID, price, quantity, status) VALUES (?, ?, ?, ?, 1)";
    private static final String MAX_ID = "SELECT TOP 1 orderID FROM tblOrders ORDER BY orderID DESC";

    private Map<String, CosmeticsDTO> cart;

    public Cart() {
    }

    public Map<String, CosmeticsDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, CosmeticsDTO> cart) {
        this.cart = cart;
    }

    public boolean add(CosmeticsDTO comestics) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(comestics.getId())) {
                int currentQuantity = cart.get(comestics.getId()).getQuantity();
                comestics.setQuantity(currentQuantity + comestics.getQuantity());
            }
            this.cart.put(comestics.getId(), comestics);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                this.cart.remove(id);
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return check;
    }

    public boolean edit(String id, String quantity) {
        boolean check = false;
        try {
            if (this.cart != null && this.cart.containsKey(id)) {
                this.cart.get(id).setQuantity(Integer.parseInt(quantity));
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return check;
    }

    public boolean checkQuantity() throws SQLException {
        boolean check = true;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                for (CosmeticsDTO comestics : cart.values()) {
                    ptm = conn.prepareStatement(QUANTITY);
                    ptm.setString(1, comestics.getId());
                    rs = ptm.executeQuery();
                    if (rs.next()) {
                        int available = rs.getInt("quantity");
                        if (comestics.getQuantity() > available) {
                            check = false;
                            break;
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
        return check;
    }

    public boolean updateProductQuantity() throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check=false;
        try {
            conn = DBUtils.getConnection();
            for (CosmeticsDTO comestics : cart.values()) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                ptm.setInt(1, comestics.getQuantity());
                ptm.setString(2, comestics.getId());
                check=ptm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public boolean createOrder(String userID, String orderID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check=false;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(UPDATE_ORDER);
//            String orderID = generateOrderID();
            double total = 0;
            for (CosmeticsDTO comestics : cart.values()) {
                total += comestics.getPrice() * comestics.getQuantity();
            } 
            ptm.setString(1, orderID);
            ptm.setString(2, userID);
            ptm.setDouble(3, total);
            check=ptm.executeUpdate()>0;
        } catch (Exception e) {
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

    public void addOrderDetail(String orderID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            for (CosmeticsDTO comestics : cart.values()) {
                ptm = conn.prepareStatement(UPDATE_ORDER_DETAIL);
                ptm.setString(1, orderID);
                ptm.setString(2, comestics.getId());
                double total=comestics.getPrice()*comestics.getQuantity();
                ptm.setDouble(3, total);
                ptm.setInt(4, comestics.getQuantity());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }
    
    public String generateID() throws SQLException{
        String ID="O001";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
       try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            ptm = conn.prepareStatement(MAX_ID);
            rs = ptm.executeQuery();
            
            if (rs.next()) {
                String MaxID = rs.getString("orderID");
                int IDNumber = Integer.parseInt(MaxID.substring(1));
                IDNumber++;
                ID = String.format("O%03d", IDNumber);
            }
        }
    } catch (Exception e) {
        }finally{
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (conn != null) conn.close();}
        return ID;
}

}
