package com.example.mybatisoraclesetting.blogs.test.mapperDao;
import com.example.mybatisoraclesetting.blogs.test.modelVo.UserVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserDao {
    public List<UserVo> listAll() throws Exception ;
}
