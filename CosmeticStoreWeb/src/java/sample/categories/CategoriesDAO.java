/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.categories;

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
public class CategoriesDAO {

    private static final String SEARCH = "SELECT categoryName FROM tblCategories WHERE categoryID = ?";
    private static final String LIST = "SELECT categoryID, categoryName FROM tblCategories ";

    public CategoriesDTO getCategories(String cId) throws SQLException {
        CategoriesDTO category = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, cId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String categoryName = rs.getString("categoryName");
                    category = new CategoriesDTO(cId, categoryName);
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
        return category;

    }

    public List<CategoriesDTO> getAllCategories() throws SQLException {
        List<CategoriesDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST);
                rs = ptm.executeQuery();
                while (rs.next()) {             
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    
                    list.add(new CategoriesDTO(categoryID, categoryName));
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

}
