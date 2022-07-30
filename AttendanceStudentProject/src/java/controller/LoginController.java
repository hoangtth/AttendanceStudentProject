/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.StudentDBContext;
import dal.CampusDBContext;
import dal.InstructorDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Student;
import model.Campus;
import model.Instructor;

public class LoginController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ArrayList<Campus> listCampuses = new CampusDBContext().getAllCampuses();
        request.setAttribute("listCampuses", listCampuses);
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Instructor itemp = (Instructor) session.getAttribute("instructor");
        if(itemp != null){
            session.removeAttribute("instructor");
        }
        ArrayList<Campus> listCampuses = new CampusDBContext().getAllCampuses();

        int campusID = Integer.parseInt(request.getParameter("campus"));
        if (campusID == 0) {
            request.setAttribute("error", "You need to select your Campus!");
        } else {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (!(email.toLowerCase().contains("@fe.edu.vn")) && !(email.toLowerCase().contains("@fpt.edu.vn"))) {
                request.setAttribute("errorEmail", "Your email cannot login to this system!");
            } else {
                if (email.toLowerCase().contains("@fpt")) {
                    Student student = new StudentDBContext().checkStudentExist(email, password);
                    if (student != null) {
                        Student s = new StudentDBContext().getStudentByCampus(campusID);
                        if (s != null) {
                            request.getSession().setAttribute("student", student);
                            Cookie eCookie = new Cookie("email", email);
                            eCookie.setMaxAge(5 * 60);
                            Cookie pCookie = new Cookie("password", password);
                            pCookie.setMaxAge(5 * 60);
                            response.addCookie(eCookie);
                            response.addCookie(pCookie);
                            response.sendRedirect("home");
                            return;
                        } else {
                            request.setAttribute("errorCampus", "Your account cannot login to this campus!");
                        }
                    } else {
                        request.setAttribute("errorAccount", "email or password is not correct!");
                    }
                } else if (email.toLowerCase().contains("@fe")) {
                    Instructor instructor = new InstructorDBContext().checkInstructorExist(email, password, campusID);
                    if (instructor != null) {
                        Instructor i = new InstructorDBContext().getInstructorByCampus(campusID);
                        if (i != null) {
                            request.getSession().setAttribute("instructor", instructor);
                            Cookie eCookie = new Cookie("email", email);
                            eCookie.setMaxAge(5 * 60);
                            Cookie pCookie = new Cookie("password", password);
                            pCookie.setMaxAge(5 * 60);
                            response.addCookie(eCookie);
                            response.addCookie(pCookie);
                            response.sendRedirect("home");
                            return;
                        } else {
                            request.setAttribute("errorCampus", "Your account cannot login to this campus!");
                        }
                    } else {
                        request.setAttribute("errorAccount", "email or password is not correct!");
                    }
                }
            }
        }
        request.setAttribute("campus", campusID);
        request.setAttribute("listCampuses", listCampuses);
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
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
