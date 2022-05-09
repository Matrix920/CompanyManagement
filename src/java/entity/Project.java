/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Project {
    public int project_id;
    public String project_name;
    public String address;
    public Long tel;
    
     public static final String PROJECT_ID="project_id";
     public static final String PROJECT_NAME="project_name";
     public static final String ADDRESS="address";
     public static final String TEL="tel";

    public Project(int project_id, String project_name, String address, Long tel) {
        this.project_id = project_id;
        this.project_name = project_name;
        this.address = address;
        this.tel = tel;
    }
    
    
}
