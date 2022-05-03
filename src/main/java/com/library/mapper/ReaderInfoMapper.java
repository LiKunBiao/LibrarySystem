package com.library.mapper;

import com.library.bean.Read;
import com.library.bean.ReaderInfo;

import java.util.List;

public interface ReaderInfoMapper {

    //添加读者信息
    public int insertReader(Read read);

    //根据用户名查找读者信息
    public ReaderInfo selectReaderByReadId(String readId);

    //根据用户名修改读者信息
    public int reverseReader(ReaderInfo readerInfo);

    //读者管理，查找读者信息(包括密码，isBan)
    public List<Read> selectAllReader();

}
