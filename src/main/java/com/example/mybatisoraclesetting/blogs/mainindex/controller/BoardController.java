package com.example.mybatisoraclesetting.blogs.mainindex.controller;

import com.example.mybatisoraclesetting.blogs.mainindex.modelVo.BoardVo;
import com.example.mybatisoraclesetting.blogs.mainindex.modelVo.ForderVo;
import com.example.mybatisoraclesetting.blogs.mainindex.modelVo.GuestVo;
import com.example.mybatisoraclesetting.blogs.mainindex.service.impl.BoardServiceIpml;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

@Controller
@RequestMapping(value = "/home")
public class BoardController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource(name = "boardService")
    private BoardServiceIpml service;

    @RequestMapping(value = "/index")
    public String _mainView(HttpServletRequest request, @ModelAttribute("pageInfo") BoardVo boardVo, GuestVo guestVo,
                            ForderVo folderVo, ModelMap mv)throws SQLException, Exception {
        try{
            mv.addAttribute("flist", service.selectFolderList(folderVo));
           /* if(boardVo.getBbsSn() != null){
                boardVo.setPageMode("selectV");
            }*/
        }catch (Exception e){
            e.printStackTrace();
        }return "null";
    }

}

