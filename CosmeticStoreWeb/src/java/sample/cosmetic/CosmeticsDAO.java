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
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class CosmeticsDAO {

    private static final String SHOPPING = "SELECT productID, categoryID, productName, productDescription, price, quantity FROM tblProducts WHERE (productName LIKE ? OR categoryID LIKE ?) AND status != 0";
    private static final String DETAIL = "SELECT productID, categoryID, productName, productDescription, price, quantity FROM tblProducts WHERE productID = ? ";
    private static final String SOFT_DELETE = "UPDATE tblProducts SET status=0 WHERE productID=?";
    private static final String UPDATE = "UPDATE tblProducts SET productName=?, productDescription=?, price= ?,quantity= ?  WHERE productID=?";
    private static final String CREATE = "INSERT INTO tblProducts(productID, categoryID, productName, productDescription, price, quantity, status) VALUES (?,?,?,?,?,?,1)";
    private static final String MAX_ID = "SELECT TOP 1 productID FROM tblProducts ORDER BY productID DESC";
    public String generateID;

    public List<CosmeticsDTO> getAllProducts(String search) throws Exception {
        List<CosmeticsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOPPING);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    String productDescription = rs.getString("productDescription");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    list.add(new CosmeticsDTO(productID, categoryID, productName, productDescription, price, quantity));
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

    public CosmeticsDTO getProduct(String id) throws SQLException {
        CosmeticsDTO cosmetic = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DETAIL);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    String productDescription = rs.getString("productDescription");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    cosmetic = new CosmeticsDTO(id, categoryID, productName, productDescription, price, quantity);
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
        return cosmetic;
    }

    public boolean checkDelete(String id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SOFT_DELETE);
                ptm.setString(1, id);
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

    public boolean update(String id, String cId, String name, String description, double price, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(5, id);
                ptm.setString(1, name);
                ptm.setString(2, description);
                ptm.setDouble(3, price);
                ptm.setInt(4, quantity);
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

    public boolean addCosmetic(String id, String category, String name, String description, double price, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1, id);
                ptm.setString(2, category);
                ptm.setString(3, name);
                ptm.setString(4, description);
                ptm.setDouble(5, price);
                ptm.setInt(6, quantity);
                 check = ptm.executeUpdate() > 0;
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
        return check;
    }

    public String generateID() throws SQLException {
        String ID = "P001";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(MAX_ID);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    String MaxID = rs.getString("productID");
                    int IDNumber = Integer.parseInt(MaxID.substring(1));
                    IDNumber++;
                    ID = String.format("P%03d", IDNumber);
                }
            }
        } catch (Exception e) {
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
        return ID;
    }
}
