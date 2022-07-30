/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.jsp.jstl.sql.Result;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Campus;

public class CampusDBContext extends DBContext{

    public ArrayList<Campus> getAllCampuses() {
        ArrayList<Campus> list = new ArrayList<>();
        try {
            String sql = "select * from Campus";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Campus c = new Campus(rs.getInt(1), rs.getString(2));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Campus getCampusByCid(int cid) {
        try {
            String sql = "select * from Campus where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                Campus c = new Campus(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CampusDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null; 
    }



    
}
