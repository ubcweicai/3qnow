<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglib.jsp" %>
<html>
<head>
  <title>订单管理</title>
  <%@ include file="/WEB-INF/inc/head.jsp" %>
  <link rel="stylesheet" href="/css/themes/base/jquery.ui.all.css">
</head>
<body>
	<div class="wrap">
  		<!--globalnav start-->
		<%@ include file="/WEB-INF/inc/topnav.jsp"%>
		<!--globalnav end-->
		<!--globalnav start-->
		<%@ include file="/WEB-INF/inc/globalnav.jsp"%>
		<!--globalnav end-->		
	   <div class="container tbscontainer">
	     <div class="main">
	       <div class="row">
	       
		       	<div class="col-sm-3">
	            	<%@ include file="/WEB-INF/inc/leftbar.jsp"%>
	            </div>            
	            
	            <div class="col-sm-12 col-md-9">
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<h1 style="text-align:center;padding:20px">我卖出的服务</h1>
							</div>
						</div>
					</div>
					<form:form class="form-horizontal" modelAttribute="serviceOrderQuery" method="post" action="suppliermanage.html" role="form">
						<!-- read only properties, generated by system -->
						<form:hidden path="unFinishedOrder.pagination.rowCount"/>
						<form:hidden path="unFinishedOrder.pagination.pageCount" id="pageCount1"/>
						<!-- read only end writable properties, control the current page, page size and order rule -->
						<form:hidden path="unFinishedOrder.pagination.currentPage" id="currentPage1"/>
						<form:hidden path="unFinishedOrder.pagination.pageSize"/>
						<form:hidden path="unFinishedOrder.orderByClause"/>
						
						<!-- read only properties, generated by system -->
						<form:hidden path="finishedOrder.pagination.rowCount"/>
						<form:hidden path="finishedOrder.pagination.pageCount" id="pageCount2"/>
						<!-- read only end writable properties, control the current page, page size and order rule -->
						<form:hidden path="finishedOrder.pagination.currentPage" id="currentPage2"/>
						<form:hidden path="finishedOrder.pagination.pageSize"/>
						<form:hidden path="finishedOrder.orderByClause"/>
												
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="form-group">
									<label for="input-id" class="col-xs-12 col-sm-4 col-md-4 control-label" id="ddid">订单ID：</label>
									<div class="col-xs-12 col-sm-8 col-md-8">
										<form:input path="order_id" cssClass="form-control input-sm" placeholder="订单ID"/>
<!-- 										<input type="text" class="form-control" id="inputxing" placeholder=""> -->
<!-- 										<span class="glyphicon glyphicon-ok form-control-feedback"></span>  -->
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-5">
								<div class="form-group">
									<label for="input-name" class="col-xs-12 col-sm-4 col-md-4 control-label" id="ddname">产品名称：</label>
									<div class="col-xs-12 col-sm-8 col-md-8">
										<form:input path="service_title" cssClass="form-control input-sm" placeholder="服务名称"/>
										<!-- <input type="text" class="form-control" id="input-name" placeholder=""> -->
<!-- 										<span class="glyphicon glyphicon-ok form-control-feedback"></span>  -->
									</div>
								</div>
							</div>
							<div class="col-sm-12 col-md-2">
								<div class="form-group">
									<div class="col-xs-12 col-sm-8 col-md-8">
										<button type="submit" class="btn btn-primary btn-sm">查询</button>										
									</div>
								</div>
							</div>
						</div>
					</form:form>
<!-- 					---------表格1-------------------- -->
					<h4>未完成订单</h4>
					<div class="row">
						<div class="col-sm-12">
							<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped">
									<tr>
										<th>封面</th>
										<th>订单ID</th>
										<th>服务名称</th>
										<th>状态</th>
										<th>订单日期</th>
										<th>时间</th>
										<th>价格</th>
										<th>操作</th>
									</tr>
									<c:forEach items="${unFinishedOrderList}" var="var" varStatus="rowCounter">
								      <tr>  
								           <td>
								           		<c:if test="${(empty var.cover_img)}">
								           			<a href="#"><img src="/images/no-image-found.jpg" width="100"/></a>
								           		</c:if>
								           		<c:if test="${(not empty var.cover_img)}">
								           			<img alt="cover image" src="${var.cover_img}" width="100">
								           		</c:if>			           	 
								           </td>
									       <td>
									         ${var.order_id}
									       </td>
									       <td>
									       	 <a class="openEditPage" href="update.html?order_id=${var.order_id}">${var.service_title}</a>								         
									       </td>
									       <td>
									         ${var.status}
									       </td>
									       <td>
									         ${var.orderDate}
									       </td>
									       <td>
									         ${var.orderTime}
									       </td>
									       <td>
									         $${var.priceTotal}
									       </td>
									       <td>
												<c:if test="${var.status_id=='10' || var.status_id=='20' || var.status_id=='30'}"> 
													<a class="openEditPage" href="update.html?order_id=${var.order_id}">取消	</a>
												</c:if>
												<c:if test="${var.status_id=='10' || var.status_id=='20' || var.status_id=='30'}"> 
													<a class="openEditPage" href="update.html?order_id=${var.order_id}">绑定	</a>
												</c:if> 
											</td>			       
								      </tr>
								    </c:forEach>
								</table>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<nav style="float:right;">
								<ul class="pagination list1">
							         <li><a href="#" onclick="javascript:turnpage1(-1)">&laquo;</a></li>
							         <c:forEach items="${pageNumList1}" var="var" varStatus="rowCounter">
							         <li><a href="#" onclick="javascript:gotopage1(${var})">${var}</a></li>
							         </c:forEach>
								     <li><a href="#" onclick="javascript:turnpage1(1)">&raquo;</a></li>
								</ul>
							</nav>
						</div>
					</div>
