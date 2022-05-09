/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Picture {
    public int picture_id;
    public int project_id;
    public String picture_path;
    
     public static final String PICTURE_ID="picture_id";
    public static final String PROJECT_ID="project_id";
    public static final String PICTURE_PATH="picture_path";
    
    public static final String PICTURE="pic";

    public Picture(int picture_id, int project_id, String picture_path) {
        this.picture_id = picture_id;
        this.project_id = project_id;
        this.picture_path = picture_path;
    }
    
    
}
