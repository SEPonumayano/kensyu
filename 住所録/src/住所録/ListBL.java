package 住所録;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		Connection connect = null;
		ResultSet rs = null;

		String SerchName = request.getParameter("SerchName");
		String Page = request.getParameter("Page");
		System.out.println(Page);

		String nowPage = "";
		if (Page != null) {
			nowPage = Page;
		} else {
			nowPage = "1";
		}
		System.out.println(nowPage + "ページ目");

		int now = Integer.parseInt(nowPage);
		System.out.println(now);
		int limitSta = (now - 1) * 10;

		if (SerchName == null) {
			SerchName = "";
		}

		String user = "root";
		String password = "";
		//String url = "jdbc:mysql://localhost/onuma?serverTimezone=JST";
		String url = "jdbc:mysql://localhost/testdb?serverTimezone=JST";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(url, user, password);
			//Statement stmt = connect.createStatement();
			System.out.println("接続おｋk");

			//件数確認
		    String CntQuery = "SELECT COUNT(*)FROM testdb.jyusyoroku WHERE delete_flg=0 AND address like ?";
			//String CntQuery="SELECT COUNT(*)FROM onuma.jyusyoroku WHERE delete_flg=0 AND address like ?";
			PreparedStatement ps = connect.prepareStatement(CntQuery);
			ps.setString(1, "%" + SerchName + "%");
			rs = ps.executeQuery();

			rs.next();
			int listCnt = rs.getInt(1);

			System.out.println(rs.getInt(1) + "件あります");

			String SelectQuery = "SELECT * FROM testdb.jyusyoroku JOIN testdb.catego ON testdb.jyusyoroku.categoryid=testdb.catego.categoryid WHERE delete_flg=0 AND address like ? LIMIT 10 OFFSET "+limitSta+"";
			//String SelectQuery = "SELECT * FROM onuma.jyusyoroku JOIN onuma.category ON onuma.jyusyoroku.categoryid=onuma.category.categoryid WHERE delete_flg=0 AND address like ? LIMIT 10 OFFSET "+limitSta+"";
			ps = connect.prepareStatement(SelectQuery);
			ps.setString(1, "%" + SerchName + "%");
			rs = ps.executeQuery();

			String listC = String.valueOf(listCnt);
			String noww = String.valueOf(now);
			request.setAttribute("listCnt", listC);
			request.setAttribute("page", noww);
			request.setAttribute("rs", rs);
			request.setAttribute("SerchName", SerchName);

			RequestDispatcher rd = request.getRequestDispatcher("/List.jsp");
			rd.forward(request, response);

			ps.close();

		} catch (ClassNotFoundException e) {
			System.out.println("クラスが見つかりません");
		} catch (SQLException e) {
			System.out.println("データ検索に失敗しました");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
