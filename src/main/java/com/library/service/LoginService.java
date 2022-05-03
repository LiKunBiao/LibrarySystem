package com.library.service;

import com.library.bean.Admin;
import com.library.bean.Read;
import com.library.mapper.AdminMapper;
import com.library.mapper.ReaderInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
//既可以根据类型注入，也可以根据名称注入
import javax.annotation.Resource;

@Service
@Transactional
public class LoginService {
    //配置对象属性，根据属性类型进行自动装配
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private ReaderInfoMapper readerInfoMapper;

    public Admin loginCheck(String username, String password)
    {
        return adminMapper.getStateCode(username, password);
    }

    public int registerCheck(Read read) {
        int stateCode = adminMapper.insertReader(read);
        System.out.println("stateCode:" + stateCode);
        if(stateCode == 1) {
            readerInfoMapper.insertReader(read);
        }
        return stateCode;
    }
}
