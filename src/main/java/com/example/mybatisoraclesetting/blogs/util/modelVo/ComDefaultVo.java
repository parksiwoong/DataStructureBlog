package com.example.mybatisoraclesetting.blogs.util.modelVo;

import javafx.scene.control.Pagination;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

@Data
public class ComDefaultVo implements Serializable {

    private String alUserSn;
    private String cardUid;
    private String ccmSeCd;

    private String userSn;
    private String userId;
    private String userNm;
    private String authorCode;

    private String searchCondition;
    private String searchKeyword;
    private String searchBgnde;
    private String searchEndde;
    private String searchUseYn;

    private String message;

    private String useYn;
    private String frstRgstId;
    private String frstRgstDt;
    private String lastUpdusrId;
    private String lastUpdtDt;

    private String refrnSn;
    private String atchFileCd;
    private List<MultipartFile> files;


    private String pageMode;
    private int pageUnit = 5;
    private int pageIndex = 1;
    private int firstIndex = 1;
    private int lastIndex = 1;

    private Pagination paginationInfo;

    public void initPaginationInfo(int totalCnt) {
        pageUnit = 5;

//        paginationInfo = new Pagination();
//        paginationInfo.setCurrentPageIndex(pageIndex);
//        paginationInfo.setRecordCountPerPage(pageUnit);
//        paginationInfo.setPageSize(10);
//        paginationInfo.setTotalRecordCount(totalCnt);
//
//        firstIndex = paginationInfo.getFirstRecordIndex();
//        lastIndex = paginationInfo.getLastRecordIndex();
    }

    public int getOffset() {
        return (pageIndex * pageUnit - pageUnit);
    }

//	public String getLoginUserId() {
//		return UserDetailHelper.getUserDetailVo().getUserId();
//	}
//
//	public String getLoginUserNm() {
//		return UserDetailHelper.getUserDetailVo().getUserNm();
//	}


}
