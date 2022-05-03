package com.library.service;

import com.library.bean.LendInfo;
import com.library.bean.LendLog;
import com.library.bean.ReaderInfo;
import com.library.mapper.AdminMapper;
import com.library.mapper.BookInfoMapper;
import com.library.mapper.LendInfoMapper;
import com.library.mapper.ReaderInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReaderService {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private BookInfoMapper bookInfoMapper;

    @Autowired
    private ReaderInfoMapper readerInfoMapper;

    @Autowired
    private LendInfoMapper lendInfoMapper;

    //根据用户名查找读者信息
    public ReaderInfo selectReaderByReadId(String readId) {
        return readerInfoMapper.selectReaderByReadId(readId);
    }

    //根据用户名修改读者信息
    public int reverseReader(ReaderInfo readerInfo) {
        return readerInfoMapper.reverseReader(readerInfo);
    }

    //借书，插入
    public int lendBook(LendInfo lendInfo) {
        bookInfoMapper.sendBook(lendInfo.getBookId());
        return lendInfoMapper.lendBook(lendInfo);
    }

    //查找全部借书信息
    public List<LendInfo> allLends(String readId) {
        return lendInfoMapper.allLends(readId);
    }

    //还书，更新
    public int returnBook(LendInfo lendInfo) {
        bookInfoMapper.returnBook(lendInfo.getBookId());
        return lendInfoMapper.returnBook(lendInfo);
    }

    //个人借书日志
    public List<LendLog> lendBookLog(String readId) {
        return lendInfoMapper.lendBookLog(readId);
    }

}
