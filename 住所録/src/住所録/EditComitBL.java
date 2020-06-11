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
 * Servlet implementation class EditComitBL
 */
public class EditComitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditComitBL() {
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
		//response.setContentType("text/html; charset=UTF-8");
		//PrintWriter out =response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String name =request.getParameter("name");
		String address =request.getParameter("address");
		String tel=request.getParameter("tel");
		String categoryid=request.getParameter("categoryid");
		String id = request.getParameter("id");

		//telの「-」とる
		String tel1=tel.replace("-","");
		System.out.println(tel1);

		Connection con =null;

		try {
			String user="root";
	        String password ="";
	        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";
	        //String url = "jdbc:mysql://localhost/onuma?serverTimezone=JST";


	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection( url,user,password);
	        Statement stmt = con.createStatement();

	        String UpdQuery="update testdb.jyusyoroku SET name='"+name+"',address='"+address+"',tel='"+tel1+"',categoryid='"+categoryid+"',delete_flg=0 WHERE id='"+id+"'";
	        //String UpdQuery="update onuma.jyusyoroku SET name='"+name+"',address='"+address+"',tel='"+tel1+"',categoryid='"+categoryid+"',delete_flg=0 WHERE id='"+id+"'";
	        stmt.executeUpdate(UpdQuery);
		    System.out.println("テーブルを更新しました。");


		    RequestDispatcher rd =
			        request.getRequestDispatcher("ListBL");
			        rd.forward(request,response);

		} catch(ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データの更新に失敗しました");
		} finally {
			try {
				if (con != null) {
					con.close();				}
			} catch(SQLException e) {}
		}

	}


}
