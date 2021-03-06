﻿<%@ page contentType="text/html;charset=UTF-8"%>
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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>配套发料表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/stock.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<form action="<%=basePath%>warehouse/supsendm/supsendm_addSingle"
			method="post">
			<input type="hidden" name="supsendm.itemType.id" value="${itemType.id }"/> 
			<input type="hidden" name="preparation.id" value="${preparation.id}" />
			<table class="title editTable">
				<tr>
					<td>
						配套发料表
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						部品号:
					</td>
					<td>
						<input type="text" name="supsendm.partno" class="itemname"/>
					</td>
				</tr>
				<tr>
					<td>
						本批发料：
					</td>
					<td>
						<input readonly="readonly" type="text" value="${needNum }" onkeyup="batchChange(${itemType.id});" id="batch" name="supsendm.batch" class="itemname checkEmptyShowInfo checkNumShowInfo"/>
					</td>
				</tr>
				<tr>
					<td>
						日期：
					</td>
					<td>
						<input id="d244_0" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2_0" name="supsendm.date" />
					</td>
				</tr>
				<tr>
					<td>
						领料单位：
					</td>
					<td>
						<select name="supsendm.department.id" id="selectdepartment4">
							<c:forEach items="${departments}" var="d">
								<option value="${d.id }">
									${d.dptName }
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						保税产品：
					</td>
					<td>
						<c:choose>
							<c:when test="${itemType.bondedNo!=null}">
								<input type="text" readonly="readonly" value="${itemType.item.name }${itemType.name}" name="supsendm.bondedpro" class="itemname" />
							</c:when>
							<c:otherwise>
								<input type="text" readonly="readonly" name="supsendm.bondedpro"  value="该部品不是保税品" readonly="readonly"/>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						投料第：
					</td>
					<td>
						<input type="text" value="${thisfeeding }" readonly="readonly" id="feeding" name="supsendm.feeding" class="itemname" />
						套
					</td>
				</tr>
			</table>
			<table class="title">
				<tr>
					<th colspan="11" align="right" background="images/title_bg2.jpg">
						<div align="right">
							&nbsp;
						</div>
					</th>
				</tr>
			</table>
			<table class="list" id="tb" style="width: 100%">
				<tr>
					<th width="5%">
						保税号
					</th>
					<th width="10%">
						品名
					</th>
					<th width="20%">
						型号规格
					</th>
					<th width="5%">
						单定
					</th>
					<th width="10%">
						一般部品发料数量
					</th>
					<th width="10%">
						保税部门发料数量
					</th>
					<th width="10%">
						本批结存
					</th>
					<th width="10%">
						上批结存
					</th>
					<th width="10%">
						备注
					</th>
					<%--<th width="5%">
						添加
					</th>
					<th width="5%">
						删除
					</th>
				--%></tr>
				<!-- 模板开始 -->
				<tr id="rowTemplete_0">
					<td>
						<input type="hidden" id="itemTypeIdId_0" name="itemTypeIds" />
						<input type="text" id="itemTypeBondedNoId_0"
							name="itemTypeBondedNos" readonly="readonly" size="5" />
					</td>
					<td>
						<input type="text" id="itemNameId_0" name="itemNames"
							readonly="readonly" size="8" />
					</td>
					<td>
						<input type="text" id="itemTypeNameId_0" name="itemTypeName"
							 onchange="changeItemType(this,[0]);" readonly="readonly" size="10" />
						<%--<input id='item_0' type='button' value='选择' class='frm_btn'
							onClick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					--%></td>
					<td>
						<input type="text" id="singlesetsId_0"
							onkeyup="changeNum(this,[0]);" readonly="readonly" name="singlesets" size="5" />
					</td>
					<td>
						<input type="text" id="generalnosId_0" name="generalnos" size="5"
							readonly="readonly" />
					</td>
					<td>
						<input type="text" id="bondednumsId_0" name="bondednums" size="5"
							readonly="readonly" />
					</td>
					<td>
						<input type="text" id="tbalancesId_0" name="tbalances" size="10"
							readonly="readonly" />
					</td>
					<td>
						<input type="text" id="lbalancesId_0" name="lbalances" size="10"
							readonly="readonly" />
					</td>
					<td>
						<input type="text" name="notes" size="10" />
					</td>
					<%--<td>
						<img src="<%=basePath%>images/add.png"
							onClick="return addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath%>images/del.png"
							onClick="return deleteBatchRow(this)" />
					</td>
				--%></tr>
				<!-- 模板结束 -->

				<!---------------------------LOOP START------------------------------>
				<c:if test="${!empty susgoods}">
					<c:forEach items="${susgoods }" var="s" varStatus="vs">
						<tr>
							<td>
								<input type="hidden" id="itemTypeIdId${vs.index }"
									name="itemTypeIds" value="${s.itemType.id }" />
								<input type="text" id="itemTypeBondedNoId${vs.index }"
									name="itemTypeBondedNos" value="${s.itemType.bondedNo }"
									readonly="readonly" size="5" />
							</td>
							<td>
								<input type="text" id="itemTypeNameId${vs.index }"
									name="itemTypeNames" value="${s.itemType.item.name }"
									readonly="readonly" size="8" />
							</td>
							<td>
								<input type="text" id="itemNameId${vs.index }" onchange="changeItemType(this,${vs.index });" name="itemName"
									value="${s.itemType.name }" disabled="disabled" size="10" />
								<%--<input id='item_0' type='button' value='选择' class='frm_btn'
									onClick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index }','selectItem',800, 600, 1);return false">
							--%></td>
							<td>
								<input type="text" onkeyup="changeNum(this,${vs.index });"
									id="singlesetsId${vs.index }" name="singlesets"
									value="${s.singleset }" readonly="readonly" size="5" />
							</td>
							<td>
								<input type="text" id="generalnosId${vs.index }"
									name="generalnos" value="${s.generalno }" size="5"
									readonly="readonly" />
							</td>
							<td>
								<input type="text" id="bondednumsId${vs.index }"
									name="bondednums" value="${s.bondednum }" size="5"
									readonly="readonly" />
							</td>
							<td>
								<input type="text" id="tbalancesId${vs.index }" name="tbalances"
									value="${s.tbalance }" size="10" readonly="readonly" />
							</td>
							<td>
								<input type="text" id="lbalancesId${vs.index }" name="lbalances"
									value="${s.lbalance }" size="10" readonly="readonly" />
							</td>
							<td>
								<input type="text" name="notes" value="${s.note }" size="10" />
							</td>
							<%--<td>
								<img src="<%=basePath%>images/add.png"
									onclick="return addBatchRow(this)" />
							</td>
							<td>
								<img src="<%=basePath%>images/del.png"
									onclick="return deleteBatchRow(this)" />
							</td>
						--%></tr>
					</c:forEach>
				</c:if>
			</table>
			<table class="addTable editTable">
				<tr>
					<td>
						生产部：
					</td>
					<td>
						<select name="supsendm.proper.empId">
							<c:forEach items="${productionworkers}" var="p">
								<option value="${p.empId}">
									${p.empName}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						车间：
					</td>
					<td>
						<select name="supsendm.wsper.empId">
							<c:forEach items="${workshopworkers}" var="p">
								<option value="${p.empId}">
									${p.empName}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						仓管员：
					</td>
					<td>
						<select name="supsendm.whmanager.empId">
							<c:forEach items="${warehouseworkers}" var="p">
								<option value="${p.empId}">
									${p.empName}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td colspan="2" align="center">
						<input name="AddDic" type="submit" class="frm_btn" id="AddDic" value="提交"/>
					</td>
				</tr>
			</table>
		</form>
		<p>
			&nbsp;
		</p>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
	<script type="text/javascript">
  	function changeNum(param,index)
  	{
  	  	var element = $(param);
  	  	var line = element.attr("id").indexOf("_")>=0?"_":"";
  	  	//单定的集合
		var singlesets = $("#singlesetsId"+line+index).val();
		//本批发料
		var batch = $("#batch").val();
		//保税号
		var itemTypeBondedNo = $("#itemTypeBondedNoId"+line+index);
		//上批结存
		var lbalances = $("#lbalancesId"+line+index);
		//本批结存
		var tbalances = $("#tbalancesId"+line+index);
		//库存
		var stonm = getItemTypeStock($("#itemTypeIdId"+line+index).val());
		//页面传来的库存
		var stoval = $("#lbalancesId"+line+index).val();
		//一般部品发货数量
		var generalnos = $("#generalnosId"+line+index);
		//保税部品发货数量
		var bondednums = $("#bondednumsId"+line+index);
		if(undefined==stoval||""==stoval||stonm!=stoval)
		{
			if(stonm!=stoval)
			{
				bondednums.val("");
				generalnos.val("");
			}
			lbalances.val(stonm);
			tbalances.val(stonm-singlesets*batch);
		}
		else
		{
			tbalances.val(lbalances.val()-singlesets*batch);
		}
		if(undefined==itemTypeBondedNo.val()||""==itemTypeBondedNo.val())
		{
			generalnos.val(singlesets*batch);
		}else{
			bondednums.val(singlesets*batch);
		}
    }
    function changeItemType(param,index){
    	var element = $(param);
  	  	var line = element.attr("id").indexOf("_")>=0?"_":"";
  	  	//单定的集合
		$("#singlesetsId"+line+index).val("");
		//上批结存
		$("#lbalancesId"+line+index).val("");
		//本批结存
		$("#tbalancesId"+line+index).val("");
		//一般部品发货数量
		$("#generalnosId"+line+index).val("");
		//保税部品发货数量
		$("#bondednumsId"+line+index).val("");
    }
    function batchChange(id){
		var batch = $("#batch");
		var lastFeeding;
		var feeding = $("#feeding");
		params = "supsendm.itemType.id="+id;
		$.ajax( {
			type : "POST",
			url : "warehouse/supsendmverify/supsendm_getLastFeeding.action",
			data : params,
			dataType:"JSON",
			async: false,
			success : function(data){
				data = eval("(" + data + ")");
				lastFeeding = data.lastfeeding;
			}
		});
		//alert(typeof batch.val() + typeof lastFeeding);
		feeding.val(parseInt(batch.val())+parseInt(lastFeeding));
		var singlesets = $("input[name='singlesets']");
		var generalnos = $("input[name='generalnos']");
		var bondednums = $("input[name='bondednums']");
		var tbalances = $("input[name='tbalances']");
		var lbalances = $("input[name='lbalances']");
		for(var i = 0 ; i < lbalances.length; i++)
		{
			var singleset = $(singlesets[i]);
			var generalno = $(generalnos[i]);
			var bondednum = $(bondednums[i]);
			var tbalance = $(tbalances[i]);
			var lbalance = $(lbalances[i]);
			if(!(undefined==bondednum.val()||bondednum.val()==""))
			{
				bondednum.val(singleset.val()*batch.val());
				tbalance.val(lbalance.val()-bondednum.val());
			}
			if(!(undefined==generalno.val()||generalno.val()==""))
			{
				generalno.val(singleset.val()*batch.val());
				tbalance.val(lbalance.val()-generalno.val());
			}
		}
    }
  </script>
</html>