package 住所録;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AddBL
 */
public class AddBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        
		
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		//PrintWriter out =response.getWriter();
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String tel =request.getParameter("tel");
        String categoryid=request.getParameter("categoryid");
        ArrayList<String> errmsg;
		
		Common deta =new Common();
		
		deta.SetName(name);
		deta.SetAddress(address);
		deta.SetTel(tel);
		deta.SetCategoryid(categoryid);
		
		name=deta.GetName();
        address=deta.GetAddress();
        tel=deta.GetTel();
        categoryid=deta.GetCategoryid();
        
        errmsg=deta.getErr(name,address,tel);

        System.out.println(categoryid);
        
        if(errmsg.isEmpty()) {
        	System.out.println(errmsg);
        	
        	request.setAttribute("name",name);
            request.setAttribute("address",address);
            request.setAttribute("tel",tel);
            request.setAttribute("categoryid",categoryid);
            //request.setAttribute("errmsg",errmsg);
            
            RequestDispatcher rd =
            		request.getRequestDispatcher("/AddCheck.jsp");
            rd.forward(request,response);
        }else{
		    request.setAttribute("name",name);
            request.setAttribute("address",address);
            request.setAttribute("tel",tel);
            request.setAttribute("categoryid",categoryid);
            request.setAttribute("errmsg",errmsg);
		
            RequestDispatcher rd =
        		   request.getRequestDispatcher("/Add.jsp");
            rd.forward(request,response);
        }
		
        }
	

}

