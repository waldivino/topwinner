package topwinner.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({ "/PainelControl", "/painel.winner" })
public class PainelControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PainelControl() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// pegar a URL que foi chamada
		String url = request.getServletPath();

		if (url.equalsIgnoreCase("/painel.winner")) {
			HttpSession session = request.getSession();
			session.setAttribute("msgClientes",null);
			session.setAttribute("msgParametros",null);
			session.setAttribute("msgJaEsxisteToneioEmAndamento",null);
			session.setAttribute("numeroTorneio",null);
			session.setAttribute("msgAtualizaParametros",null);
			session.setAttribute("msg",null);
			session.setAttribute("listaSolicitacoes",null);
			session.setAttribute("msgSolicitacoes",null);
			session.setAttribute("msgContaConcluida",null);
			session.setAttribute("msgPainel",null);
			session.setAttribute("msgValidacaoSorteio",null);
			session.setAttribute("totSolicitacoes",null);
			session.setAttribute("msgFechatLudo", null);

			response.sendRedirect("/topwinner/restricted/painel.jsp");
		}
	}

}
