package com.library.service;

import com.github.pagehelper.PageHelper;
import com.library.bean.BookInfo;
import com.library.bean.LendLog;
import com.library.bean.Read;
import com.library.mapper.AdminMapper;
import com.library.mapper.BookInfoMapper;
import com.library.mapper.LendInfoMapper;
import com.library.mapper.ReaderInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService<updateIsBanTo1> {

    @Autowired
    private BookInfoMapper bookInfoMapper;

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private ReaderInfoMapper readerInfoMapper;

    @Autowired
    private LendInfoMapper lendInfoMapper;

    //查找全部图书
    public List<BookInfo> getAllBooks(int page, int size) {

        PageHelper.startPage(page, size);
        return bookInfoMapper.getAllBooks();
    }

    //添加功能
    public int addBook(BookInfo bookInfo) {
        return bookInfoMapper.insertBook(bookInfo);
    }

    //通过ID值查找图书
    public BookInfo selectBookByID(long id) {
        return bookInfoMapper.selectBookByID(id);
    }

    //修改图书信息
    public int updateBook(BookInfo bookInfo) {
        return bookInfoMapper.updateBook(bookInfo);
    }

    //删除图书
    public int deleteBook(long id) {
        return bookInfoMapper.deleteBook(id);
    }

    //删除选中图书
    public void deleteSelectedbooks(String[] ids) {
        for(int i = 0; i < ids.length; i++) {
            bookInfoMapper.deleteBook(Long.parseLong(ids[i]));
        }
    }

    //查询图书
    public List<BookInfo> selectBooks(String name, String author, int page, int size) {
        PageHelper.startPage(page, size);
        return bookInfoMapper.selectBooks(name, author);
    }

    //重置密码
    public int resetPassword(String oldPassword, String newPassword, String username){
        return adminMapper.resetPassword(oldPassword, newPassword, username);
    }

    //读者管理，查找读者信息(包括密码，isBan)
    public List<Read> selectAllReader() {
        return readerInfoMapper.selectAllReader();
    }

    //读者管理，更新isBan
    public int updateIsBan(String username, int isBan) {
        if(isBan == 0)
            isBan = 1;
        else
            isBan = 0;
        return adminMapper.updateIsBan(username, isBan);
    }
}
