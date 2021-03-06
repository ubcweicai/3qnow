<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib.jsp"%>
<html>
<head>
<title>Blog 管理</title>
<%@ include file="/WEB-INF/jsp/inc/adminhead.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/inc/adminnav.jsp"%>
	<div class="container">
		<div class="row">

			<div class="row">
				<div class="col-md-12">
					<h4>Blog 管理</h4>
				</div>
			</div>
			<div class="modal fade" id="confirm-delete" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
						</div>

						<div class="modal-body">
							<p class="user-info"></p>
							<p>此操作将不能撤回，确定删除?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<a href="#" class="btn btn-danger danger openEditPage"
								id="modal-delete">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<!-- form begin -->
			<form:form modelAttribute="blogQuery" method="post"
				action="manage.html" cssClass="form-inline" role="form">
				<div class="row myrow">
					<div class="col-md-12">

						<!--read only properties, generated by system-->
						<form:hidden path="pagination.rowCount" />
						<form:hidden path="pagination.pageCount" id="pageCount" />
						<!-- read only end -->
						<!--writable properties, control the currentpage, pagesize and order rule -->
						<form:hidden path="pagination.currentPage" id="currentPage" />
						<form:hidden path="pagination.pageSize" />
						<form:hidden path="orderByClause" />
						<div class="form-group">
							<form:label path="title" cssClass="sr-only">标题:</form:label>
							<form:input path="title" cssClass="form-control input-sm"
								placeholder="标题" />
						</div>
						<div class="form-group">
							<form:label path="meta_keyword" cssClass="sr-only">关键字:</form:label>
							<form:input path="meta_keyword" cssClass="form-control input-sm"
								placeholder="关键字" />
						</div>

						<div class="form-group">
							<form:select path="blog_status" cssClass="form-control input-sm">
								<form:option value="">--所有状态--</form:option>
								<form:options items="${applicationScope.blogStatusMap}" />
							</form:select>
						</div>
						<div class="form-group">
							<form:select path="class_id" cssClass="form-control input-sm">
								<form:option value="">--分类--</form:option>
								<form:options items="${applicationScope.blogClassMap}" />
							</form:select>
						</div>

						<button type="submit" class="btn btn-primary btn-sm">Search</button>
						<a href="create.html" class="btn btn-success btn-sm openEditPage">创建blog</a>


						<div class="row myrow">
							<div class="col-md-12">
								<table class="table table-striped table-hover">
									<tr>
										<th><b>标题</b></th>
										<th><b>作者</b></th>
										<th><b>关键字</b></th>
										<th><b>分类</b></th>
										<th><b>录入时间</b></th>
										<th><b>更新时间</b></th>
										<th><b>状态</b></th>
										<th><b>操作</b></th>
									</tr>
									<c:forEach items="${blogmnglist}" var="var"
										varStatus="rowCounter">
										<tr>
											<td>${var.title}</td>
											<td>${var.last_name}${var.first_name}</td>
											<td>${var.meta_keyword}</td>
											<td><c:set var="class_id" value="${var.class_id}" />
												${applicationScope.blogClassMap[class_id]}</td>
											<td><fmt:formatDate value="${var.created_at}"
													pattern="MM/dd/YYYY HH:mm" /></td>
											<td><fmt:formatDate value="${var.modified_at}"
													pattern="MM/dd/YYYY HH:mm" /></td>
											<td><c:set var="blog_status" value="${var.blog_status}" />
												<!-- 
												${applicationScope.blogStatusMap[blog_status]}
												--> <c:if test="${var.blog_status==10}">
													<img src="/images/icon-blog-plus-16.png" title="草稿">
												</c:if> <c:if test="${var.blog_status==20}">
													<img src="/images/icon-blog-check-16.png" title="发布">
												</c:if> <c:if test="${var.blog_status==30}">
													<img src="/images/icon-blog-sign-error-16.png" title="不发布">
												</c:if></td>
											<td><a class="openEditPage"
												href="update.html?id=${var.blog_id}"> <span
													class="glyphicon glyphicon-edit text-success" title="更新"></span>

											</a>&nbsp;&nbsp; <!--<a href="delete.html?id=${var.blog_id}"><span
													class="glyphicon glyphicon-trash text-danger" title="删除"></span>
											</a></td>
											--> <a data-href="delete.html?id=${var.blog_id}"
												data-toggle="modal" data-target="#confirm-delete" href="#"
												id="delete-operate" title="${var.title}"> <span
													class="glyphicon glyphicon-trash text-danger" title="删除"></span></a>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
						<div class="row myrow">
							<div class="col-md-12">
								<ul class="pagination pagination-sm" style="margin: 0">
									<li><a href="#" onclick="javascript:turnpage(-1)">&laquo;</a></li>
									<c:forEach items="${pageNumList}" var="var"
										varStatus="rowCounter">
										<li><a href="#" onclick="javascript:gotopage(${var})">${var}</a></li>
									</c:forEach>
									<li><a href="#" onclick="javascript:turnpage(1)">&raquo;</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</form:form>
			<!-- form end -->
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/inc/loadjs.jsp"%>
	<script type="text/javascript">
		function gotopage(pagenum) {
			$("#currentPage").val(pagenum);
			document.forms[0].submit();
		}
		function turnpage(offset) {
			var currentpage = parseInt($("#currentPage").val());
			var pagecount = parseInt($("#pageCount").val());
			currentpage += offset;
			$("#currentPage").val(currentpage);
			if (currentpage > 0 && currentpage <= pagecount) {
				document.forms[0].submit();
			}
		}

		function archiveUser(userid) {
			if (confirm("删除后，只有系统管理员可以恢复. 确认删除吗?")) {
				$.colorbox({
					iframe : true,
					fixed : true,
					href : "archiveUser.html?userid=" + userid,
					width : "50%",
					height : "50%",
					onClosed : function() {
						document.forms[0].submit();
					}
				});
			}
		}

		$(document).ready(function() {
			var currentpage = parseInt($("#currentPage").val());
			$(".pagination li:eq(" + currentpage + ")").addClass("active");

			$(".openEditPage").colorbox({
				iframe : true,
				width : "90%",
				height : "90%",
				onClosed : function() {
					location.reload();
				}
			});

			$(".openViewPage").colorbox({
				iframe : true,
				width : "90%",
				height : "90%",
				onClosed : function() {
				}
			});
			
			$('#delete-operate ').click(function(){
				var user = $(this).attr('title');
				console.log("***********11"+user);
				
				$('#confirm-delete').on('show.bs.modal', function(e) {
				    $(this).find('.danger').attr('href', $(e.relatedTarget).data('href'));
				    $('.user-info').html('即将删除Blog: <strong>' +user + '</strong>');
				});
				
				$('#modal-delete ').click(function(){
					$('#confirm-delete').modal('hide');
				});
			});
			

		});
	</script>

</body>
</html>