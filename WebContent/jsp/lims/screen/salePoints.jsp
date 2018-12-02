<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>调度台账</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/skins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/skins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/skins/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/skins/links/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/skins/js/common.js"></script>

<style type="text/css">
	html,body{
		padding: 5px;
		background-color: #ECECEC;
	}

	.panel-default>.panel-heading{
		background-color: #FFFFFF;
	}
	
	.form-input {
	  width:140px;
	  padding-left:12px;
	  font-size: 14px;
	  line-height: 1.42857143;
	  color: #555;
	  background-color: #fff;
	}
	.panel,.panel-heading,.panel-title,.panel-body{
		border-radius:0px!important;
		
	}
	.table tr td{
		border: 1px solid #000000 !important;
	}
	.table tr th{
		border: 1px solid #000000 !important;
	}
</style>
</head>
<body>
<form action="" method="post">
	<input type="hidden" name="id" value="${saleType}"/>
	<input type="hidden" name="pointId" />
	<input type="hidden" name="isCheck" />
<div class="panel panel-default" style="margin-bottom:0px;">
	<div class="panel-heading">
		<div class="panel-title">
			<labe style="margin-right:20px;padding:5px 10px;font-size:14px;background-color:#5CB85C;color:#FFFFFF;">${saleType}</labe>
		</div>
	</div>
</div>
</form>
<div class="panel panel-success" style="margin-bottom:0px;">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>序号</th>
				<th>车间</th>
				<th>装置</th>
				<th>采样点</th>
				<th>样品</th>
				<th style="text-align: center;">外卖</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${points}" var="v" varStatus="row">
			<tr>
				<td>${row.count }</td>
				<td>${v.areaName }</td>
				<td>${v.plant }</td>
				<td>${v.description }</td>
				<td>${v.matcode }</td>
				<td style="text-align: center;">
					<c:choose>
						<c:when test="${v.ischecked =='0'}">
							<input type="checkbox" name="pointId" id="${v.samplePointId}" value="${v.samplePointId}" onchange="changePoint('${v.samplePointId}')"/>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="pointId" id="${v.samplePointId}" value="${v.samplePointId}" checked="checked" onchange="changePoint('${v.samplePointId}')"/>
						</c:otherwise>
					</c:choose>
				</td>		
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>



</body>
<script type="text/javascript">
	
	function changePoint(pointId){
		if($("#"+pointId).is(":checked")){
			$("input[name='pointId']").val(pointId);
			$("input[name='isCheck']").val(true);
		}else{
			$("input[name='pointId']").val(pointId);
			$("input[name='isCheck']").val(false);
		};
		
		var parmas = $("form").serialize();
		//获取装置及采样点信息
		$.ajax({type: 'POST',
			async: false,
			dataType:"json",
			data:parmas,
			url:"${pageContext.request.contextPath}/lims/screen/gq/saleSet",
			success: function(data){
				
			}
		});
		
	}
</script>
</html>