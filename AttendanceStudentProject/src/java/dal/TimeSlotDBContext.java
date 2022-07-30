/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.TimeSlot;

public class TimeSlotDBContext extends DBContext {

    public TimeSlot getTimeSlotById(int id) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[start]\n"
                    + "      ,[end]\n"
                    + "  FROM [dbo].[TimeSlot]\n"
                    + " where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TimeSlot t = new TimeSlot(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
