/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Video {
    public int video_id;
    public int project_id;
    public String video_path;
    
    public static final String MEDIA_TYPE="type";

    public static final String VIDEO="vid";
    public static final String VIDEO_ID="video_id";
    public static final String PROJECT_ID=Project.PROJECT_ID;
    public static final String VIDEO_PATH="video_path";
          
    public Video(int video_id, int project_id, String video_path) {
        this.video_id = video_id;
        this.project_id = project_id;
        this.video_path = video_path;
    }
    
    
}
