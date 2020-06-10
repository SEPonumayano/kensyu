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
<p>住所録管理システム：住所録編集</p>
<form  class="item" action="EditBL" method="post">
<dl>
<dt>名前*：</dt>
<dd><input name="name" type="text" value=<%=name %> style="width:150px"></dd>
<dt>住所*：</dt>
<dd><input name="address" type="text" value=<%=address %> style="width:300px"></dd>
<dt>電話番号：</dt>
<dd><input name="tel" type="tel" maxlength="13" value=<%=tel %> style="width:150px"></dd>
<dt>カテゴリー：</dt>
<dd><select name="categoryid" >
<%
while(rs.next()){
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} %>
</select></dd>
</dl>
<%if(errmsg != null){ %>
<%=errmsg%><br/>
<%} %>
<div class="button_wrapper">
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="確認"/>
<button type="submit" formaction="ListBL">戻る</button>
</div>
</form>
</body>
</html>