<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<sec:authentication var="mvo" property="principal" />  

  <form action="${pageContext.request.contextPath}/registerQNA.do" method="post" id="register_form">
  <sec:csrfInput />
 <table class="table" >
    <tr>
	    <td>제목 &nbsp;&nbsp;
	     <input type="text" name="qnaTitle" placeholder="질문 제목을 입력하세요" required="required">
	    </td>
	    <td>
	    	<%-- 작성자 &nbsp;: &nbsp;${mvo.usrId}  --%>
	    </td>
    </tr>   
    <tr>
     <td>     
     <textarea cols="90" rows="15" name="qnaContent" required="required" placeholder="질문 내용을 입력하세요"></textarea>
     </td>
    </tr> 
     </table>    
     <div class="btnArea">
     <button type="submit" class="btn" >확인</button>  
     <input type="hidden" value="java" name="UserVO.usrId">
     <button type="reset" class="btn" >취소</button>   
    </div>  
  </form>