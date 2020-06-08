package 住所録;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Common {
	String ERRMSG_NAME01 ="名前は全角20文字以内で入力してください";
	String ERRMSG_NAME02 ="名前は必須項目です";
	String ERRMSG_ADDRESS01 ="住所は全角40文字以内で入力してください";
	String ERRMSG_ADDRESS02 ="住所は必須項目です";
	String ERRMSG_TEL01 ="電話番号は「000-0000-0000」の形式で入力してください";
	
	String name ;
	String address;
	String tel;
	String categoryid;
	
	
	public void SetName(String name){
		this.name=name;
	}
	public void SetAddress(String address) {
		this.address=address;
	}
	
	public void SetTel(String tel) {
		this.tel=tel;
	}
	
	public String GetName(){
		return this.name;
	}
	
	public String GetAddress() {
		return this.address;
	}
	
	public String GetTel() {
		return this.tel;
	}
	
	public void SetCategoryid(String categoryid) {
		this.categoryid=categoryid;
	}
	public String GetCategoryid() {
		return this.categoryid;
	}
	
	public ArrayList<String> getErr(String name,String address,String tel) {
		ArrayList<String> returnVal =new ArrayList<String>();
		
		if(this.name.length()>=20) {
			returnVal.add(ERRMSG_NAME01);
		}
		if(this.name.isEmpty()) {
			returnVal.add(ERRMSG_NAME02);
		}
		if(this.address.length()>=40) {
			returnVal.add(ERRMSG_ADDRESS01);
		}
		if(this.address.isEmpty()) {
			returnVal.add(ERRMSG_ADDRESS02);
		}
		//if(this.tel.isEmpty()) {
			//returnVal.add(ERRMSG_TEL01);
		//}
		Pattern p =Pattern.compile("^[0-9]{3}-[0-9]{4}-[0-9]{4}$");
		Matcher m =p.matcher(tel);
		if(this.tel.isEmpty() || m.find()==false) {
			returnVal.add(ERRMSG_TEL01);
		}
		return returnVal;
	}
	
	public ResultSet getCategoryAll() {
        Connection connect =null;
        ResultSet rs=null;

        String user="root";
        String password ="";
        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        connect=DriverManager.getConnection( url,user,password);
	        Statement stmt = connect.createStatement();
	        System.out.println("接続おｋ");

	        String getQuery = "SELECT * FROM testdb.catego";
	        //PreparedStatement ps =connect.prepareStatement(getQuery);
	        rs =stmt.executeQuery(getQuery);
	        //ps.close();

		} catch(ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データ検索に失敗しました");
		}
		return rs;
	}

	
	public String getCategoryName() {
    	Connection connect =null;
    	ResultSet rs=null;
        String categoryname="";

        String user="root";
        String password ="";
        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        connect=DriverManager.getConnection( url,user,password);
	        //Statement stmt = connect.createStatement();
	        System.out.println("接続おｋk");
	        
	        String keyword=this.categoryid;
	        
	        String getQuery = "SELECT categoryname FROM testdb.catego WHERE categoryid IN('"+keyword+"')";
	        PreparedStatement ps =connect.prepareStatement(getQuery);
	        rs =ps.executeQuery();
	        rs.next();
	        categoryname=rs.getString("categoryname");
	        ps.close();

		} catch(ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データ検索に失敗しました");
		}
		return categoryname;
    }

}




		

