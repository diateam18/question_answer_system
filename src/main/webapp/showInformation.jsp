<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>详情</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">

</head>
<body >
<!-- 显示主题 -->
<div>
    问题：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${question.issue}<br/>
    问题描述：${question.detail}
</div>

<!-- 显示回复列表 -->
<div id="repdiv">
    网友回答:</br>
    <table >
             <tr>
                 <c:forEach items="${answerList }" var="a">
                    <tr><fmt:formatDate value="${a.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></tr>
                    <br/>${a.content}</br>
                 </c:forEach>
             </tr>
    </table>

</div>

<!-- 发表回复表单 -->
    <form id="replyForm">
        <input type="hidden" value="${question.id}" name="questionId"/>
        <table class="publishArticleForm" style="border-spacing: 0px 10px;">
            <tr>
                我来回答:
            <textarea name="content" id="content"></textarea><span id="message"></span>
            </tr>
            <tr>
                <td><input type="button" value="提交答案" onclick="reply()"/>
                    <a href="../question/list.do"><input type="button" value="返回首页"/></a>
                </td>
            </tr>
        </table>
    </form>

<script type="text/javascript" src="../jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    function reply() {
        var content=$("#content").val();
        if (content==""){
            $("#message").html("请填写内容");
            return ;
        }
        $.ajax({
            url:"add.do",
            data:$("#replyForm").serialize(),
            method:"post",
            success:function (data) {
                if (data.status){
                    var date=new Date(data.reply.createTime);
                    var str='<div style="background:grey;margin-top: 20px"> 网友回答：'
                    +date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"<br/>"+data.reply.content+"</div>";
                    $("#repdiv").prepend(str)
                }else {
                    $("#message").html(data.msg);
                }
            }
        })
    }
</script>
</body>
</html>
