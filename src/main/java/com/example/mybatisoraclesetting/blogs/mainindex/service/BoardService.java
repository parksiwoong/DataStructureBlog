package com.example.mybatisoraclesetting.blogs.mainindex.service;

import com.example.mybatisoraclesetting.blogs.mainindex.modelVo.ForderVo;

import java.sql.SQLException;
import java.util.List;

public interface BoardService {
    public List<ForderVo> selectFolderList(ForderVo forderVo)throws SQLException;
}

