/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.orders;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import sample.user.UserDTO;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class OrderDTO implements Serializable{
private static final long serialVersionUID = 1L;
    private String orderID;
    private String userID;
    private Date date;
    private double total;
    private boolean status;
    private UserDTO user;
    List<OrderDetailDTO> orderDetai;
    // Constructor
    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, Date date, double total, boolean status) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.status=status;
    }

    public OrderDTO(String orderID, String userID, Date date, double total, boolean status, UserDTO user, List<OrderDetailDTO> orderDetai) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.status = status;
        this.user = user;
        this.orderDetai = orderDetai;
    }
    

    // Getters and Setters
    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public List<OrderDetailDTO> getOrderDetai() {
        return orderDetai;
    }

    public void setOrderDetai(List<OrderDetailDTO> orderDetai) {
        this.orderDetai = orderDetai;
    }

}
