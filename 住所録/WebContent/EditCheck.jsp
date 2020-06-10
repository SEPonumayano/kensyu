<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.ResultSet"%>
<%
request.setCharacterEncoding("UTF-8");
String name =(String) request.getAttribute("name");
String address =(String) request.getAttribute("address");
String tel =(String) request.getAttribute("tel");
String categoryid =(String) request.getAttribute("categoryid");
String id=(String)request.getAttribute("id");

Common aa=new Common();
aa.SetCategoryid(categoryid);
categoryid=aa.GetCategoryid();

ResultSet rs=null;
String categoryname=aa.getCategoryName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>住所録編集確認</title>
</head>
<body>
<p>住所録管理システム：住所録編集</p><br/><br/>
<form  class="item" action="EditComitBL" method="post">
<dl>
<dt>名前：
<dd><%=name%></dd>
<dt>住所：</dt>
<dd><%=address%></dd>
<dt>電話番号：</dt>
<dd><%=tel%><dd>
<dt>カテゴリー：</dt>
<dd><%=categoryname %></dd>
</dl>
<div class="button_wrapper">
<INPUT name="name" type="hidden" value=<%=name%>>
<INPUT name="address" type="hidden" value=<%=address%>>
<INPUT name="tel" type="hidden" value=<%=tel%>>
<INPUT name="categoryid" type="hidden" value=<%=categoryid%>>
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="完了"/>
<button type="submit" formaction="Edit.jsp">戻る</button>
</div>
</form>
</body>
</html>