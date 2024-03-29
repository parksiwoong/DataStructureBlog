package com.example.mybatisoraclesetting.blogs.mainindex.modelVo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
public class BoardVo {
    private String bbsSn; 	//	게시판 정보
    private String userSn; 	// 	유저 순번
    private String folderSn;//	폴더 순번
    private String bbsTt; 	// 	제목
    private String bbsCn; 	// 	내용
    private String bbsDt;	// 	등록일
    private String bbsIn;	// 	조회수

    private String userId;
    private String userPw;
    private String userNm;
    private String userAtr;
    private Date userDt;
}

