package com.library.mapper;

import com.library.bean.BookInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookInfoMapper {

    //获取全部图书信息
    public List<BookInfo> getAllBooks();

    //添加图书
    public int insertBook(BookInfo bookInfo);

    //查找图书通过ID值
    public BookInfo selectBookByID(long id);

    //修改图书信息
    public int updateBook(BookInfo bookInfo);

    //删除图书信息
    public int deleteBook(long id);

    //查询图书信息
    public List<BookInfo> selectBooks(@Param("name") String name, @Param("author") String author);

    //借阅，图书减一
    public int sendBook(long id);

    //还书，图书加一
    public int returnBook(long id);
}
