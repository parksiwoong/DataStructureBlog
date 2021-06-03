package com.example.mybatisoraclesetting.blogs.test.service;
import com.example.mybatisoraclesetting.blogs.test.modelVo.UserVo;

import java.util.List;


public interface UserService {
    public List<UserVo> listAll() throws Exception;
}