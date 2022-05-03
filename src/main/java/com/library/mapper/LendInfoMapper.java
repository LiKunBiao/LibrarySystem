package com.library.mapper;

import com.library.bean.LendInfo;
import com.library.bean.LendLog;

import java.util.List;

public interface LendInfoMapper {

    //借书
    public int lendBook(LendInfo lendInfo);

    //查找全部借书信息
    public List<LendInfo> allLends(String readId);

    //还书
    public int returnBook(LendInfo lendInfo);

    //个人借书日志
    public List<LendLog> lendBookLog(String readId);

}
