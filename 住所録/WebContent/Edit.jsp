<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="住所録.Common" import="java.sql.ResultSet" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String name=(String)request.getParameter("name");
String address=(String)request.getParameter("address");
String tel=(String)request.getParameter("tel");
String categoryname=(String)request.getParameter("categoryname");
String categoryid=request.getParameter("categoryid");

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
<div id="site-box">
<p>住所録管理システム：住所録編集</p>
<form  class="item" action="EditBL" method="post">
<dl>
<dt>名前*：</dt>
<dd><input name="name" type="text" value="<%=name %>" style="width:250px"></dd>
<dt>住所*：</dt>
<dd><input name="address" type="text" value="<%=address %>" style="width:500px"></dd>
<dt>電話番号：</dt>
<dd><input name="tel" type="tel" maxlength="13" value="<%=tel %>" style="width:250px"></dd>
<dt>カテゴリ：</dt>
<dd><select name="categoryid" >
<%
while(rs.next()){
	if(rs.getString("categoryid").equals(categoryid)){
%>
<option value="<%=rs.getString("categoryid")%>" selected><%=rs.getString("categoryname")%></option>
<%
	}else{
%>
<option value="<%=rs.getString("categoryid")%>"><%=rs.getString("categoryname")%></option>
<%} 
}%>
</select></dd>
</dl>
<br/>
<div class="err">
<%if(errmsg != null){ %>
<%=errmsg%><br/>
<%} %>
</div>
<br/>
<div class="button_wrapper">
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="確認" style="width:250px;height:20px;">
<button type="submit" formaction="ListBL" style="width:250px;height:20px;">戻る</button>
</div>
</form>
</div>
</body>
</html>