<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List" import="java.util.Arrays" import="java.util.ArrayList" %>
<%
List<String> id =(List<String>) request.getAttribute("id");
List<String> name =(List<String>) request.getAttribute("name");
List<String> address =(List<String>) request.getAttribute("address");
List<String> tel =(List<String>) request.getAttribute("tel");
List<String> categoryname =(List<String>) request.getAttribute("categoryname");

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
<title>Insert title here</title>
</head>
<body>
住所録管理システム：住所録一覧<br/>
<br/>
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
<form action="ListBL" method="get">
<input name="SerchName" type="text" value="" />
<input type="submit" value="検索" />
</form>
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
<tr>
<td><%=i+1 %></td>
<td><%=name.get(i) %></td>
<td><%=address.get(i) %></td>
<td><%=tel.get(i) %></td>
<td><%=categoryname.get(i) %></td>
<td><form action="Edit.jsp" method="get">
<INPUT name="id" type="hidden" value=<%=id.get(i)%>>
<input type="submit" value="編集" /></form></td>
<td><form action="Delete.jsp" method="get">
<INPUT name="id" type="hidden" value=<%=id.get(i)%>>
<input type="submit" value="削除" /></form></td>
</tr>
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