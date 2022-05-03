package com.library.bean;

public class LendLog {
    private long book_id;
    private String name;
    private String author;
    private String read_id;
    private String lend_date;
    private String back_date;

    public long getBookId() {
        return book_id;
    }

    public void setBookId(long book_id) {
        this.book_id = book_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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

    @Override
    public String toString() {
        return "LendLog{" +
                "name=" + name +
                ", author='" + author + '\'' +
                ", read_id='" + read_id + '\'' +
                ", lend_date='" + lend_date + '\'' +
                ", back_date='" + back_date + '\'' +
                '}';
    }
}
