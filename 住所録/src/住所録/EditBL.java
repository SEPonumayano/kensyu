package 住所録;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditBL
 */
public class EditBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBL() {
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
		request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String tel =request.getParameter("tel");
        String categoryid=request.getParameter("categoryid");
        String id = request.getParameter("id");
        ArrayList<String> errmsg;

		Common deta =new Common();

		deta.SetName(name);
		deta.SetAddress(address);
		deta.SetTel(tel);

		name=deta.GetName();
        address=deta.GetAddress();
        tel=deta.GetTel();

        errmsg=deta.getErr(name,address,tel);

        if(errmsg.isEmpty()) {
        	System.out.println(errmsg);

        	request.setAttribute("name",name);
            request.setAttribute("address",address);
            request.setAttribute("tel",tel);
            request.setAttribute("categoryid",categoryid);
            request.setAttribute("id",id);

            RequestDispatcher rd =
            		request.getRequestDispatcher("/EditCheck.jsp");
            rd.forward(request,response);
        }else{
		    request.setAttribute("name",name);
            request.setAttribute("address",address);
            request.setAttribute("tel",tel);
            request.setAttribute("categoryid",categoryid);
            request.setAttribute("errmsg",errmsg);
            //request.setAttribute("id",id);

            RequestDispatcher rd =
        		   request.getRequestDispatcher("/Edit.jsp");
            rd.forward(request,response);
        }

        }



}
