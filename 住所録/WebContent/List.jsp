<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList" import="java.sql.*" import="java.util.regex.Matcher" import="java.util.regex.Pattern"%>
<%
String listCnt =(String) request.getAttribute("listCnt");
String nowPage =(String) request.getAttribute("page");
int listC= Integer.parseInt(listCnt);
int now= Integer.parseInt(nowPage);

int maxPage=listC/10;

if(maxPage%10 !=0){
	maxPage=maxPage+1;
}

ResultSet rs= (ResultSet) request.getAttribute("rs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>住所録一覧</title>
</head>
<body>
<h1>住所録管理システム：住所録一覧</h1><br/>
<br/>
<div>
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
<form action="ListBL" method="get">
<input name="SerchName" type="text" value="" />
<input type="submit" value="検索" />
</form>
</div>
<br/>
<a href="ListBL?Page=1"><%="<<"%></a>
<a href="ListBL?Page=<%=now-1%>"><%="<"%></a>
<%
  for(int j=1;j<=maxPage;j++){
%>
<a href="ListBL?Page=<%=j%>"><%=j%></a>
<%
}
%>
<a href="ListBL?Page=<%=now+1%>"><%=">"%></a>
<a href="ListBL?Page=<%=maxPage%>"><%=">>"%></a>
<br/>
<table border="1">
<tr>
<th>No</th>
<th>名前</th>
<th>住所</th>
<th>電話番号</th>
<th>カテゴリ</th>
</tr>
<%
while(rs.next()){
%>
<form name="<%=rs.getString("id")%>" method="post" accept-charset="UTF-8">
<tr>
<td><%=rs.getRow()+(now - 1) * 10%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("address")%></td>
<%
Pattern p = Pattern.compile("(\\d{3})(\\d{4})(\\d{4})");
Matcher m = p.matcher(rs.getString("tel"));
String tel1 = m.replaceAll("$1-$2-$3");
%>
<td><%=tel1%></td>
<td><%=rs.getString("categoryname")%></td>
<INPUT name="id" type="hidden" value=<%=rs.getString("id")%>>
<INPUT name="name" type="hidden" value=<%=rs.getString("name")%>>
<INPUT name="tel" type="hidden" value=<%=tel1%>>
<INPUT name="address" type="hidden" value=<%=rs.getString("address")%>>
<INPUT name="categoryid" type="hidden" value=<%=rs.getString("categoryid")%>>

<td><button type="submit" formaction="Edit.jsp">編集</button></td>
<td><button type="submit" formaction="Delete.jsp">削除</button></td>
</tr>
</form>

<%
  }
%>
</table>
<form action="ListBL" method="get">
<a href="ListBL?Page=1"><%="<<"%></a>
<a href="ListBL?Page=<%=now-1%>"><%="<"%></a>
<%
  for(int j=1;j<=maxPage;j++){
%>
<a href="ListBL?Page=<%=j%>"><%=j%></a>
<%
}
%>
<a href="ListBL?Page=<%=now+1%>"><%=">"%></a>
<a href="ListBL?Page=<%=maxPage%>"><%=">>"%></a>
</form>
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
</body>
</html>