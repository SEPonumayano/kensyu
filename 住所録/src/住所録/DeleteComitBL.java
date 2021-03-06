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
 * Servlet implementation class DeleteComitBL
 */
public class DeleteComitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteComitBL() {
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
		String id = request.getParameter("id");

		Connection con =null;

		try {
			String user="root";
	        String password ="";
	        String url ="jdbc:mysql://localhost/testdb?serverTimezone=JST";
	        //String url = "jdbc:mysql://localhost/onuma?serverTimezone=JST";


	        Class.forName("com.mysql.jdbc.Driver");
	        con=DriverManager.getConnection( url,user,password);
	        Statement stmt = con.createStatement();

			String UpdQuery="update jyusyoroku SET delete_flg=1 where id='"+id+"'";
			//String UpdQuery="update onuma.jyusyoroku SET delete_flg=1 where id='"+id+"'";
	        stmt.executeUpdate(UpdQuery);
		    System.out.println("テーブルを消去しました。<br>");

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
