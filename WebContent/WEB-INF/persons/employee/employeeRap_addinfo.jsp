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
<base href="<%=basePath%>">  
 <title>员工奖惩情况</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/admin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/vip.css" type="text/css"/>
    <script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
    <link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
	<script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
    <script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
      <script language="javascript" src="<%=basePath %>js/addTableAlign.js">  </script>
      <script language="javascript" src="js/public.js"></script>
</head>



	<body>
		<form method="post" action="persons/employee/employee_rapadd">
			<table class="title addTable">
				<tr>
					<td>
						员 工 奖 惩 情 况
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						员工姓名
					</td>
					<td>
						<input Id="employeeNameId_0" type="text" disabled="disabled"
							value="" align="left"  class="selectin"/><font color="#FF0000">*</font>
						<input type="hidden" id="employeeIdId_0" name="employeeId" />
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, '1');return false"/>
					</td>
				</tr>

				<tr>
					<td>
						奖惩情况
					</td>
					<td>
						<input align="left" type="text" name="employeeRap.rapName"
							value=""  id="employeeRaprapName" class="checkEmptyShowInfo"/><font color="#FF0000">*</font>
							
					</td>
				</tr>
				<tr>
					<td>
						奖惩时间
					</td>
					<td>
						<input id="d2442" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441',skin:'whyGreen'})" />
                            <font color="#FF0000">*</font>
						<input type="hidden" id="d2441" name="employeeRap.rapDate" class="checkDateInfo"/>
					</td>
				</tr>

				<tr>
					<td>
						奖惩原因
					</td>
					<td>
						<textarea cols="50" rows="3" name="employeeRap.rapReason" class="itemname" class="itemname"></textarea>
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="submit" value="提交" class="frm_btn" id="SYS_SET"/>
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>

</html>
