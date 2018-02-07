<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>问答列表</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
<!-- 菜单 -->
<div align="center"><h2>在线问答</h2></div>
<div align="center"><a href="${pageContext.request.contextPath}/ask.jsp"><h3>我要提问</h3></a></div>
<!-- 主题列表 -->
<table id="table" align="center" width="700px">
    <!--显示表头-->
    <tr class="title">
        <td width="25">序号</td>
        <td width="25">问题</td>
        <td width="50">回复次数</td>
        <td width="140">最后修改</td>
    </tr>
    <!-- 显示列表 -->
    <c:forEach items="${questions }" var="q" varStatus="var">
        <tr class="data">
            <td class="num">${var.count}</td>
            <td><a href="${pageContext.request.contextPath}/question/findById.do?id=${q.id}">${q.issue}</a></td>
            <td class="info">${q.number}</td>
            <td class="info"><fmt:formatDate value="${q.lastRevise}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
        </tr>
    </c:forEach>

</table>
<script type="text/javascript" src="../jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("tr:even").css("background","orange")
        $("#table tr td:nth-child(3)").each(function() {
            if(parseFloat($(this).text()) == 0) {
                $(this).parent().css("background", "#f00");
            }
        });
    });

    /*或者*/
    /*$(function () {
        $("tr:odd").css("background","grey")
    });
    $("#table tr td").each(function () {
        $tr=$(this);
        $td=$("td",$tr);
        if(parseFloat($(this).text()) == 0){
            $tr.parent().css("background","red");
        }
    });*/
</script>
</body>
</html>

