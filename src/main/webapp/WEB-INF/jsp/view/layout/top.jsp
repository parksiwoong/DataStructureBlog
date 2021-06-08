<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.slf4j.Logger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>Nav bar</title>

    <!-- css -->
    <style type="text/css">
        .m_indent{ position: absolute; left: .06em; }
        .indent{ padding-left: .15em }
        .o_indent{ position: absolute; left: 1.3em; }
    </style>
    <%-- <link href="${pageContext.request.contextPath}/assets/css/main/default.css" rel="stylesheet" type="text/css"/> --%>
    <link href="${pageContext.request.contextPath}/assets/css/main/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/assets/css/main/board.css" rel="stylesheet" type="text/css"/>
    <%-- <link href="${pageContext.request.contextPath}/assets/css/main/detail.css" rel="stylesheet" type="text/css"/> --%>

    <link rel = "preconnect" href = "https://fonts.gstatic.com">
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <!-- 반응형? -->
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/user.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/board.js"></script>
    <script defer src="${pageContext.request.contextPath}/assets/js/common.js"></script>
    <script>
        $(document).ready(function() {
            $("#btnLogin").click(function() {
                // 태크.val() : 태그에 입력된 값
                // xozm.val("값") :태그의 값을 변경
                let userId = $("#userId").val();
                let userPw = $("#userPw").val();
                if (userId == "") {
                    alert("아이디를 입력하세요");
                    $("#userId").focus(); //입력포커스 이동
                    return;
                }
                if (userPw == "") {
                    alert("비밀번호를 입력하세요.");
                    $("#userPw").focus();
                    return;
                }
                document.form1.action = "/home/login.do"
                //제출
                document.form1.submit();
            });
            //	alert('${msg}');
        });

        /**********************************************************
         * 버튼 클릭 리스너
         **********************************************************/
        $(document).on('click', 'button', function(){
            switch($(this).attr("id")){
                /**********************************************************
                 * 검색버튼
                 **********************************************************/
                case 'btnSearch':
                    fn_search("1");
                    break;
            }
        });

        /**********************************************************
         * 검색
         **********************************************************/
        function fn_search(pageNo){
            $("#pageIndex").val(pageNo);
            fn_postSubmit("form", "${pageContext.request.contextPath }/home/index.do");
        }

        /*****************************************************
         * 폴더 열고 닫기
         ****************************************************/
        function fn_openFd(folderSn) {
            /* display: toggle */
            $('#c_'+folderSn).toggle();
            $('#'+folderSn).find($(".indent")).toggle();
        }

        /*****************************************************
         * 글 상세보기
         ****************************************************/
        function fn_openBbs(bbsSn) {
            console.log(bbsSn);
            $("#bbsSn").val(bbsSn);
            fn_postSubmit("folder", "${pageContext.request.contextPath }/home/index.do");
        }


    </script>

</head>
<!-- begin::Body -->
<body>
<nav class="navbar">
    <div class="navbar_logo">
        <a><img style="width: 90px" src="${pageContext.request.contextPath}/assets/images/main/new_logo.png">Brother</a>
    </div>
    <ul class="navbar_menu">
        <li><a href="${pageContext.request.contextPath }/home/index.do">home</a></li>
        <li><a href="${pageContext.request.contextPath }/home/guest.do">guest</a></li>
        <li><a href="${pageContext.request.contextPath }/home/boardWrite.do">Board</a></li>
        <c:choose>
            <c:when test="${loginUserNm == null}">
                <li><a href="#" class="open" id="open_login">login</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="/home/logout.do" class="open" id="open_logout">logout</a></li>
                <li style="color: white;"><%= session.getAttribute("loginUserNm") %>님 반갑습니다.</li>
            </c:otherwise>
        </c:choose>
    </ul>

    <div class="navbar_icons">
        <form id="form" method="post" class="navbar_icons">
            <%--@declare id="header_search_query"--%>
            <input type="hidden" id="pageIndex" name="pageIndex" value="${pageInfo.pageIndex}" />
            <input type="hidden" id="pageMode" name="pageMode"/>
            <label for="header_search_query" class="sr-only">SearchWords:</label>
            <input id="searchKeyword" type="text"
                name="searchKeyword" value="${pageInfo.searchKeyword}" placeholder="Search Words..."
                class="input-reset color-inherit input-focus all-animate br-pill ph4 sans-serif fw6 header-search-input ba bw1 bg-white-10 b--transparent">
        </form>
        <button type="button" id="btnSearch" name="btnSearch">
            <li><i class="fas fa-search fa-lg"></i></li>
        </button>
    </div>
        <a href="#" class="navbar_toogleBtn">
            <input id="header_search" type="search" name="header_search_query" value="" placeholder="Search icons..."
                class="input-reset color-inherit input-focus all-animate br-pill ph4 sans-serif header-search-input ba bw1 bg-gray1 b--gray1">
            <i class="fas fa-bars"></i>
        </a>
