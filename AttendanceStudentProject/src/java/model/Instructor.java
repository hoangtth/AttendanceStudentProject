/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Instructor {
    private int id;
    private String email;
    private String password;
    private String displayName;
    private String code;
    private String imageUrl;
    private Campus campus;

    public Instructor() {
    }

    public Instructor(int id,String email, String password, String displayName) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.displayName = displayName;
    }

    public Instructor(int id, String email, String password, String displayName, String code, String imageUrl, Campus campus) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.displayName = displayName;
        this.code = code;
        this.imageUrl = imageUrl;
        this.campus = campus;
    }
  
    
    


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public Campus getCampus() {
        return campus;
    }

    public void setCampus(Campus campus) {
        this.campus = campus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    
}
