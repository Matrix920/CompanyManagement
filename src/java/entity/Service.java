/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Service {
    public int service_id;
    public int project_id;
    public String service_title;
    
    public static final String SERVICE_ID="service_id";
    public static final String PROJCET_ID=Project.PROJECT_ID;
    public static final String SERVICE_TITLE="service_title";

    public Service(int service_id, int project_id, String service_title) {
        this.service_id = service_id;
        this.project_id = project_id;
        this.service_title = service_title;
    }
    
    
}
