<%@ page import="user.user_reg" %><%--
  Created by IntelliJ IDEA.
  User: Tay
  Date: 2019/11/3
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
    <script>
        $("#count").html("0");
        function OnInput(event, length, id) {

            if(event.srcElement.value.length <= length) {
                $("#" + id ).html(event.srcElement.value.length);
            } else {
                //$.toptip("内容过长，最多" + length + "字", 'warning');
                alert("字数最多为"+length+"个");
                /*获取输入框id值*/
                var id2 = event.srcElement.id;
                /*超出规定长度后禁止继续输入*/
                var value = event.srcElement.value.substring(0, length);
                $("#" + id2).val(value);
            }

        }
        // 此方法仅适用于IE浏览器
        function OnPropChanged(event, length, id) {

            if(event.srcElement.value.length <= length) {
                $("#" + event.srcElement.id).html(event.srcElement.value.length);
            } else {
                //$.toptip("内容过长，最多" + length + "字", 'warning');
                alert("字数最多为"+length+"个");
                /*获取输入框id值*/
                var id3 = event.srcElement.id;
                /*超出规定长度后禁止继续输入*/
                var value = event.srcElement.value.substring(0, length);
                $("#" + id3).val(value);
            }

        }
        //.replace(/&/g,"&amp;")
        //下面两方法用于转义，防代码注入
        function replaceStr(a) {
            a = a.replace(/(<[^>]*>| |\s*)/g, '')
                .replace(/"/g,"&quot;")
                .replace(/'/g,"&#39;")
                .replace(/</g,"&lt;")
                .replace(/>/g,"&gt;");
            return a;
        }
        function rpls(event,id) {
            var input_value=replaceStr(event.srcElement.value.toString());
            $("#"+id).val(input_value);
        }
    </script>
</head>
<body>
<%
    user_reg user =(user_reg) request.getAttribute("user_info");
    session.setAttribute("user",user);
%>
<a href="${pageContext.request.contextPath}/jsp/invitation.jsp">进入论坛界面</a>

<!-- 帖子提交表单 -->
<div class="container">
    <form action="${pageContext.request.contextPath}/servlet.ReplyServlet" >
        <div class="row">
            <p>输入标题：<input type="text" name = "post_topic" id="post_topic "  placeholder="请输入5字以内的标题" maxlength="5" onchange="rpls(event,'post_topic')" ></p>
            <p>输入内容：<textarea class="form-control" rows="3" name="post_message" id="post_message" placeholder="请输入100以内字的内容" maxlength="100" onchange="rpls(event,'post_message')"></textarea></p>
            <% session.setAttribute("user_id",user.getAcount());%>
            <input type="submit" value="发表帖子" style="text-align: right"/>
        </div>
    </form>
</div>
</body>
</html>
