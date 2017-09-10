<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglib.jsp"%>
<html>
<head>
<title>会员信息管理</title>
<%@ include file="/WEB-INF/inc/head.jsp"%>
<link rel="stylesheet" href="/css/themes/base/jquery.ui.all.css" />

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
					<div class="col-sm-2">
                       <%@ include file="/WEB-INF/inc/leftbar.jsp"%>
                    </div>
					<div class="col-sm-10">
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="form-group">
					                <h1 style="text-align:center;padding:20px">会员信息管理</h1>
					            </div>
					        </div>
					    </div>                            
					    <form:form modelAttribute="membershipQuery" method="post" action="manage.html" class="form-horizontal" role="form">
					    	<!--read only properties, generated by system-->
							<form:hidden path="pagination.rowCount"/>
							<form:hidden path="pagination.pageCount" id="pageCount"/>
							<!-- read only end -->
							<!--writable properties, control the currentpage, pagesize and order rule -->
							<form:hidden path="pagination.currentPage" id="currentPage"/>
							<form:hidden path="pagination.pageSize"/>
							<form:hidden path="orderByClause"/>							   	
					    	
					        <div class="row">
					            <div class="col-sm-12 col-md-2">
					                <div class="form-group">
					                    <div class="col-xs-12 col-sm-8 col-md-8">
					                        <a class="openEditPage btn  btn-default" href="create.html" >申请新会员</a>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </form:form>
					    <!-----------表格1---------------------->
					    <div class="row">
					        <div class="col-sm-12">
					            <div class="table-responsive">
					                <table class="table table-bordered table-hover table-striped">
					                    <tr>
					                        <th>会员ID</th>
					                        <th>会员类型</th>
					                        <th>生效日期</th>
					                        <th>失效日期</th>
					                        <th>状态</th>
					                        <th style="width:90px;">操作</th>
					                    </tr>					                    
					                    <c:forEach items="${membershiplist}" var="var" varStatus="rowCounter">
									      <tr>  
								           <td>
								           	 ${var.member_id}
								           </td>
									       <td>
									         <c:set var="type_code" value="${var.type_code}"/>
						         			 ${applicationScope.memberTypeMap[type_code]}
									       </td>
									       <td>
									         <fmt:formatDate value="${var.valid_from}" pattern="MM/dd/YYYY"/>
									       </td>
									       <td>
									         <fmt:formatDate value="${var.valid_to}" pattern="MM/dd/YYYY"/>
									       </td>
									       <td>
									           	<c:set var="status" value="${var.status}" /> <c:if
													test="${var.status==0}">
													<img src="/images/icon-fail.png" alt="未激活">
												</c:if> <c:if test="${var.status==1}">
													<img src="/images/icon-ok.png" alt="激活">
												</c:if> <c:if test="${var.status==2}">
													<img src="/images/lock.png" alt="锁死">
												</c:if>
								           </td>
									       <td>
									       		<a class="openEditPage" href="updatetype.html?member_id=${var.member_id}" >升级 / 降级</a><br>
									       		<c:if test="${var.subMemberType=='B'}"> 
					                            	<a class="openEditPage" href="update.html?member_id=${var.member_id}" class="fwsxx">服务商信息</a>
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
					            	<ul class="pagination pagination-sm" style="margin:0">
								         <li><a href="#" onclick="javascript:turnpage(-1)">&laquo;</a></li>
								         <c:forEach items="${pageNumList}" var="var" varStatus="rowCounter">
								         <li><a href="#" onclick="javascript:gotopage(${var})">${var}</a></li>
								         </c:forEach>
									     <li><a href="#" onclick="javascript:turnpage(1)">&raquo;</a></li>
									</ul>
					            </nav>
					        </div>
					    </div>
					</div>
				</div>
			</div>
		</div>

		<!--container-->
	</div>
	<!--wrap end-->
	<!--#include file="footer.shtml" -->
	<%@include file="/WEB-INF/inc/globalfooter.jsp"%>
	<%@include file="/WEB-INF/inc/loadjs.jsp"%>
	<script src="/js/ui/jquery.ui.core.js"></script>
	<script src="/js/ui/jquery.ui.widget.js"></script>
	<script src="/js/ui/jquery.ui.datepicker.js"></script>
	<script>
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
	    
	    $(document).ready(function(){
	   	 var currentpage=parseInt($("#currentPage").val());
	   	 $(".pagination li:eq("+currentpage+")").addClass("active");
	   	 
		    $(".openEditPage").colorbox({iframe:true, width:"90%", height:"90%", onClosed:function(){ 
		    	document.forms[0].submit();
		    }});
		    
		    $(".openViewPage").colorbox({iframe:true, width:"90%", height:"90%", onClosed:function(){ } });
	   	 
	    });
	</script>
</body>
</html>