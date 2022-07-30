/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Group;
import model.Instructor;
import model.Lession;
import model.Room;
import model.TimeSlot;

public class LessionDBContext extends DBContext {

    public ArrayList<Lession> getAllLessionsFromDay(String day, int id) {
        ArrayList<Lession> lessions = new ArrayList<>();
        try {
            String sql = "SELECT l.[id] ,l.[gid]\n"
                    + "                   ,g.[name]\n"
                    + "                         ,l.[tid]\n"
                    + "                     ,t.[name]\n"
                    + "                       ,l.[rid]\n"
                    + "                      ,r.[name]\n"
                    + "                         ,l.[date]\n"
                    + "                    	  ,g.[csid]\n"
                    + "                  	  ,cs.[name],cs.code\n"
                    + "                	  ,l.[status]\n"
                    + "                   FROM [dbo].[Lession] l inner join [Group] g on l.gid = g.id \n"
                    + "                     inner join Course cs on g.csid = cs.id\n"
                    + "                  inner join TimeSlot t on l.tid = t.id \n"
                    + "                     inner join Room r on l.rid = r.id where date = '" + day + "' and l.iid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt(9), rs.getString(10), rs.getString(11));
                Group g = new Group(rs.getInt(2), rs.getString(3), course);
                TimeSlot timeSlot = new TimeSlot(rs.getInt(4), rs.getString(5));
                Room r = new Room(rs.getInt(6), rs.getString(7));

                Lession lession = new Lession(rs.getInt(1), g, timeSlot, r, rs.getDate(8), rs.getInt(12));
                lessions.add(lession);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessions;
    }

    public Lession getLessionById(int lid) {
        try {
            String sql = " SELECT l.[id] ,l.[gid]\n"
                    + "                                    ,g.[name]\n"
                    + "                                        ,l.[tid]\n"
                    + "                                      ,t.[name]\n"
                    + "                                   ,l.[rid]\n"
                    + "                                         ,r.[name]\n"
                    + "                                          ,l.[date]\n"
                    + "                                    	  ,g.[csid]\n"
                    + "                              	  ,cs.[name],cs.code\n"
                    + "                                	  ,l.[status],l.iid\n"
                    + "                                      FROM [dbo].[Lession] l inner join [Group] g on l.gid = g.id\n"
                    + "                                      inner join Course cs on g.csid = cs.id\n"
                    + "                                   inner join TimeSlot t on l.tid = t.id \n"
                    + "                                    inner join Room r on l.rid = r.id where l.id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course(rs.getInt(9), rs.getString(10), rs.getString(11));
                Group g = new Group(rs.getInt(2), rs.getString(3), course);
                TimeSlot timeSlot = new TimeSlot(rs.getInt(4), rs.getString(5));
                Room r = new Room(rs.getInt(6), rs.getString(7));
                Instructor instructor = new InstructorDBContext().getInstructorByID(rs.getInt(13));
                Lession lession = new Lession(rs.getInt(1), g, instructor, timeSlot, r, rs.getDate(8), rs.getInt(12));
                return lession;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateStatusById(int lid) {
        try {
            String sql = "UPDATE [dbo].[Lession]\n"
                    + "   SET [status] = 1\n"
                    + " WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
