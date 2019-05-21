<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">2017202085</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- penel-heading -->

			<div class="panel-body">
				<form role="form" action="/board/register" method="post">
					
					<div class="form-group">
						<label>Title</label><input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label><input class="form-control" name='writer'>
					</div>
					
					<button id="SubmitBtn" type="submit" class="btn btn-default">
						Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
					<button id="ListBtn" class="btn btn-default">List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var Formobj = $("form[role='form']");

		$("#ListBtn").on("click", function() {
			Formobj.attr("action", "/board/list");
			Formobj.attr("method", "get");
			Formobj.submit();
		});

		$("#SubmitBtn").on("click", function() {
			if ($("input[name=title]").val() == "") {
				alert("[제목을 입력하세요!]");
				$("input[name='title']").focus();
				return false;
			}
			if ($("input[name=content]").val() == "") {
				alert("내용을 입력하세요!");
				$("input[name='content']").focus();
				return false;
			}
			if ($("input[name='writer']").val() == "") {
				alert("이름을 입력하세요!");
				$("input[name='writer']").focus();
				return false;
			}
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>