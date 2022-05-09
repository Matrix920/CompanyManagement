/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Client {
    public int client_id;
    public String username;
    public String password;
    
    public static final String ROLE="role";
    
    public static final String ADMIN="admin";
    public static final String CLIENT="client";
    
    public static final String IS_LOGIN="is_login";
    
     public static final String CLIENT_ID="admin_id";
    public static final String USERNAME="username";
    public static final String PASSWORD="password";

    public Client(int client_id, String username, String password) {
        this.client_id = client_id;
        this.username = username;
        this.password = password;
    }
    
    
}
