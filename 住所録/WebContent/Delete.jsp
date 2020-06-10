<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.*" %>
<!-- ListBLにつなげたら String id=(String)request.getAttribute("id"); -->
<%
request.setCharacterEncoding("UTF-8");

String id=request.getParameter("id");
String name=(String)request.getParameter("name");
String address=(String)request.getParameter("address");
String tel=(String)request.getParameter("tel");
String categoryname=(String)request.getParameter("categoryname");
String categoryid=(String)request.getParameter("categoryid");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>Insert title here</title>
</head>
<body>
<p>住所録管理システム：住所録削除</p>
<form  class="item" action="DeleteComitBL" method="post">
<dl>
<dt>名前:</dt>
<dd><%=name%></dd>
<dt>住所:</dt>
<dd><%=address%></dd>
<dt>電話番号:</dt>
<dd><%=tel%></dd>
<dt>カテゴリー:</dt>
<dd><%=categoryid%></dd>
</dl>
<div class="button_wrapper">
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="OK"/>
<button type="submit" formaction="ListBL">戻る</button>
</div>
</form>
</body>
</html>