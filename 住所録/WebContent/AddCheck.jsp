<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.ResultSet"%>
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
<title>住所録登録確認</title>
</head>
<body>
<form action="AddComitBL" method="post">
住所録管理システム：住所録登録<br/><br/>
名前：<%=name%><br/>
住所：<%=address%><br/>
電話番号：<%=tel%><br/>
カテゴリー：<%=categoryname %><br/>
<INPUT name="name" type="hidden" value=<%=name%>>
<INPUT name="address" type="hidden" value=<%=address%>>
<INPUT name="tel" type="hidden" value=<%=tel%>>
<INPUT name="categoryid" type="hidden" value=<%=categoryid%>>
<input type="submit" value="完了"/>
<button type="button" onclick="history.back();">戻る</button>
</form>

</body>
</html>