package 住所録;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListBL
 */
public class ListBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		Connection connect =null;
    	ResultSet rs=null;
    	
    	String SerchName=request.getParameter("SerchName");
    	String Page=request.getParameter("Page");
    	
    	String nowPage="";
    	if(Page != null) {
    		nowPage=Page;
    	}else {
    		nowPage="1";
    	}
    	System.out.println(nowPage+"ページ目");
    	
    	int now= Integer.parseInt(nowPage);
    	System.out.println(now);
    	int limitSta= (now-1)*10;
    	
    	if(SerchName == null) {
    		SerchName="";
    	}

        String user="root";
        String password ="";
        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        connect=DriverManager.getConnection( url,user,password);
	        //Statement stmt = connect.createStatement();
	        System.out.println("接続おｋk");
	        
	        //件数確認
	        //String CntQuery="SELECT COUNT(*)FROM testdb.jyusyoroku WHERE is_deleted=true";
	        String CntQuery="SELECT COUNT(*)FROM onuma.jyusyoroku WHERE is_deleted=true";
	        PreparedStatement ps =connect.prepareStatement(CntQuery);
	        rs =ps.executeQuery();
	        
	        rs.next();
	        int listCnt=rs.getInt(1);
	        
	        System.out.println(rs.getInt(1)+"件あります");
	        
	        //String SelectQuery = "SELECT * FROM testdb.jyusyoroku JOIN testdb.catego ON testdb.jyusyoroku.categoryid=testdb.catego.categoryid WHERE is_deleted=true AND address like ? LIMIT 10 OFFSET "+limitSta+"";
	        String SelectQuery = "SELECT * FROM onuma.jyusyoroku JOIN onuma.category ON onuma.jyusyoroku.categoryid=onuma.category.categoryid WHERE is_deleted=true AND address like ? LIMIT 10 OFFSET "+limitSta+"";
	        ps =connect.prepareStatement(SelectQuery);
	        ps.setString(1,"%"+ SerchName +"%");
	        rs =ps.executeQuery();
	        
	        ArrayList<String> id =new ArrayList<String>();
	        ArrayList<String> name =new ArrayList<String>();
	        ArrayList<String> address =new ArrayList<String>();
	        ArrayList<String> tel =new ArrayList<String>();
	        ArrayList<String> categoryname =new ArrayList<String>();
	        ArrayList<String> categoryid =new ArrayList<String>();
	        
	        
	        while(rs.next()) {
	            
	        	id.add(rs.getString("id"));
		        name.add(rs.getString("name"));
		        address.add(rs.getString("address"));
		        
		        //"-"入れる
		        Pattern p = Pattern.compile("(\\d{3})(\\d{4})(\\d{4})");
		        Matcher m =p.matcher(rs.getString("tel"));
		        String tel1=m.replaceAll("$1-$2-$3");
		        tel.add(tel1);
		        //tel.add(rs.getString("tel"));
		        
		        categoryname.add(rs.getString("categoryname"));
		        categoryid.add(rs.getString("categoryid"));
		        
	        	}
	        
	        System.out.println(id);
	        
	        request.setAttribute("id",id);
        	request.setAttribute("name",name);
        	request.setAttribute("address",address);
        	request.setAttribute("tel",tel);
        	request.setAttribute("categoryname",categoryname);
        	request.setAttribute("categoryid",categoryid);
        	
        	String listC=String.valueOf(listCnt);
        	String noww=String.valueOf(now);
        	request.setAttribute("listC",listC);
        	request.setAttribute("noww",noww);
        	
        	RequestDispatcher rd =
    		        request.getRequestDispatcher("/List.jsp");
    		        rd.forward(request,response);
    		        
	        ps.close();

		} catch(ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データ検索に失敗しました");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