</nav>
<form>
    <div class="popup" id="SignUp">
        <h2>회원가입</h2>
        <div class="con">
            <table class="type1">
                <colgroup>
                    <col style="width: 111px">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th><label for="txt2_1">아이디</label><span>*<em
                            class="hide">필수입력</em></span></th>
                    <td><input type="text" id="txt2_1"
                               placeholder="이름을 입력해 주세요."></td>
                </tr>
                <tr>
                    <th><label for="txt2_2">비밀번호</label><span>*<em
                            class="hide">필수입력</em></span></th>
                    <td><input type="tel" id="txt2_2" placeholder="쉽게 입력해주세요."></td>
                </tr>
                <tr>
                    <th><label for="txt2_3">비밀번호재입력</label><span>*<em
                            class="hide">필수입력</em></span></th>
                    <td><input type="tel" id="txt2_3" placeholder="쉽게 입력해주세요."></td>
                </tr>
                <tr>
                    <th><label for="txt2_4">성함</label><span>*<em
                            class="hide">필수입력</em></span></th>
                    <td><input type="tel" id="txt2_4" placeholder="성함을 입력해주세요."></td>
                </tr>

                </tbody>
            </table>
            <div class="agree">
                <label>간편회원가입</label> <a href="#a">카카오</a><a href="#a">네이버</a><a
                    href="#a">구글</a>
            </div>
            <div class="agree">
                <input type="checkbox" id="chk1_5"><label for="chk1_5"><span>[필수]</span>개인정보
                수집 및 이용 동의</label> <a href="#a" class="view">전문보기</a>
            </div>
        </div>
        <div class="txt_center">
            <a href="#a" class="btn_type1">회원가입</a>
        </div>
        <a href="#a" class="close">닫기</a>
    </div>
    <div class="dim"></div>
</form>

<form name="form1" method="post">
    <div class="popup" id="login">
        <h2>로그인</h2>
            <div class="con">
                <table class="type1">
                        <colgroup>
                            <col style="width: 111px">
                            <col>
                        </colgroup>
                    <tbody>
                        <tr>
                            <th><label for="userId">아이디</label><span>*<em
                                    class="hide">필수입력</em></span></th>
                            <td><input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요"></td>
                        </tr>
                        <tr>
                            <th><label for="userPw">비밀번호</label><span>*<em
                                    class="hide">필수입력</em></span></th>
                            <td><input type="password" id="userPw"name="userPw" placeholder="비밀번호를 입력해주세요."></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <div class="txt_center">
            <button type="button" class="btn_type1" id="btnLogin">로그인</button>
            <a href="#a" class="btn_type1" id="open_SignUp">회원가입</a>
        </div>
        <a href="#a" class="close">닫기</a>
    </div>
    <div class="dim"></div>
</form>

<div class="container">
    <%-- 사이드메뉴 --%>
    <div class="side"><!--  style="background-color: #666666" -->
        <div style="line-height: 100%">
            <a class="indent">Category</a>
            <form id="folder" method="post">
                <input type="hidden" id="bbsSn" name="bbsSn"/>
                <a class="indent"><img src="${pageContext.request.contextPath }/assets/images/folder/tab_top.gif"></a></br>
                <c:set var="preFd" value="0"/>
                <c:set var="bbsEndChk" value="N"/>
                <c:forEach var="folder" items="${flist}" varStatus="status">
                    <tr>
                        <td>
                            <c:if test="${empty folder.bbsTt }">
                            <c:if test="${preFd != '0'}">
                                </span>
                            </c:if>
                            <c:set var="bbsEndChk" value="N"/>
                            <c:set var="preFd" value="${folder.folderSn }"/>
                            <a id="${folder.folderSn }" href="#" onclick="fn_openFd('${folder.folderSn }');">

								<span class="indent" >
								<c:if test="${!status.last}"><img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_active.gif"></c:if>
								<c:if test="${status.last}"><img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_noactive_end.gif"></c:if>
								</span>
                                <span class="m_indent indent" >
								<img src="${pageContext.request.contextPath }/assets/images/folder/tab_closed.gif">
                                        ${folder.folderNm}</span>

                                <span class="indent" style="display: none;">
								<c:if test="${!status.last}"><img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_active.gif"></c:if>
								<c:if test="${status.last}"><img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_noactive_end.gif"></c:if>
								</span>
                                <span class="m_indent indent" style="display: none;">
								<img src="${pageContext.request.contextPath }/assets/images/folder/tab_opened.gif">${folder.folderNm}</span>
                            </a></br>

                            <span id="c_${folder.folderSn }" style="display: none;">
							</c:if>
							<c:if test="${!empty folder.bbsTt }">
                                <c:if test="${preFd != flist[status.index + 1].folderSn }">
                                    <c:set var="bbsEndChk" value="Y"/>
                                </c:if>
                                <a id="b_${folder.bbsSn }" href="#" onclick="fn_openBbs('${folder.bbsSn }');">
								<span class="indent">
								<img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_active.gif">
								</span>
								<span class="o_indent">
								<c:if test="${bbsEndChk != 'Y' }">
                                    <img src="${pageContext.request.contextPath }/assets/images/folder/tab_treed.gif">
                                </c:if>
								<c:if test="${bbsEndChk == 'Y' }">
                                    <img src="${pageContext.request.contextPath }/assets/images/folder/tab_treed_end.gif">
                                </c:if>
								${folder.bbsTt}
								</span>
								</a></br>
                            </c:if>


						<%-- 	<c:if test="${!empty folder.upperFd }">
								<a id="fdsubid${folder.no }" class="indent"><img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_active.gif"></a><a class="o_indent" href="#"><img src="${pageContext.request.contextPath }/assets/images/folder/tab_closed.gif">${folder.folderNm}</a></br>
							</c:if> --%>
						<%-- </c:if> --%>
						<c:if test="${status.last}">
						</span>
                                <%-- 	<span id="fdsubid${folder.no }" ><a class="indent">
                                <img src="${pageContext.request.contextPath }/assets/images/folder/navi_back_noactive_end.gif"></a>
                                <a class="m_indent indent" href="#">
                                <img src="${pageContext.request.contextPath }/assets/images/folder/tab_closed.gif">${folder.folderNm}</a>
                                </br></span> --%>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </form>
        </div>
        <!-- 달력 -->
        <!-- 	<div class="diary">
                달력
            </div> -->
    </div>

    <%-- 메인 --%>
    <div class="bonlon" >