<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="住所録.Common" import="java.sql.*" %>
<!-- ListBLにつなげたら String id=(String)request.getAttribute("id"); -->
<%
request.setCharacterEncoding("UTF-8");
String id=(String)request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="DeleteComitBL" method="post">
住所録管理システム：住所録消去<br/><br/>
<%
Connection connect =null;
ResultSet rs=null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    connect=DriverManager.getConnection( "jdbc:mysql://localhost/testdb?serverTimezone=JST","root","");
    Statement stmt = connect.createStatement();
    System.out.println("接続おｋ");

    String getQuery = "SELECT * FROM testdb.jyusyoroku where id='"+id+"'";
    PreparedStatement ps =connect.prepareStatement(getQuery);
    rs =ps.executeQuery();

    rs.next(); %>
    名前:<%=rs.getString("name")%><br/>
    住所:<%=rs.getString("address")%><br/>
    電話番号:<%=rs.getString("tel")%><br/>
    カテゴリー:<%=rs.getString("categoryid")%><br/>

<%} catch(ClassNotFoundException e) {
	System.out.println("クラスが見つかりません");
} catch (SQLException e) {
	System.out.println("データ検索に失敗しました");
}%>
<INPUT name="id" type="hidden" value=<%=id%>>
<input type="submit" value="OK"/>
<button type="button" onclick="history.back();">戻る</button>
</form>
</body>
</html>