/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class Lession {
    private int id;
    private Group group;
    private Instructor instructor;
    private TimeSlot timeSlot;
    private Room room;
    private Date date;
    private int status;

    public Lession() {
    }

    public Lession(int id, Group group, TimeSlot timeSlot, Room room, Date date, int status) {
        this.id = id;
        this.group = group;
        this.timeSlot = timeSlot;
        this.room = room;
        this.date = date;
        this.status = status;
    }

    
    
    public Lession(int id, Group group, Instructor instructor, TimeSlot timeSlot, Room room, Date date, int status) {
        this.id = id;
        this.group = group;
        this.instructor = instructor;
        this.timeSlot = timeSlot;
        this.room = room;
        this.date = date;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
    
}
