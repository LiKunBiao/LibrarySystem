package com.library.bean;

import java.io.Serializable;
import java.util.Date;

public class ReaderInfo implements Serializable {

    private String read_id;
    private String sex;
    private String birth;
    private String address;
    private String phone;

    public String getReadId() {
        return read_id;
    }

    public void setReadId(String read_id) {
        this.read_id = read_id;
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

    @Override
    public String toString() {
        return "ReaderInfo{" +
                "read_id='" + read_id + '\'' +
                ", sex='" + sex + '\'' +
                ", birth='" + birth + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
