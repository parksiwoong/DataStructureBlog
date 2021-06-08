package com.example.mybatisoraclesetting.blogs.util.modelVo;

import lombok.Data;

@Data
public class PageVo {
    // 페이징 처리를 위한 bean 생성.

    private static final int DEFAULT_SIZE = 10;
    private static final int DEFAULT_MAX_SIZE = 50;

    private int page;
    private int size;

    private String keyword;
    private String type;

    public void setPage(int page) {
        this.page = page <0 ? 1 : page;
    }
    public void setSize(int size) {
        this.size = size < DEFAULT_SIZE || size > DEFAULT_MAX_SIZE ? DEFAULT_SIZE : size;
    }
//    public Pageable makePageable(int direction, String...props) {
//        Sort.Direction dir = direction == 0 ? Sort.Direction.DESC :
//                SpringDataWebProperties.Sort.Direction.ASC;
//
//        return PageRequest.of(this.page-1, this.size, dir, props);
//    }
}
