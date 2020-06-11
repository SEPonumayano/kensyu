<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String name =(String) request.getAttribute("name");
String address =(String) request.getAttribute("address");
String tel =(String) request.getAttribute("tel");
String categoryid =(String) request.getAttribute("categoryid");

Common dd=new Common();
dd.SetCategoryid(categoryid);
categoryid=dd.GetCategoryid();

ResultSet rs=null;
String categoryname=dd.getCategoryName();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>住所録登録確認</title>
</head>
<body>
<div id="site-box">
<p>住所録管理システム：住所録登録</p>
<form class="item" action="AddComitBL" method="post">
<dl>
<dt>名前：</dt>
<dd><%=name%></dd>
<dt>住所：</dt>
<dd><%=address%></dd>
<dt>電話番号：</dt>
<dd><%=tel%></dd>
<dt>カテゴリー：</dt>
<dd><%=categoryname%></dd>
</dl>
<br/>
<div class="button_wrapper">
<INPUT name="name" type="hidden" value=<%=name%>>
<INPUT name="address" type="hidden" value=<%=address%>>
<INPUT name="tel" type="hidden" value=<%=tel%>>
<INPUT name="categoryid" type="hidden" value=<%=categoryid%>>
<input type="submit" value="完了" style="width:250px;height:20px;">
<button type="submit" formaction="Add.jsp" style="width:250px;height:20px;">戻る</button>
</div>
</form>
</div>
</body>
</html>