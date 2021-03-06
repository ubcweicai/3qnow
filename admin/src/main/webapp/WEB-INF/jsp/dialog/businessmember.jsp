<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib.jsp"%>
<html>
<head>
<title>服务商会员</title>
<%@ include file="/WEB-INF/jsp/inc/adminhead.jsp"%>
<link rel="stylesheet" href="/css/themes/base/jquery.ui.all.css">
<style type="text/css">
.checkboxdiv {
	display: inline-block;
	width: 120px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="row">
				<div class="col-md-12">
					<h4>服务商会员</h4>
				</div>
			</div>
			
			<form:form modelAttribute="membershipQuery" method="post" action="businessmember.html" cssClass="form-inline" role="form">
			   <div class="row myrow">
			   <div class="col-md-12">	     
		   			     <!--read only properties, generated by system-->
						<form:hidden path="pagination.rowCount"/>
						<form:hidden path="pagination.pageCount" id="pageCount"/>
						<!-- read only end -->
						<!--writable properties, control the currentpage, pagesize and order rule -->
						<form:hidden path="pagination.currentPage" id="currentPage"/>
						<form:hidden path="pagination.pageSize"/>
						<form:hidden path="orderByClause"/>
		           <div class="form-group">
		                <form:label path="member_id"  cssClass="sr-only">服务商会员ID:</form:label>
		                <form:input path="member_id" cssClass="form-control input-sm" placeholder="服务商会员ID"/>
		           </div>
		           <div class="form-group">
		                <form:label path="business_name"  cssClass="sr-only">公司名:</form:label>
		                <form:input path="business_name" cssClass="form-control input-sm" placeholder="公司名"/>
		           </div>         
		           <div class="form-group">
		                 <form:label path="type_code"  cssClass="sr-only">会员类型:</form:label>
		                 <form:select path="type_code" cssClass="form-control input-sm">
		                   <form:option value="">--所有状态--</form:option>
		                   <form:options items="${applicationScope.businessMemberTypeMap}"/>
		                 </form:select>
		           </div>
		           <div class="checkbox">
		    		  <form:label path="searchRecommended">
		      			<form:checkbox path="searchRecommended"/> 仅显示推荐
		    		  </form:label>
		  		   </div>           
		           <button type="submit" class="btn btn-primary btn-sm">查询</button> 
		        </div>
			   </div>
			   <div class="row myrow">
				   <div class="col-md-12">
					 <table class="table table-striped table-hover">
					    <tr>
					       <th></th>
					       <th><b>服务商会员ID</b></th>
					       <th><b>公司名</b></th>
					       <th><b>姓名</b></th>
					       <th><b>会员类型</b></th>
					       <th><b>积分</b></th>
					       <th><b>生效日期</b></th>
					       <th><b>失效日期</b></th>
					       <th><b>推荐</b></th>					       
					    </tr>
					    <c:forEach items="${membershiplist}" var="var" varStatus="rowCounter">
					      <tr>
					      <td>
							<div class="radio">
								<label><input type="radio" name="member_id"
									value="${var.member_id}" alt="${var.member_id}"></label>
							</div>
							</td>  
				           <td>${var.member_id}</td>
					       <td>
					         ${var.business_name}
					       </td>
					       <td>
					         ${var.firstLastName}
					       </td>
					       <td>
					         ${var.type_name}
					       </td>
					       <td>
					         ${var.credit}
					       </td>
					       <td>
					         <fmt:formatDate value="${var.valid_from}" pattern="MM/dd/YYYY"/>
					       </td>
					       <td>
					         <fmt:formatDate value="${var.valid_to}" pattern="MM/dd/YYYY"/>
					       </td>
					       <td>
					       		<c:choose> 
									<c:when test="${var.isRecommended == true}"> 
										是
									</c:when> 
									<c:when test="${var.isRecommended == false}"> 
										否 
									</c:when>
									<c:otherwise> 								 
									</c:otherwise>
								</c:choose>			       
					       </td>					       			       
					      </tr>
					    </c:forEach>
					  </table> 
				   </div> 
			   </div>
			   
			   <div class="row myrow">
			     <div class="col-md-12">
			       <ul class="pagination pagination-sm" style="margin:0">
			         <li><a href="#" onclick="javascript:turnpage(-1)">&laquo;</a></li>
			         <c:forEach items="${pageNumList}" var="var" varStatus="rowCounter">
			         <li><a href="#" onclick="javascript:gotopage(${var})">${var}</a></li>
			         </c:forEach>
				     <li><a href="#" onclick="javascript:turnpage(1)">&raquo;</a></li>
					</ul>
			     </div>
			   </div>
			</form:form>
			
			<div class="row myrow">
				<div class="col-md-12" style="text-align: center">
					<button type="button" id="addbutton">确定</button>
					<span id="resultmsg"></span>
				</div>
			</div>

		</div>
	</div>
	<%@include file="/WEB-INF/jsp/inc/loadjs.jsp"%>
	<script src="/js/ui/jquery.ui.core.js"></script>
	<script src="/js/ui/jquery.ui.widget.js"></script>
	<script src="/js/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymceinit.js"></script>
	<script type="text/javascript">
	    function gotopage(pagenum){
	   	 	$("#currentPage").val(pagenum);
	   	 	document.forms[0].submit();
	    }
	    
	    function turnpage(offset){
		   	 var currentpage=parseInt($("#currentPage").val());
		   	 var pagecount = parseInt($("#pageCount").val());
		   	 currentpage += offset;
		   	 $("#currentPage").val(currentpage);
		   	 if(currentpage>0&&currentpage<=pagecount){
		   	   document.forms[0].submit();
		   	 }
	    }
	    
		$(document).ready(function() {
	    	var currentpage=parseInt($("#currentPage").val());
	    	$(".pagination li:eq("+currentpage+")").addClass("active");
	    	 
			$(".openEditPage").colorbox({
				iframe : true,
				width : "90%",
				height : "90%",
				onClosed : function() {
					document.forms[0].submit();
				}
			});
			
		});
		
		$(function(){
			
			$("#addbutton").click(function(){				
				var user_id = $("input:radio[name=member_id]:checked").val();
				parent.$("#member_id").val(user_id).trigger('change');
				parent.jQuery.colorbox.close();		
			});
			
		});
	</script>
</body>
</html>
