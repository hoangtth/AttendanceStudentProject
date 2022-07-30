/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LessionDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import model.Instructor;
import model.Lession;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ScheduleController extends HttpServlet {

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

        try {
            HttpSession session = request.getSession();
            Instructor instructor = (Instructor) session.getAttribute("instructor");
            String date = request.getParameter("date");
            String startDate_raw = date.substring(0, 10);
            String endDate_raw = date.substring(11, 21);

            Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(startDate_raw);

            Date Monday_date = findNextDay(date1);
            Date Tuesday_date = findNextDay(Monday_date);
            Date Wednesday_date = findNextDay(Tuesday_date);
            Date Thursday_date = findNextDay(Wednesday_date);
            Date Friday_Date = findNextDay(Thursday_date);

            SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");

            String monday = formater.format(Monday_date);
            String tuesday = formater.format(Tuesday_date);
            String wednesday = formater.format(Wednesday_date);
            String thursday = formater.format(Thursday_date);
            String friday = formater.format(Friday_Date);

            ArrayList<Lession> lessionsSunday
                    = new LessionDBContext().getAllLessionsFromDay(startDate_raw, instructor.getId());
            ArrayList<Lession> lessionsMonday
                    = new LessionDBContext().getAllLessionsFromDay(monday, instructor.getId());
            ArrayList<Lession> lessionsTuesday
                    = new LessionDBContext().getAllLessionsFromDay(tuesday, instructor.getId());
            ArrayList<Lession> lessionsWednesday
                    = new LessionDBContext().getAllLessionsFromDay(wednesday, instructor.getId());
            ArrayList<Lession> lessionsThursday
                    = new LessionDBContext().getAllLessionsFromDay(thursday, instructor.getId());
            ArrayList<Lession> lessionsFriday
                    = new LessionDBContext().getAllLessionsFromDay(friday, instructor.getId());
            ArrayList<Lession> lessionsSaturday
                    = new LessionDBContext().getAllLessionsFromDay(endDate_raw, instructor.getId());

            request.getSession().setAttribute("schedulePage", "/Assignment/schedule?date=" + startDate_raw + "-" + endDate_raw);
            request.setAttribute("date", date);
            request.setAttribute("lessionsSunday", lessionsSunday);
            request.setAttribute("lessionsMonday", lessionsMonday);
            request.setAttribute("lessionsTuesday", lessionsTuesday);
            request.setAttribute("lessionsWednesday", lessionsWednesday);
            request.setAttribute("lessionsThursday", lessionsThursday);
            request.setAttribute("lessionsFriday", lessionsFriday);
            request.setAttribute("lessionsSaturday", lessionsSaturday);
            request.setAttribute("sunday", startDate_raw);
            request.setAttribute("monday", monday);
            request.setAttribute("tuesday", tuesday);
            request.setAttribute("wednesday", wednesday);
            request.setAttribute("thursday", thursday);
            request.setAttribute("friday", friday);
            request.setAttribute("saturday", endDate_raw);
            request.getRequestDispatcher("view/home/schedule.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ScheduleController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private static final long MILLIS_IN_A_DAY = 1000 * 60 * 60 * 24;

    private static Date findNextDay(Date date) {
        return new Date(date.getTime() + MILLIS_IN_A_DAY);
    }

    private static Date findPrevDay(Date date) {
        return new Date(date.getTime() - MILLIS_IN_A_DAY);
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
