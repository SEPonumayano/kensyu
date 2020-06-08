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
<title>住所録登録</title>
</head>
<body>
<form action="AddBL" method="post">
住所録管理システム：住所録登録<br/><br/>
名前*：<input name="name" type="text" value="" /><br/>
住所*：<input name="address" type="text" value="" /><br/>
電話番号：<input name="tel" type="tel" maxlength="13" value=""/><br/>
カテゴリー：<select name="categoryid">
<%
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} %>
</select><br/>
<%if(errmsg != null){ %>
<%=errmsg%><br/>
<%} %>
<input type="submit" value="確認"/>
<button type="button" onclick="history.back();">戻る</button>
</form>
</body>
</html>