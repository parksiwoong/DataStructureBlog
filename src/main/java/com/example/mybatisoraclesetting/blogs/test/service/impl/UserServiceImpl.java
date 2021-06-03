package com.example.mybatisoraclesetting.blogs.test.service.impl;


import com.example.mybatisoraclesetting.blogs.test.mapperDao.UserDao;
import com.example.mybatisoraclesetting.blogs.test.modelVo.UserVo;
import com.example.mybatisoraclesetting.blogs.test.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService {

    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public List<UserVo> listAll() throws Exception{
        return userDao.listAll();
    }
}
