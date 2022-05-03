package com.library.bean;

import java.util.Date;

public class Read {
    private String read_id;
    private String password;
    private String sex;
    private String birth;
    private String address;
    private String phone;
    private int isBan;

    public String getReadId() {
        return read_id;
    }

    public void setReadId(String reader_id) {
        this.read_id = reader_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIsBan() {
        return isBan;
    }

    public void setIsBan(int isBan) {
        this.isBan = isBan;
    }

    @Override
    public String toString() {
        return "Read{" +
                "read_id='" + read_id + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", birth='" + birth + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", isBan=" + isBan +
                '}';
    }
}
