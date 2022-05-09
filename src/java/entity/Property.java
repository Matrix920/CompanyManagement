/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

public class Property {
    public int property_id;
    public int project_id;
    public int price;
    public String address;
    public int area;
    public String kind;
    public int room;
    
    public static final String PROPERTY_ID="property_id";
    public static final String PROJECT_ID="project_id";
    public static final String PRICE="price";
    public static final String ADDRESS="address";
    public static final String AREA="area";
    public static final String KIND="kind";
    public static final String ROOM="room";
    
    public static final String SEARCH_TYPE="search_type";
    public static final String SEARCH_TEXT="search_text";

    public Property(int property_id, int project_id, int price, String address, int area, String kind, int room) {
        this.property_id = property_id;
        this.project_id = project_id;
        this.price = price;
        this.address = address;
        this.area = area;
        this.kind = kind;
        this.room = room;
    }
    
    
}
