package 住所録;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**
 * Servlet implementation class AddComitBL
 */
public class AddComitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComitBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());


	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out =response.getWriter();
		request.setCharacterEncoding("UTF-8");


		request.setCharacterEncoding("UTF-8");
		String name =request.getParameter("name");
		String address =request.getParameter("address");
		String tel=request.getParameter("tel");
		String categoryid=request.getParameter("categoryid");

		//telの「-」とる
		String tel1=tel.replace("-","");
		System.out.println(tel1);

		Connection con =null;

		try {
			String user="root";
	        String password ="";
	        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";


	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection( url,user,password);
	        Statement stmt = con.createStatement();
		    System.out.println("接続したよ");


			String InsQuery="INSERT jyusyoroku SET name='"+name+"',address='"+address+"',tel='"+tel1+"',categoryid='"+categoryid+"',delete_flg=0";
		    //String InsQuery="INSERT onuma.jyusyoroku SET name='"+name+"',address='"+address+"',tel='"+tel1+"',categoryid='"+categoryid+"',delete_flg=0";
			stmt.executeUpdate(InsQuery);
		    System.out.println("テーブルを登録しました。<br>");
		    System.out.println("name="+name+",address="+address+",tel="+tel1+",categoryid="+categoryid+"");

		    RequestDispatcher rd =
			        request.getRequestDispatcher("ListBL");
			        rd.forward(request,response);
			        //ps.close();
		} catch(ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データの登録に失敗しました");
		} finally {
			try {
				if (con != null) {
					con.close();				}
			} catch(SQLException e) {}
		}


	}
	}


