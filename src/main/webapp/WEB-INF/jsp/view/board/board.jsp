<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<style>
    table{
        margin: 10px;
    }
    td {
        text-align: center;
        margin: 10px;
    }
    .next{margin-top:30px;  }
</style>
<%-- 메인 --%>
<div class="bonlon" style="background-color: #666666">
    <div class="new_list" style="border: 1px solid #dbdbdb;">
        <table class="table">
            <thead>
            <tr>
                <th>No</th>
                <th>title</th>
                <th>contents</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>Doe</td>
                <td>The .table class adds basic styling (light padding and horizontal divider</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Moe</td>
                <td>The .table class adds basic styling (light padding and horizontal divider</td>
            </tr>
            <tr>
                <td>3</td>
                <td>Dooley</td>
                <td>The .table class adds basic styling (light padding and horizontal divider</td>
            </tr>
            <tr>
                <td>4</td>
                <td>Dooley</td>
                <td>The .table class adds basic styling (light padding and horizontal divider</td>
            </tr>
            <tr>
                <td>5</td>
                <td>Dooley</td>
                <td>The .table class adds basic styling (light padding and horizontal divider</td>
            </tr>

            </tbody>
        </table>
        <div align="center" class="next" >
            <table cellspacing="0" cellpadding="0" align="center" border="0">
                <tbody>
                    <tr align="middle">
                        <td width="100"><img style="MARGIN: 0px 3px 2px 0px" src="/images/paging_arr_prev.gif"	align="absMiddle" border="0">
                            <span class="tb_font04">이전</span>
                        </td>
                        <td width="1" align="center" nowrap="" bgcolor="#cccccc"></td>
                        <td width="25" align="center" class="tb_font05"><b
                                style="color: white;">1</b></td>
                        <td width="1" align="center" nowrap="" bgcolor="#cccccc"></td>
                        <td width="100">
                            <span class="tb_font04">다음</span><img style="MARGIN: 0px 0px 2px 3px" src="/images/paging_arr_next.gif" align="absMiddle" border="0"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="detail" style="border: 1px solid #dbdbdb;">
        <table class="board_view">
            <caption>상세보기</caption>
                <colgroup>
                    <col width="15%">
                    <col width="35%">
                    <col width="15%">
                    <col width="*">
                </colgroup>
            <tbody>
            <tr>
                <th>제목</th>
                <td>${map.TITLE}</td>
                <th>조회수</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${map.CREA_ID }</td>
                <th>작성시간</th>
                <td>${map.CREA_DTM }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${map.CONTENTS }
                </td>
            </tr>
            </tbody>
        </table>
        <div style="display: flex;">
            <a href="#this" id="list" class="btn">목록으로</a>
            <a href="#this" id="modify" class="btn">수정하기</a>
        </div>

        <table class="board_view">
            <caption>상세보기</caption>
            <colgroup>
                <col width="15%">
                <col width="35%">
                <col width="15%">
                <col width="*">
            </colgroup>
            <tbody>
            <tr>
                <th>제목</th>
                <td>${map.TITLE}</td>
                <th>조회수</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${map.CREA_ID }</td>
                <th>작성시간</th>
                <td>${map.CREA_DTM }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${map.CONTENTS }
                </td>
            </tr>
            </tbody>
        </table> <table class="board_view">
        <caption>상세보기</caption>
        <colgroup>
            <col width="15%">
            <col width="35%">
            <col width="15%">
            <col width="*">
        </colgroup>
        <tbody>
        <tr>
            <th>제목</th>
            <td>${map.TITLE}</td>
            <th>조회수</th>
            <td>${map.HIT_CNT }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${map.CREA_ID }</td>
            <th>작성시간</th>
            <td>${map.CREA_DTM }</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3">
                ${map.CONTENTS }
            </td>
        </tr>
        </tbody>
    </table>

    </div>

    <!-- contentsMatching -->
    <div class="contentsMatching" style="background-color: #666666">

    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click",function(e){
            e.preventDefault();
            fn_openBoardList();
        })
        $("#modify").on("click",function(e){
            e.preventDefault();
            fn_openBoardModify();
        })
    })

    function fn_openBoardList(){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
        comSubmit.submit();
    }
    function fn_openBoardModify(){
        var idx = "${map.IDX}";
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/sample/openBoardModify.do'/>");
        comSubmit.addParam("IDX",idx);
        comSubmit.submit();
    }
</script>
