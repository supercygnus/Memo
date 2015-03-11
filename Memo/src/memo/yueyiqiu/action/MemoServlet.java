package memo.yueyiqiu.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import memo.yueyiqiu.dao.MemoDAO;
import memo.yueyiqiu.model.MemoForm;

/**
 * Servlet implementation class MemoServlet
 */

public class MemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemoDAO mDao=new MemoDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoServlet() {
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
		if(action.equals("listAll")){
			this.listAll(request, response);
		}
		else if(action.equals("del")){
			this.del(request, response);
		}
	}
	
	protected void listAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		if(session.getAttribute("userName")==null){
			request.setAttribute("error", "您的帳戶已過期,請重新登入");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		else{
			String url="MemoServlet?action=listAll";
			List<MemoForm> list=mDao.query(session.getAttribute("userName").toString());
			System.out.println("size"+list.size());
			request.setAttribute("memoList", list);
			request.setAttribute("url",url);
			request.getRequestDispatcher("memo_list.jsp").forward(request, response);
		}
		
	}
	
	protected void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		
	}
}
