<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.ResultSet" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");
List<String> errmsg =(List<String>) request.getAttribute("errmsg");

Common de =new Common();
ResultSet rs=null;
rs=de.getCategoryAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>住所録登録</title>
</head>
<body>
<div id="site-box">
<p>住所録管理システム：住所録登録</p>
<form class="item" action="AddBL" method="post">
<dl>
<dt>名前*：</dt>
<dd><input name="name" type="text" value="" style="width:250px"></dd>
<dt>住所*：</dt>
<dd><input name="address" type="text" value="" style="width:500px"></dd>
<dt>電話番号：</dt>
<dd><input name="tel" type="tel" maxlength="13" value=""style="width:250px"></dd>
<dt>カテゴリー：</dt>
<dd><select name="categoryid" style="width:250px">
<%
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} %>
</select>
</dd>
</dl>
<br/>
<div class="err">
<%if(errmsg != null){ %>
<%=errmsg%><br/>
<%} %>
</div>
<br/>
<div class="button_wrapper">
<input type="submit" value="確認" style="width:250px;height:20px;" >
<button type="submit" formaction="ListBL" style="width:250px;height:20px;">戻る</button>
</div>
</form>
</div>
</body>
</html>