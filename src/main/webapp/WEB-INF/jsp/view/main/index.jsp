<%-- <%@include file="top.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>



		<script>

		  	/**********************************************************
		  	* 검색
		  	**********************************************************/
		 	function fn_search(pageNo){
		 		$("#pageIndex").val(pageNo);
		 		fn_postSubmit("form", "${contextPath }/home/index.do");
		 	}
		</script>
	<!-- 최신리스트 -->
	
	<p class="count-result" style=" color: white;">전체 <span class="text-danger">${pageInfo.paginationInfo.totalRecordCount}</span>건 (페이지 <span class="text-danger">${pageInfo.pageIndex}/${pageInfo.paginationInfo.lastPageNo}</span>)</p>
	<div class="new_list">
		<div class="new_list" style="border: 1px solid #dbdbdb;">
			<table class="table" style="width: 100%; color: white; table-layout:fixed;">
				<colgroup>
					<col style="width:35px;">
					<col style="width:200px;">
					<col style="width:60%;">
					<col style="width:150px;">
				</colgroup>
				<thead>
				<tr>
					<th>No</th>
					<th>title</th>
					<th>contents</th>
					<th>Date</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${blist}">
					<c:if test="${!empty board.bbsSn }">
						<tr>
							<td style="width: 40px; text-align: center;">${board.itemNo }</td>
							<td style="width: 140px; text-align: center;">${board.bbsTt }</td>
							<td style="display: inline-block; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a href="#" onclick="fn_openBbs('${board.bbsSn }');">${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(board.bbsCn, "&lt;", "<"), "&gt;", ">"), "&amp;", "&"), "&apos;", "'"), "&quot;", '"'), newLineChar, "<br/>") }</a></td>
							<td style="width: 140px; text-align: center;">${board.bbsDt }</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty blist || pageInfo.paginationInfo.totalRecordCount == '0'}">
					<tr class="result-none" style="text-align: center;">
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:if>

				</tbody>
 			</table>
			<div align="center" class="next">
<!--				<table cellspacing="0" cellpadding="0" align="center" border="0">
					<tbody>
					<tr align="middle">
						<td width="100"><span class="tb_font04">이전</span></td>
						<td width="1" align="center" nowrap="" bgcolor="#cccccc"></td>
						<td width="25" align="center" class="tb_font05"> -->
							<b style="color: white;">
								<ul align="center"><ui:pagination paginationInfo="${pageInfo.paginationInfo}" type="text" jsFunction="fn_search" /></ul>
							</b>
<!-- 						</td>
						<td width="1" align="center" nowrap="" bgcolor="#cccccc"></td>
						<td width="100"><span class="tb_font04">다음</span></td>
					</tr>
					</tbody>
				</table> -->
			</div>
		</div>
	</div>
	<%-- 상세보기 --%>
	<div class="guest_book">	
		<form id="guest" method="post" class="detail_list" >
				<c:forEach var="board" items="${blist2}">
					<c:if test="${!empty board.bbsSn }">
					<div class="container_re col-md-6">
						 <div class="card">
								 <div class="card-body_left">
						            <h6 class="card-subtitle text-muted mb-4">
						                <i class="far fa-user"></i> ${detail.CREA_ID }  
						                <i class="far fa-clock"> </i> ${board.bbsDt }
						                <i class="fas fa-align-justify"></i> ${detail.HIT_CNT } 
						            </h6>
						            <p class="card-text">${detail.CONTENTS }</p>
						        </div>
						        <div class="card-body">
						            <h4 class="card-title mb-3">${board.bbsTt  }</h4>
					            </div>
					            <c:choose>
									<c:when test="${loginUserNm == null}">
						                <div class="card-body_re"></div>
									</c:when>
									<c:otherwise>
						                <div class="card-body_re">
								            <a href="#" class="btn btn-outline-secondary btn-sm" role="button">수정</a>
								            <a href="#" class="btn btn-outline-secondary btn-sm " role="button">삭제</a>
								        </div>
									</c:otherwise> 
								</c:choose>
						        
				         </div>
				         <div class="board_context" style="width: 100%; overflow:hidden; word-break:break-all;">
					         ${fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(fn:replace(board.bbsCn, "&lt;", "<"), "&gt;", ">"), "&amp;", "&"), "&apos;", "'"), "&quot;", '"'), newLineChar, "<br/>") }
				        </div>
					</div>
					</c:if>
				</c:forEach>
		</form>
	</div>


<%-- <%@include file="bttom.jsp"%> --%>
