<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>报废列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
<style>
a.examineGray{
	text-decoration:none;
	cursor:default;
	background:repeat-x;
	background-image:url(<%=basePath %>images/examine_bg_gray.jpg);
}
</style>
	</head>

	<body>

		<table class="title">
			<tr>
				<td>
					物料报废申报表
				</td>
			</tr>
		</table>
		<table class="list">

			<tr>
				<th width="15%" align="center">
					编号
				</th>
				<th width="15%" align="center">
					机型
				</th>
				<th width="10%" align="center">
					出废单位
				</th>
				<th width="10%" align="center">
					车间负责人
				</th>
				<th width="10%" align="center">
					日期
				</th>
				<th width="20%" align="center">
					状态
				</th>

			</tr>

			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<%--
                	<c:forEach items="${discardreviewfList }" var="discardreviewf">
				<c:forEach items="${discardreviewsList }" var="discardreviews">
				<c:forEach items="${discardreviewtList }" var="discardreviewt">
				--%>
				<c:forEach items="${pm.datas }" var="discardverify" varStatus="vs">


					<tr>
						<td>
							<div align="center">
								${discardverify.scr_id}
							</div>
						</td>
						<td>
							<div align="center">
								${discardverify.itemType.name}
							</div>
						</td>
						<td>
							<div align="center">
								${discardverify.fdpt.dptName}
							</div>
						</td>
						<td>
							<div align="center">
								${discardverify.emp_id.empName}

							</div>
						</td>
						<td>
							<div align="center">
								${discardverify.rdate}
							</div>
						</td>
						<td class="examine">
							<input type="hidden" value="${statusList[vs.index] }"
								name="status" />
							<a
								href="produce/discardverify/discardverify_inputf?discardverifyId=${discardverify.scr_id}"><span>品工部审核</span>
							</a>&rarr;
							<a
								href="produce/discardverify/discardverify_inputs?discardverifyId=${discardverify.scr_id}"><span>工艺审核
							</span> </a>
							<c:choose>
							<c:when  test="${discardverify.discardreviews.flag==1}">
							
							&rarr;
							<a
								href="produce/discardverify/discardverify_inputt?discardverifyId=${discardverify.scr_id}"><span>分管领导审核</span>
							</a>
							</c:when>
							</c:choose>
						</td>

					</tr>
				</c:forEach>
				<%--
				</c:forEach>
				</c:forEach>
				</c:forEach>
			--%>
			</c:if>
		</table>
		<!----------------------LOOP END------------------------------->
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
		<c:if test="${empty pm.datas}">
			<table>
				<tr>
					<td>
						没有找到相应的记录
					</td>
				</tr>
			</table>
		</c:if>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }">尾页</a>
						</pg:last>
					</pg:pager>
					&nbsp;&nbsp;
				</th>
				<!-- 更改pagesize 开始-->
				<th align=left valign="middle" noWrap width="10%">
					<div style="height: 20px; overflow: hidden; valign: middle">
						<form
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

							<select name="pagesize" onchange="this.form.submit()"
								style="height: 16px; overflow: hidden; valign: middle">
								<c:forEach begin="1" end="50" step="3" var="i">
									<option value="${i}"
										<c:if test="${pagesize eq i }">selected</c:if>>
										${i}
									</option>
								</c:forEach>
							</select>
							行/页
						</form>
					</div>

				</th>
			</tr>
		</table>
	</body>
</html>