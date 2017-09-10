<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib.jsp"%>
<html>
<head>
<title>Ticket 详情</title>
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
		<!-- content begin -->
		<div class="row">



			<h4>
				<strong>Ticket详情</strong>
			</h4>




			<div class="tab-pane active" id="ticket general">
				<h5>标题 ： ${ticket.title}</h5>
				<h5>
					客户姓名 : ${ticket.last_name} ${ticket.first_name}&nbsp; 联系电话 ：
					${ticket.phone} &nbsp;录入时间 ：
					<fmt:formatDate value="${ticket.created_at}"
						pattern="YYYY/MM/dd HH:mm" />
				</h5>
				<div class="row myrow">
					<div class="col-md-8">
						<p class="text-info">${ticket.description}</p>
					</div>
				</div>
			</div>



			<div class="row hr">
				<hr class="col-md-8">
			</div>


			<h4>
				回&nbsp;复 <span class="badge">${ticketReplylist.size()}</span>
			</h4>

			<br>
			<div class="row myrow">
				<div class="col-md-12">

					<c:forEach items="${ticketReplylist}" var="var"
						varStatus="rowCounter">

						<div class="panel panel-info col-md-8">
							<div class="panel-body">
								<h5>
									<span class="glyphicon glyphicon-user"></span>
									&nbsp;${var.replier_name }&nbsp;于
									<fmt:formatDate value="${var.reply_time}"
										pattern="YYYY/MM/dd HH:mm" />
									&nbsp;回复到:
								</h5>
								<p class="bg-primary">${var.reply_msg}</p>
							</div>
						</div>

					</c:forEach>

				</div>
			</div>


			<form:form modelAttribute="ticketReplyQuery" method="post"
				action="createReply.html?id=${ticket.id}&userLevel=${ticket.operate}"
				cssClass="form-inline" role="form">



				<c:if
					test="${ticket.status_code !='40'&& (ticket.operate =='super'||ticket.status_code =='10'|| ticket.status_code =='20')}">
					<div class="row myrow">
						<div class="col-sm-8">
							<form:textarea path="reply_msg" class="form-control" rows="3"></form:textarea>
						</div>
					</div>

					<div class="row myrow">
						<div class="col-md-12">
							<div class="col-md-3">
								<h4>当前回复人 : &nbsp; ${username} &nbsp;</h4>
							</div>
							<div class="col-md-9">
								<button type="submit" class="btn btn-success btn-sm ">回&nbsp;&nbsp;复</button>
							</div>
						</div>
					</div>

				</c:if>
			</form:form>

			<form:form modelAttribute="ticket" method="post"
				action="updateTicket.html?id=${ticket.id}&userLevel=${ticket.operate}"
				cssClass="form-inline" role="form">

				<div class="row myrow">
					<div class="col-md-8">
						<c:choose>
							<c:when
								test="${ticket.status_code !='40'&& (ticket.operate =='super'||ticket.status_code =='10'|| ticket.status_code =='20')}">

								<div class="col-md-2">
									<h4>Ticket状态:</h4>
								</div>
								<div class="col-md-3">
									<form:select path="status_code"
										items="${applicationScope.ticketStatusMap}"
										cssClass="form-control input-sm" />
								</div>

								<c:if test="${ticket.operate =='super'}">
									<div class="col-md-2">
										<h4>分配处理客服:</h4>
									</div>
									<div class="col-md-3">
										<form:select path="processor_id"
											items="${applicationScope.normUserMap}"
											cssClass="form-control input-sm" />
									</div>
								</c:if>

								<div class="col-md-2">
									<button type="submit" class="btn btn-success btn-sm">提交</button>
								</div>
							</c:when>
							<c:otherwise>

								<div class="col-md-4">
									<h4>
										Ticket状态:
										<c:set var="status_code" value="${ticket.status_code}" />
										${applicationScope.ticketStatusMap[status_code]}
									</h4>
								</div>

								<c:if test="${ticket.status_code == '40'}">
									<div class="col-md-4">
										<h4>
											完成时间 ：
											<fmt:formatDate value="${ticket.close_at}"
												pattern="YYYY/MM/dd HH:mm" />
										</h4>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</form:form>
			<form:form modelAttribute="ticket" method="post"
				action="reOpenTicket.html?id=${ticket.id}&userLevel=${ticket.operate}"
				cssClass="form-inline" role="form">
				<div class="row myrow">
					<div class="col-md-8">
						<c:if
							test="${ticket.status_code == '40'&& ticket.operate =='super'}">
							<div class="col-md-2">
								<button id="reopenButton" type="submit"
									class="btn btn-success btn-sm">重启Ticket</button>
							</div>
						</c:if>
					</div>
				</div>
			</form:form>


		</div>
		<!-- content over -->

	</div>
	<%@include file="/WEB-INF/jsp/inc/loadjs.jsp"%>
	<script src="/js/ui/jquery.ui.core.js"></script>
	<script src="/js/ui/jquery.ui.widget.js"></script>
	<script src="/js/ui/jquery.ui.datepicker.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>
	<script type="text/javascript" src="/js/tinymce/tinymceinit.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

		});
		
	</script>

</body>
</html>