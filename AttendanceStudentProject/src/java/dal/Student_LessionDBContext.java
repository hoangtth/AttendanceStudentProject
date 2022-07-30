package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student_Lession;

public class Student_LessionDBContext extends DBContext {

    public void insertAttendance(String status, String comment, int sid, int lid) {
        try {
            String sql = "INSERT INTO [dbo].[Student_Lession]\n"
                    + "           ([suid]\n"
                    + "           ,[lid]\n"
                    + "           ,[status]\n"
                    + "           ,[comment])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.setInt(2, lid);
            ps.setString(3, status);
            ps.setString(4, comment);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Student_LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Student_Lession> getAttendanceByLessionID(int lid) {
        ArrayList<Student_Lession> sls = new ArrayList<>();
        try {
            String sql = "SELECT [status]\n"
                    + "      ,[comment]\n"
                    + "  FROM [dbo].[Student_Lession]"
                    + "  WHERE [lid] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student_Lession sl = new Student_Lession(rs.getString(1), rs.getString(2));
                sls.add(sl);
            }
            return sls;
        } catch (SQLException ex) {
            Logger.getLogger(Student_LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editAttendance(String status, String comment, int sid, int lid) {
        try {
            String sql = "UPDATE [dbo].[Student_Lession]\n"
                    + "   SET [status] = ?\n"
                    + "      ,[comment] = ?\n"
                    + " WHERE [suid] = " + sid + " AND [lid] = " + lid;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, comment);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Student_LessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
