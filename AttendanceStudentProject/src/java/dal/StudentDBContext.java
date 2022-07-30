/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import model.Campus;
import model.Student_Lession;

public class StudentDBContext extends DBContext {

    public Student checkStudentExist(String email, String password) {
        try {
            String sql = "SELECT s.[id]\n"
                    + "                    ,[email]\n"
                    + "                    ,[password]\n"
                    + "                   ,[displayName]\n"
                    + "                   ,[code]\n"
                    + "                   ,[imageUrl]\n"
                    + "                          ,s.[cid] as cid,c.name as cname\n"
                    + "                    FROM [dbo].[Student] s inner join Campus c on s.cid = c.id where email = ? and [password] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Campus c = new Campus(rs.getInt(7), rs.getString(8));
                Student student = new Student(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), c);
                return student;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Student getStudentByCampus(int campus) {
        try {
            String sql = "select * from student where cid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, campus);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Student s = new Student(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getAllStudentByGroupId(int gid) {
        ArrayList<Student> list = new ArrayList<>();
        try {
            String sql = "select Student.* from [Group] join Student_Group on [Group].id = Student_Group.gid\n"
                    + "  join Student on Student.id = Student_Group.suid where  [Group].id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, gid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Campus campus = new CampusDBContext().getCampusByCid(rs.getInt(5));
                Student s = new Student(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getString(7), campus);
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getAllStudentByGroupAndLessionId(int gid, int lid) {
        ArrayList<Student> list = new ArrayList<>();
        try {
            String sql = "select Student.id,Student.password,Student.email,Student.displayName,Student.code,Student.imageUrl\n"
                    + " ,Student_Lession.* from [Group] join Student_Group on [Group].id = Student_Group.gid\n"
                    + "                     join Student on Student.id = Student_Group.suid join Student_Lession on Student.id = Student_Lession.suid  \n"
                    + "					 where  [Group].id = ? and lid = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, gid);
            ps.setInt(2, lid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student_Lession student_Lession = new Student_Lession(rs.getInt(7),
                        rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
                Student s = new Student(rs.getInt(1), rs.getString(3), rs.getString(2),
                        rs.getString(4), rs.getString(5), rs.getString(6), null, student_Lession);
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
