/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

public class UserError {
    private String userIDError;
    private String fullNameError;
    private String roleError;
    private String passwordError;
    private String confirmError;
    private String error;

    public UserError(String userIDError, String fullNamerror, String roleError, String passwordError, String confirmError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNamerror;
        this.roleError = roleError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.error = error;
    }

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.roleError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.error = "";
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getRoleError() {
        return roleError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    
}
