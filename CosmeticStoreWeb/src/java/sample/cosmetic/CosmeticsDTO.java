/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cosmetic;

import java.io.Serializable;
import sample.categories.CategoriesDTO;

public class CosmeticsDTO {

    private String id;
    private String categoryID;
    private String name;

    private String description;
    private double price;
    private int quantity;

    private String imageURL;
    


    public CosmeticsDTO(String id, String categoryID, String name, String description, double price, int quantity) {
        this.id = id;
        this.categoryID = categoryID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.imageURL = id + ".png";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
        this.imageURL = id + ".png";
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImageURL() {
        return imageURL;
    }


}
