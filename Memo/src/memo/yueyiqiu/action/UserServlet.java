package memo.yueyiqiu.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memo.yueyiqiu.dao.UserDAO;
import memo.yueyiqiu.model.UserForm;

/**
 * Servlet implementation class UserServlet
 */

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO userdao=new UserDAO();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equals("login"))
			this.login(request, response);
	}
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserForm uf=new UserForm();
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		uf.setUsername(username);
		uf.setPassword(password);
		int r=userdao.login(uf);
		HttpSession session=request.getSession();
		if(r==1){
			System.out.println("1");
			session.setAttribute("userName",uf.getUsername());
			request.getRequestDispatcher("login_ok.jsp").forward(request, response);
		}
		else{
			System.out.println("2");
			request.setAttribute("error", "¿é¤Jªº±b¸¹±K½X¿ù»~");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
