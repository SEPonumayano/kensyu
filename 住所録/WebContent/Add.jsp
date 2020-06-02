<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.ResultSet"%>
<%
request.setCharacterEncoding("UTF-8");
String errmsg =(String) request.getAttribute("errmsg");
String errrmsg =(String) request.getAttribute("errrmsg");
String errrrmsg =(String) request.getAttribute("errrrmsg");
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
電話番号：<input name="tel" type="tel" maxlength="11" value=""/><br/>
カテゴリー：<select name="categoryid">
<option value="0">  </option>
<%
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} %>
</select><br/>
<%=errmsg%><br/>
<%=errrmsg%><br/>
<%=errrrmsg%><br/>

<input type="submit" value="確認"/>
<button type="button" onclick="history.back();">戻る</button>
</form>
</body>
</html>