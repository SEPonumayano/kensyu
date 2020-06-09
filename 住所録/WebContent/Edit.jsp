<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="住所録.Common" import="java.sql.ResultSet" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String name=(String)request.getParameter("name");
String address=(String)request.getParameter("address");
String tel=(String)request.getParameter("tel");
String categoryname=(String)request.getParameter("categoryname");
String categoryid=(String)request.getParameter("categoryid");

List<String> errmsg =(List<String>) request.getAttribute("errmsg");
Common dee =new Common();
ResultSet rs=null;
rs=dee.getCategoryAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>住所録編集</title>
</head>
<body>
<form action="EditBL" method="post">
住所録管理システム：住所録編集<br/><br/>
名前*：<input name="name" type="text" value=<%=name %> ><br/>
住所*：<input name="address" type="text" value=<%=address %> ><br/>
電話番号：<input name="tel" type="tel" maxlength="13" value=<%=tel %>><br/>
カテゴリー：<select name="categoryid" >
<%
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} %>
</select><br/>
<%if(errmsg != null){ %>
<%=errmsg%><br/>
<%} %>
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="確認"/>
<button type="submit" formaction="ListBL">戻る</button>
</form>
</body>
</html>