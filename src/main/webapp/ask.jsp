<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>提问列表</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<!-- 菜单 -->
<div align="center"><h2>我要提问</h2></div>
<div align="center"><a href="${pageContext.request.contextPath}/question/list.do"><h3>返回首页</h3></a></div>
<!-- 发表回复表单 -->
<form id="replyForm" action="${pageContext.request.contextPath}/question/addQu.do" method="post">
 <input type="hidden" name="number">
    <table align="center">
        <tr>
            <td class="label">问题：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" name="issue" id="title"/><span id="message"></span></td>
        </tr>
        <tr>
        <td>问题描述：<textarea name="detail" id="content"></textarea></td>
        </tr>

        <tr>
            <td align="center"><input id="check" type="button" value="保存问题" onclick="open_win()"/></td>
        </tr>
    </table>
</form>
<script type="text/javascript" src="jquery-1.10.2.min.js"></script>
<script language="javascript">
    function open_win()
    {
        //获取ID为'airline'的元素，并判断内容是否会空
        if (document.getElementById('title').value=='')
        {
            alert('不能为空');
            return ;
        }else {
            $("form").submit();
        }
    }

</script>
<%--<script type="text/javascript">
    function open_win()
    {
        $.ajax({
            url:"question/addQu.do",
            data:$("#replyForm").serialize(),
            method:"post",
            success:function (data) {
                var title=$("#title").val();
                if(title==null){
                    alert("必须填写问题");
                    return ;
                }
            }
        })

    }
</script>--%>


</body>
</html>
