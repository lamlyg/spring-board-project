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
			<div class="panel-heading">Board Read Page</div>
			<!-- penel-heading -->

			<div class="panel-body">

				<div class="form-group">
					<label>Bno</label> <input class="form-control" name='bno'
						value='<c:out value="${board.bno }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>Title</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name='content'
						readonly="readonly">
				<c:out value="${board.content }" /></textarea>
				</div>

				<div class="form-group">
					<label>Writer</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>

				<button id="ModiBtn" class="btn btn-default">Modify</button>
				<button id="ListBtn" class="btn btn-default"
					onclick="location.href='/board/list'">List</button>
				<button id="DelBtn" class="btn btn-default">Delete</button>
			</div>

			<form id="Form" method="post">
				<input type="hidden" name="bno" value="${board.bno}">
			</form>

		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		var Formobj = $("Form");

		$("#ModiBtn").on("click", function() {
			Formobj.attr("action", "/board/modify");
			Formobj.attr("method", "get");
			Formobj.submit();
		});

		$("#ListBtn").on("click", function() {
			self.location="/board/list";
		});
		
		$("#DelBtn").on("click",function(){
			Formobj.attr("action","/board/remove");
			Formobj.submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>