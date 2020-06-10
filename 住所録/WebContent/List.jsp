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
<p>住所録管理システム：住所録一覧</p><br/>
<br/>
<div class="box">
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
<form action="ListBL" method="get">
<input name="SerchName" type="text" value="" />
<input type="submit" value="検索" />
</form>
</div>
<br/>
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


<!-- ページング -->
<form action="ListBL" method="get">
<%
//1ページのみ
if(maxPage==1){
%>
＜＜
|
＜

1

＞
|
＞＞

<%
//2ページ分、1ページ目
}else if(maxPage==2 && now==1){
%>
＜＜
|
＜
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//2ページ分、最終ページ
}else if(maxPage==2 && now==maxPage){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>
<%=now %>
＞
|
＞＞


<%
//3ページ分、1ページ目
}else if(maxPage==3 && now==1){
%>
＜＜
|
＜
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//3ページ分、2ページ目
}else if(maxPage==3 && now==2){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%="1"%></a>
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//3ページ分、最終ページ
}else if(maxPage==3 && now==maxPage){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>
<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<%=now %>
＞
|
＞＞

<%
//4ページ分、1ページ目
}else if(maxPage==4 && now==1){
%>
＜＜
|
＜
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>
<a href="ListBL?Page=<%=now+3%>"><%=now+3%></a>

<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//4ページ分、2ページ目
}else if(maxPage==4 && now==2){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%="1"%></a>
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%//4ページ分、3ページ目
}else if(maxPage==4 && now==3){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>
<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//4ページ分、最終ページ
}else if(maxPage==4 && now==maxPage){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-3%>"><%=now-3%></a>
<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>

<%=maxPage %>

＞
|
＞＞

<%
//複数ページ5以上、1ページ目
}else if(maxPage>4 && now==1){
%>
＜＜
|
＜

<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>
<a href="ListBL?Page=<%=now+3%>"><%=now+3%></a>
<a href="ListBL?Page=<%=now+4%>"><%=now+4%></a>

<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//複数ページ5以上、2ページ目
}else if(maxPage>4 && now==2){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-1%>"><%="1"%></a>
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>
<a href="ListBL?Page=<%=now+3%>"><%=now+3%></a>

<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>

<%
//複数ページ5以上最後から2ページ目
}else if(maxPage>4 && now ==maxPage-1){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>

<a href="ListBL?Page=<%=now-3%>"><%=now-3%></a>
<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>
<%=now %>
<a href="ListBL?Page=<%=now-1%>"><%=now+1%></a>

<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>
<%
//複数ページ5以上最後のページ
}else if(maxPage>4 && now == maxPage){
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>
<a href="ListBL?Page=<%=now-4%>"><%=now-4%></a>
<a href="ListBL?Page=<%=now-3%>"><%=now-3%></a>
<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>

<%=maxPage %>

＞
|
＞＞
<%
}else{
%>
<a href="ListBL?Page=1"><%="＜＜"%></a>
|
<a href="ListBL?Page=<%=now-1%>"><%="＜"%></a>

<a href="ListBL?Page=<%=now-2%>"><%=now-2%></a>
<a href="ListBL?Page=<%=now-1%>"><%=now-1%></a>
<%=now %>
<a href="ListBL?Page=<%=now+1%>"><%=now+1%></a>
<a href="ListBL?Page=<%=now+2%>"><%=now+2%></a>

<a href="ListBL?Page=<%=now+1%>"><%="＞"%></a>
|
<a href="ListBL?Page=<%=maxPage%>"><%="＞＞"%></a>
<%} %>
</form>
<form action="Add.jsp" method="get">
<input type="submit" value="新規登録" />
</form>
</body>
</html>