/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.http.Part;

public class Util {
    public static String getValue(Part part)throws IOException{
        BufferedReader reader=new BufferedReader(new InputStreamReader(part.getInputStream(),"UTF-8"));
        StringBuilder value=new StringBuilder();
        char[]buffer=new char[1024];
        for(int length=0;(length=reader.read(buffer))>0;){
            value.append(buffer,0,length);
        }
        
        return value.toString();
    }
}
