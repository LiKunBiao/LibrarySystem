package com.library.bean;

import java.io.Serializable;
import java.util.Date;

public class LendInfo implements Serializable {

    private long ser_num;
    private long book_id;
    private String read_id;
    private String lend_date;
    private String back_date;

    public long getSerNum() {
        return ser_num;
    }

    public void setSerNum(long ser_num) {
        this.ser_num = ser_num;
    }

    public long getBookId() {
        return book_id;
    }

    public void setBookId(long book_id) {
        this.book_id = book_id;
    }

    public String getReadId() {
        return read_id;
    }

    public void setReadId(String read_id) {
        this.read_id = read_id;
    }

    public String getLendDate() {
        return lend_date;
    }

    public void setLendDate(String lend_date) {
        this.lend_date = lend_date;
    }

    public String getBackDate() {
        return back_date;
    }

    public void setBackDate(String back_date) {
        this.back_date = back_date;
    }
}