<!-- 					---------表格2-------------------- -->
					<h4>已完成订单</h4>
					<div class="row">
						<div class="col-sm-12">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
									<tr>
										<th>封面</th>
										<th>订单ID</th>
										<th>服务名称</th>
										<th>状态</th>
										<th>订单日期</th>
										<th>时间</th>
										<th>价格</th>
										<th>操作</th>
									</tr>
									
									<c:forEach items="${finishedOrderList}" var="var" varStatus="rowCounter">
								      <tr>  
								           <td>
								           		<c:if test="${(empty var.cover_img)}">
								           			<a href="#"><img src="/images/no-image-found.jpg" width="100"/></a>
								           		</c:if>
								           		<c:if test="${(not empty var.cover_img)}">
								           			<img alt="cover image" src="${var.cover_img}" width="100">
								           		</c:if>			           	 
								           </td>
									       <td>
									         ${var.order_id}
									       </td>
									       <td>
									       	 <a class="openEditPage" href="view.html?order_id=${var.order_id}">${var.service_title}</a>								         
									       </td>
									       <td>
									         ${var.status}
									       </td>
									       <td>
									         ${var.orderDate}
									       </td>
									       <td>
									         ${var.orderTime}
									       </td>
									       <td>
									         $${var.priceTotal}
									       </td>
									       <td>
												<c:if test="${var.status_id=='60'}"> 
													<a class="openViewPage" href="vieworderrate.html?order_id=${var.order_id}">查看评价</a>
												</c:if> 
										   </td>			       
								      </tr>
								    </c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<nav style="float:right;">
								<ul class="pagination list2">
							         <li><a href="#" onclick="javascript:turnpage2(-1)">&laquo;</a></li>
							         <c:forEach items="${pageNumList2}" var="var" varStatus="rowCounter">
							         <li><a href="#" onclick="javascript:gotopage2(${var})">${var}</a></li>
							         </c:forEach>
								     <li><a href="#" onclick="javascript:turnpage2(1)">&raquo;</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
		   </div>   
		
	   	</div><!-- row-fluid -->		   
   	</div>
   </div>
   	
   <%@include file="/WEB-INF/inc/loadjs.jsp" %>
   	<script src="/js/ui/jquery.ui.core.js"></script>
	<script src="/js/ui/jquery.ui.widget.js"></script>
	<script src="/js/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymceinit.js"></script>
   	<script type="text/javascript">
     function gotopage1(pagenum){
    	 $("#currentPage1").val(pagenum);
    	 document.forms[0].submit();
     }
     
     function turnpage1(offset){
    	 var currentpage=parseInt($("#currentPage1").val());
    	 var pagecount = parseInt($("#pageCount1").val());
    	 currentpage += offset;
    	 $("#currentPage1").val(currentpage);
    	 if(currentpage>0&&currentpage<=pagecount){
    	   document.forms[0].submit();
    	 }
     }
     
     function gotopage2(pagenum){
    	 $("#currentPage2").val(pagenum);
    	 document.forms[0].submit();
     }

     function turnpage2(offset){
    	 var currentpage=parseInt($("#currentPage2").val());
    	 var pagecount = parseInt($("#pageCount2").val());
    	 currentpage += offset;
    	 $("#currentPage2").val(currentpage);
    	 if(currentpage>0&&currentpage<=pagecount){
    	   document.forms[0].submit();
    	 }
     }
     
     $(document).ready(function(){
    	 $("#datepicker1").datepicker(); 
    	 $("#datepicker2").datepicker();
    	 
    	 var currentpage1 = parseInt($("#currentPage1").val());
    	 $(".list1 li:eq("+currentpage1+")").addClass("active");
    	 
    	 var currentpage2 = parseInt($("#currentPage2").val());
    	 $(".list2 li:eq("+currentpage2+")").addClass("active");
    	 
	    $(".openEditPage").colorbox({iframe:true, width:"90%", height:"90%", onClosed:function(){ 
	    	document.forms[0].submit();
	    }});
	    
	    $(".openViewPage").colorbox({iframe:true, width:"90%", height:"80%", onClosed:function(){ } });
    	 
     });
   </script>
   
</body>
</html>