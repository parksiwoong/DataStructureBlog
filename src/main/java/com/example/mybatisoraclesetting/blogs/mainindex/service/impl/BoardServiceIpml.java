package com.example.mybatisoraclesetting.blogs.mainindex.service.impl;
import com.example.mybatisoraclesetting.blogs.mainindex.modelVo.ForderVo;
import com.example.mybatisoraclesetting.blogs.mainindex.service.BoardService;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service(value = "boardService")
public class BoardServiceIpml implements BoardService {

    @Override
    public List<ForderVo> selectFolderList(ForderVo forderVo) throws SQLException {
        return null;
    }
}

