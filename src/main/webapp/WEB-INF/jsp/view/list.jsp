<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List View</title>
</head>
<body>

	<div>
		<H1>DB 연동 확인</H1>
		<table border="1">
			<thead>
				<tr>
					<th>userCode</th>
					<th>userName</th>
				</tr>
			</thead>
			<tbody>

						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

</body>
</html>