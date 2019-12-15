package topwinner.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nickyb.sqleonardo.environment.mdi.ClientCommandEditor;
import topwinner.model.Clientes;
import topwinner.model.Empresas;
import topwinner.model.Notas;
import topwinner.model.Sorteios;
import topwinner.model.Dao.ClientesDao;
import topwinner.model.Dao.EmpresasDao;
import topwinner.sorteio.GeraSorteio;
import topwinner.util.SorteioI;

@WebServlet({ "/SorteiosControl", "/sortiar.winner" })
public class SorteiosControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Sorteios sorteio;
	Sorteios sorteios = null;

	SorteioI sorte = new GeraSorteio();

	public SorteiosControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> listaLances = null;
		HttpSession session = request.getSession();

		String url = request.getServletPath();

		if (url.equalsIgnoreCase("/sortiar.winner")) {

			sorteio = new Sorteios();

			session.setAttribute("cupons", null);

			sorteio = (Sorteios) session.getAttribute("sorteio");
			SorteioI isorteio = new GeraSorteio();

			String numSorteStr = request.getParameter("numeroDaSorte");
			Integer digitos = new Integer(request.getParameter("digitos"));

			numSorteStr = numSorteStr.replace("-", "");

			if (digitos != numSorteStr.length()) {
				session.setAttribute("msgSorteio", "<div class='alert alert-info'>Atenção: Digite " + digitos
						+ " digitos para realizar o sorteio! </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
				return;
			}

			try {
				numSorteStr = numSorteStr.substring(0, digitos);
			} catch (Exception e) {
				session.setAttribute("msgSorteio", "<div class='alert alert-info'>Atenção: Digite " + digitos
						+ " digitos para realizar o sorteio! </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
				return;
			}

			String numeroSorte = numSorteStr;
			sorteio.setNumeroSorte(numeroSorte);

			// Atualiza residuo
			try {
				sorteio.setResiduoValorCompra(sorteio.getResiduoValorCompra());
				Integer sort = isorteio.atualizapontos(sorteio.getCpf(), sorteio.getCnpj(),
						sorteio.getPontosAcumulados());
			} catch (Exception e) {
				session.setAttribute("msgSorteio",
						"<div class='alert alert-danger'>Erro: " + e.getMessage() + " </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
			}

			// Sorteia lances
			try {
				listaLances = sorte.geraAletoriosPorTotDigitos(sorteio.getDigitos(), sorteio.getNumeroLances());
			} catch (Exception e) {
				session.setAttribute("msgSorteio",
						"<div class='alert alert-danger'>Erro: " + e.getMessage() + " </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
			}

			// realiza sorteio
			try {

				Clientes cliente = new Clientes();
				cliente = (Clientes) session.getAttribute("cliente");
				Integer chave = 0;
				try {
					chave = cliente.getAtualiza();
				} catch (Exception e) {
					chave = 0;
				}

				if (chave.equals(1)) {
					new ClientesDao().atualizaDadosCliente(cliente, sorteio.getCnpj(), sorteio.getIdUser());
				}

				sorteios = sorte.geraSorteio(sorteio, listaLances);
			} catch (Exception e) {
				session.setAttribute("msgSorteio",
						"<div class='alert alert-danger'>Erro: " + e.getMessage() + " </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
			}

			// Mostra as notas na página
			try {
				EmpresasDao empDao = new EmpresasDao();
				Empresas emp = new Empresas();
				emp = empDao.buscarEmpresasCupmImpressao(sorteios.getCnpj());
				session.setAttribute("cupons", sorteios.getNotas());
				session.setAttribute("empresa", emp.getImprime());
				session.setAttribute("cabecalho", sorteios.getNotas().get(0));
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
				
				
				return;
			} catch (IllegalStateException i) {
				session.setAttribute("msgSorteio",
						"<div class='alert alert-info'> Houve uma falha nos servidores, mas seu sorteio não será afetado, favor clique novamente para sortear. </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
			} catch (Exception e) {
				session.setAttribute("cupons", null);
				session.setAttribute("msgSorteio",
						"<div class='alert alert-info'> Houve uma falha nos servidores, mas seu sorteio não será afetado, favor clique novamente para sortear. </div>");
				response.sendRedirect("/topwinner/restricted/sorteio.jsp");
			}
			return;
		}
	}

}
