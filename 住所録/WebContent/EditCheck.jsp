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
<title>住所録編集確認</title>
</head>
<body>
<form action="EditComitBL" method="post">
住所録管理システム：住所録編集<br/><br/>
名前：<%=name%><br/>
住所：<%=address%><br/>
電話番号：<%=tel%><br/>
カテゴリー：<%=categoryname %><br/>
<INPUT name="name" type="hidden" value=<%=name%>>
<INPUT name="address" type="hidden" value=<%=address%>>
<INPUT name="tel" type="hidden" value=<%=tel%>>
<INPUT name="categoryid" type="hidden" value=<%=categoryid%>>
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="完了"/>
<button type="button" onclick="history.back();">戻る</button>
</form>
</body>
</html>