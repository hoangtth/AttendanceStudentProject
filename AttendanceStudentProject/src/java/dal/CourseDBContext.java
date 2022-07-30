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
import model.Course;
import model.Instructor;


public class CourseDBContext extends DBContext{

    Course getCourseById(int id) {
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[code]\n"
                    + "  FROM [dbo].[Course] where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Course c = new Course(rs.getInt(1), rs.getString(2), rs.getString(3));
                return c ;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
