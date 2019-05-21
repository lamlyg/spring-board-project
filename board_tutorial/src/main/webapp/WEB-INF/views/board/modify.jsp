<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">2017202085</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!--  /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify Page</div>
			<!--  /.panel-heading -->
			<div class="panel-body">

				<form role="form" method="post" action="/board/modify">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value="${board.bno }" readonly="readonly" />
					</div>
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value="${board.title }">
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'>
						<c:out value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value="${board.writer}" readonly="readonly">
					</div>
					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name='regDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>Update Date</label> <input class="form-control"
							name='updateDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'
							readonly="readonly">
					</div>
					
				<button id="ModiBtn" class="btn btn-default">Modify</button>
				<button id="ListBtn" class="btn btn-default">List</button>
				</form>
			</div>
			<!-- <form id="Form" method="post">
	 				<input type="hidden" name="bno" value="${board.bno}"> -->
		</div>
		<!--  end panel-body -->
	</div>
	<!--  end panel-body -->
</div>
<!--  end panel -->

<!--  /.row -->

<script>
	$(document).ready(function() {
		$("#ListBtn").on("click", function() {
			var formobj = $("form[role='form']");
			formobj.attr("action", "/board/list");
			formobj.attr("method", "get");
			formobj.submit();
		});
		$("#ModiBtn").on("click", function() {
			if ($("input[name=title]").val() == "") {
				alert("제목을 입력하세요!");
				$("input[name='title']").focus();
				return false;
			}
			if ($("input[name=content]").val() == "") {
				alert("내용을 입력하세요!");
				$("input[name='content']").focus();
				return false;
			}
			return true;
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>