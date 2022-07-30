/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LessionDBContext;
import dal.StudentDBContext;
import dal.Student_LessionDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Instructor;
import model.Lession;
import model.Student;
import model.Student_Lession;


public class TakeAttendanceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lession lession = new LessionDBContext().getLessionById(lid);
        ArrayList<Student> students = new StudentDBContext().getAllStudentByGroupId(lession.getGroup().getId());
        request.setAttribute("lession", lession);
        request.setAttribute("lid", lid);
        request.setAttribute("students", students);
        request.getRequestDispatcher("/view/home/take-attendance.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        Lession lession = new LessionDBContext().getLessionById(lid);
        ArrayList<Student> students = new StudentDBContext().getAllStudentByGroupId(lession.getGroup().getId());
        for (Student student : students) {
            String status = request.getParameter(student.getId() + "");
            String comment = request.getParameter("comment-" + student.getId());
            new Student_LessionDBContext().insertAttendance(status, comment, student.getId(), lid);
        }
        new LessionDBContext().updateStatusById(lid);
        String schedulePage = (String) request.getSession().getAttribute("schedulePage");
        if (schedulePage != null) {
            response.sendRedirect(schedulePage);
        }else{
            response.sendRedirect("home");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
