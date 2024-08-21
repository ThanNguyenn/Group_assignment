/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.categories;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class CategoriesDTO {

    private String categoryID;
    private String categoryName;

    // Constructor
    public CategoriesDTO() {
    }

    public CategoriesDTO(String categoryID, String categoryName) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
    }

    // Getters and Setters
    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
