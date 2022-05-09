/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Admin {
    public int admin_id;
    public String username;
    public String password;
    
    public static final String ADMIN_ID="admin_id";
    public static final String USERNAME="username";
    public static final String PASSWORD="password";

    public Admin(int admin_id, String username, String password) {
        this.admin_id = admin_id;
        this.username = username;
        this.password = password;
    }
    
    
}
