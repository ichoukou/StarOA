<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>"/>
		<title>查询</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css"/>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
        <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td style="text-align: right">
					<form action="persons/Recruitment/recruitment_ysearch"
						method="post">
						制定时间:
						<input size="18" id="d2442" type="text" class="Wdate"
								onFocus="WdatePicker({dateFmt:'yyyy',vel:'2',skin:'whyGreen'})" />
							<input type="hidden" id="2" name="yrecruitment.recruitmentName" value="${yrecruitment.recruitmentName}" size="18"/>
						&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />
                         <input type="button" value="添加年度招聘计划"
							onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_yaddInput','添加年度招聘计划',1077,607,'1');return false"
							class="frm_btn">
				  </form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					年度招聘计划表
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					表名
				</th>
				<th>
					制订时间
				</th>
				<th>
					编辑
				</th>
				<th>
					删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="yrecruitment">

					<tr>


						<td >
							<div align="center">
								<a href="#"
									onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_show?yrecruitmentId=${yrecruitment.id}','人力资源需求计划表',1077,607,'1');return false">

									人力资源需求表 </a>
							</div>
						</td>
						<td >
							<div align="center">
								<fmt:formatDate value="${yrecruitment.recruitmentName}" pattern="yyyy年" />
							</div>
							<div align="center"></div>
						</td>
						<td>
							<div align="center">
								<s:property value="note" />
								<a href="#"
									onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_yeditedInput?yrecruitmentId=${yrecruitment.id}','添加人员信息',1077,607,'1');return false">
									<img src="<%=basePath%>images/edit.gif" width="15" height="16"
										border="0"> </a>

							</div>
						</td>
						<td >
							<div align="center">
								<a href="#"
									onclick="del('<%=basePath%>persons/Recruitment/recruitment_ydel?yrecruitmentId=${yrecruitment.id}');return false"><img
										src="images/del.gif" width="15" height="16" border="0">
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=
	this.bgColor = '#DEE7FF';
onmouseout=
	this.bgColor = '#EFF3F7';
;>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->

		</table>       
<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
							<tr height=28px valign="middle">
								<th align=right noWrap>
									<pg:pager
										url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
										items="${pm.total}" maxPageItems="${pagesize}"
										export="currentPageNumber=pageNumber">
										<pg:param name="yrecruitment.recruitmentName" />
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

											<input type="hidden" name="yrecruitment.recruitmentName"
											value="${yrecruitment.recruitmentName}" />
											<select name="pagesize" onChange="this.form.submit()"
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
					</table>
					<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>        
	</body>
</html>