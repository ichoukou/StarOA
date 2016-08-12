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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>样品认定申请报告单</title>
    <link type="text/css" href="css/vip.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/box_onfocus.css" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/public.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
  </head>
  <body>
    <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

    </table>
    <form action="purchase/samidentified/samidentified_update" method="post">
    <input type="hidden" value="${samidentified.id}" name="samidentified.id">
      <table class="title">
        <tr>
          <td>样品认定申请报告单 </td>
        </tr>
        </table>
        <table class="addTable" style="width: 100%">
        <tr>
           <td style="width: 15%">申请单位：</td>
           <td>
               <input type="text" value="${samidentified.department.dptName}" disabled="disabled"/>
               <input type="hidden" value="${samidentified.department.id}" name="departmentId"/>
           </td>
           <td>经办人：</td>
           <td class="tdleft">
               <input type="text" value="${samidentified.hangding.empName}" disabled="disabled" />
               <input type="hidden" value="${samidentified.hangding.empId}" name="samidentified.hangding.empId"/>
           </td>
        </tr>
        <tr align="center">
            <td style="width: 15%">负责人：</td>
            <td>
               <input type="text" value="${samidentified.resper.empName}" disabled="disabled"/>
               <input type="hidden" value="${samidentified.resper.empId}" name="samidentified.resper.empId"/>
            </td>
            <td>时间：</td>
            <td>
            <input type="text" value="${samidentified.samdate}" disabled="disabled" />
                     <input type="hidden"  value="${samidentified.samdate}" name="samidentified.samdate" />
            </td>
        </tr>
      </table>
      <table class="addTable" style="width: 100%">
        <tr>
          <th>申请内容 </th>
        </tr>
      </table>
      <table class="addTable" style="width: 100%">
        <tr>
        <td> 供方名称：
            <input type="text" id="supplierinfoSupcnameId"  value="${samidentified.supplierinfo.supcname}" disabled="disabled" />
            <input type="hidden" name="supplierinfoId" id="supplierinfoIdId" value="${samidentified.supplierinfo.id}"/>
        </td>
        <td style="width: 30%; text-align:center" >
          第
          <input type="text" value="${samidentified.reqtime}" disabled="disabled" size="5" />
          <input type="hidden" value="${samidentified.reqtime}" name="samidentified.reqtime" size="5" />
          次申请 </td><td align="left" colspan="25%">希望
          <input type="text" value="${samidentified.wantdate}" disabled="disabled" />
          <input type="hidden"  value="${samidentified.wantdate}" name="samidentified.wantdate" />
          前完成 </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:left"> 属性：
          <c:if test="${!empty samidentified.newitem}">
          <input type="checkbox"  name="newitem" checked disabled="disabled"/>
          <input type="hidden" name="newitem" value=1/></c:if>
          <c:if test="${empty samidentified.newitem}">
          <input type="checkbox"  name="newitem" disabled="disabled"/></c:if>
          新产品
          <c:if test="${!empty samidentified.newsup}">
          <input type="checkbox"  name="newsup" checked disabled="disabled"/>
          <input type="hidden" name="newsup" value=1/></c:if>
          <c:if test="${empty samidentified.newsup}">
          <input type="checkbox"  name="newsup" disabled="disabled"/></c:if>
          新供方
          <c:if test="${!empty samidentified.techchange}">
          <input type="checkbox"  name="techchange" checked disabled="disabled"/>
          <input type="hidden" name="techchange" value=1/></c:if>
          <c:if test="${empty samidentified.techchange}">
          <input type="checkbox"  name="techchange" disabled="disabled"/></c:if>
          技术变更
          <c:if test="${!empty samidentified.redcost}">
          <input type="checkbox"  name="redcost" checked disabled="disabled"/>
          <input type="hidden" name="redcost" value=1/></c:if>
          <c:if test="${empty samidentified.redcost}">
          <input type="checkbox"  name="redcost" disabled="disabled"/></c:if>
          降低成本
          <c:if test="${!empty samidentified.entest}">
          <input type="checkbox"  name="entest" checked disabled="disabled"/>
          <input type="hidden" name="entest" value=1/></c:if>
          <c:if test="${empty samidentified.entest}">
          <input type="checkbox"  name="entest" disabled="disabled"/></c:if>
          进入量试&nbsp; 
          </td>
        <td> 适用产品：
             <input type="text" size="15" value="${samidentified.itemtype.name}" disabled="disabled" />
             <input type="text" size="15" value="${samidentified.itemtype.item.name}" disabled="disabled" />
		     <input type="hidden" name="itemtypeId" value="${samidentified.itemtype.id}" />
         </td>
      </tr>
      </table>
      <table class="addTable" style="width: 100%">
      <tr align="center">
        <th> 样品名称 </th>
        <th> 品牌 </th>
        <th> 型号规格 </th>
        <th> 图号或料号 </th>
        <th> 数量 </th>
        <th> 单价 </th>
      </tr>
      <tr>
        <td><input type="text" size="22" value="${samidentified.supplierinfo.itemname}" disabled="disabled" /></td>
        <td><input type="text" size="22" value="${samidentified.brand}" disabled="disabled" />
            <input type="hidden" value="${samidentified.brand}" name="samidentified.brand" />
        </td>
        <td><input type="text" size="22" value="${samidentified.supplierinfo.itemtypename}" disabled="disabled" /></td>
        <td><input type="text" value="${samidentified.mcodename}" disabled="disabled" size="25"  />
            <input type="hidden" value="${samidentified.mcodename}" name="samidentified.mcodename"/>
        </td>
        <td><input type="text" value="${samidentified.num}" disabled="disabled" size="15"/>
            <input type="hidden" value="${samidentified.num}" name="samidentified.num"/>
        </td>
        <td><input type="text" value="${samidentified.uprice}" disabled="disabled"  size="15"/>
            <input type="hidden" value="${samidentified.uprice}" name="samidentified.uprice" />
        </td>
      </tr>
      </table>
      <table class="addTable" style="width: 100%">
      <c:if test="${step==3}">
      <tr>
        <td rowspan="2" style="width: 10%"> 认定结论 :</td>
        <td colspan="5" align="left">
             <textarea disabled="disabled" cols="50" rows="4">${samidentified.conclusion}</textarea>
             <input type="hidden" name="samidentified.conclusion" value="${samidentified.conclusion}"/>
        </td>
      </tr>
      <tr>
        <td colspan="6"> 经办：<input type="text" value="${samidentified.examine.empName}" disabled="disabled"/>
                               <input type="hidden" value="${samidentified.examine.empId}" name="samidentified.examine.empId"/>
                            时间：<input type="text" value="${samidentified.examdate}" disabled="disabled"/>
                   <input type="hidden" value="${samidentified.examdate}" name="samidentified.examdate" />         
                                   主管：<input type="text" value="${samidentified.charge.empName}" disabled="disabled"/>
                   <input type="hidden" value="${samidentified.charge.empId}" name="samidentified.charge.empId" />
                                   时间：<input type="text" value="${samidentified.examinedate}" disabled="disabled"/>
                   <input type="hidden" value="${samidentified.examinedate}" name="samidentified.examinedate" />
         </td>
      </tr>
      <tr>
        <td rowspan="2" style="width: 10%"> 分管领导意见: </td>
        <td colspan="98%" align="left"><textarea name="samidentified.opinion" cols="40" rows="4"></textarea></td>
      </tr>
      <tr>
        <td> 时间：
              <input id="d2444" type="text" class="Wdate checkDateInfo"
						onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_3',skin:'whyGreen'})" />
              <input type="hidden" id="d2441_2_3" name="samidentified.opiniondate" />
        </td>
      </tr>
      </c:if>
      <c:if test="${step!=3}">
      <tr>
        <td rowspan="2" style="width: 10%"> 认定结论 :</td>
        <td colspan="5" align="left">
             <textarea name="samidentified.conclusion" cols="50" rows="4">${samidentified.conclusion}</textarea>
        </td>
      </tr>
      <tr>
        <td colspan="6"> 
        <c:if test="${step==1}">
        	    经办：<input type="text" value="${auditUser.employee.empName}" disabled="disabled" />
                   <input type="hidden" name="samidentified.examine.empId" value="${auditUser.employee.empId}" />
                      时间：<input id="d2443" type="text" class="Wdate checkDateInfo" value="${samidentified.examdate}"
						onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_2',skin:'whyGreen'})" />
						 <input type="hidden" id="d2441_2_2" value="${samidentified.examdate}" name="samidentified.examdate" />
                                   主管：<input type="text" name="" value="" disabled="disabled" />
                                   </c:if>
        <c:if test="${step==2}">
       		 经办：<input type="text" value="${samidentified.examine.empName}" disabled="disabled"/>
                  <input type="hidden" value="${samidentified.examine.empId}" name="samidentified.examine.empId"/>
                  时间：<input type="text" value="${samidentified.examdate}" disabled="disabled"/>
                   <input type="hidden" value="${samidentified.examdate}" name="samidentified.examdate" />                 
                                 
                                   主管：<input type="text" value="${auditUser.employee.empName}" disabled="disabled" />
                   <input type="hidden" name="samidentified.charge.empId" value="${auditUser.employee.empId}" />
                         时间：<input id="d2443" type="text" class="Wdate checkDateInfo" value="${samidentified.examinedate}"
						onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_2',skin:'whyGreen'})" />
                   <input type="hidden" id="d2441_2_2" value="${samidentified.examinedate}" name="samidentified.examinedate" />
                   </c:if>
                            
         
         </td>
      </tr>
      </c:if>
      <tr align="center">
        <td align="center" width="10%"> 填制说明 </td>
        <td align="center" colspan="5"> “样品名称”栏目应填写同一供方且配套在我公司同一产品的样品。 
      </tr>
      </table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
          <td>
              <input type="submit" value=" 提 交 " class="frm_btn"/>
          </td>
        </tr>
      </table>
                             
    </form>
  </body>
</html>