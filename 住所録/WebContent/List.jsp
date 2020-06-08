<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList" %>
<%
List<String> id =(List<String>) request.getAttribute("id");
List<String> name =(List<String>) request.getAttribute("name");
List<String> address =(List<String>) request.getAttribute("address");
List<String> tel =(List<String>) request.getAttribute("tel");
List<String> categoryname =(List<String>) request.getAttribute("categoryname");
List<String> categoryid =(List<String>) request.getAttribute("categoryid");

String listCnt =(String) request.getAttribute("listC");
String nowPage =(String) request.getAttribute("noww");
int listC= Integer.parseInt(listCnt);
int now= Integer.parseInt(nowPage);

int maxPage=listC/10;

if(maxPage%10 !=0){
	maxPage=maxPage+1;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="NewFile.css">
<title>Insert title here</title>
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
  for(int i=0;i<id.size();i++){
%>
<form name="<%=i+1 %>" method="post">
<tr>
<td><%=i+1 %></td>
<td><%=name.get(i) %></td>
<td><%=address.get(i) %></td>
<td><%=tel.get(i) %></td>
<td><%=categoryname.get(i) %></td>
<INPUT name="id" type="hidden" value=<%=id.get(i)%>>
<INPUT name="name" type="hidden" value=<%=name.get(i)%>>
<INPUT name="address" type="hidden" value=<%=address.get(i)%>>
<INPUT name="categoryid" type="hidden" value=<%=categoryid.get(i)%>>
<!--
<td><button type="submit" formaction="Edit.jsp">編集</button></td>
<td><button type="submit" formaction="Delete.jsp">削除</button></td>
 -->
 <td><INPUT type="submit" formaction="Edit.jsp">編集</td>
 <td><INPUT type="submit" formaction="Delete.jsp">削除</td>

</tr>
</form>

<%
  }
%>
</table>
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
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
</body>
</html>