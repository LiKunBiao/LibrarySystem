package com.library.mapper;

import com.library.bean.Admin;
import com.library.bean.Read;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

public interface AdminMapper {
    //根据账号和密码得到用户ID
    public Admin getStateCode(@Param("username") String username, @Param("password") String password);

    //添加用户
    public int insertReader(Read read);

    //重置密码
    public int resetPassword(@Param("oldPassword") String oldPassword, @Param("newPassword") String newPassword, @Param("username") String username);

    //更新isBan
    public int updateIsBan(@Param("username") String username, @Param("isBan") int isBan);
}
