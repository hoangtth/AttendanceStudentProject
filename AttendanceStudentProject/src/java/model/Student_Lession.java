package model;


public class Student_Lession {
    private int suid;
    private int lid;
    private String status;
    private String recordtime;
    private String comment;

    public Student_Lession() {
    }

    public Student_Lession(int suid, int lid, String status, String recordtime, String comment) {
        this.suid = suid;
        this.lid = lid;
        this.status = status;
        this.recordtime = recordtime;
        this.comment = comment;
    }

    public Student_Lession(String status, String comment) {
        this.status = status;
        this.comment = comment;
    }

    public int getSuid() {
        return suid;
    }

    public void setSuid(int suid) {
        this.suid = suid;
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(String recordtime) {
        this.recordtime = recordtime;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    
    
    
   
    
}
