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
         <div class="panel-heading">Board List page
         	<button id='regBtn' type="button" onclick="location.href='/board/register'" class="btn btn-xs pull-right">
         	Register New Board</button><!-- 글 등록 링크 처리를 위한 버튼 -->
         </div>

         <div class="panel-body">
            <table class="table table-striped table-bordered table-hover">
               <thead>
                  <tr>
                     <th>#번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>
                     <th>수정일</th>
                  </tr>
                  <c:forEach items="${list}" var="board">
                     <tr>
                        <td><c:out value="${board.bno}" /></td>
                        <td><a class='move' href='<c:out value = "${board.bno}"/>'>
                              <c:out value="${board.title}" />
                        </a></td>

                        <td><c:out value="${board.writer}" /></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                              value="${board.regdate }" /></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd"
                              value="${board.updateDate }" /></td>
                     </tr>
                  </c:forEach>
               </thead>
            </table>
         </div>
      </div>
   </div>
</div>
<%@ include file="../includes/footer.jsp"%>
