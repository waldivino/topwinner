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

import org.apache.commons.mail.EmailException;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

import topwinner.email.Email;
import topwinner.email.Html;
import topwinner.model.Empresas;
import topwinner.model.Dao.EmpresasDao;

@WebServlet({ "/solicitarConta.winner", "/contaEmpresa.winner", "/listarSolicitacoes.winner", "/descartar.winner",
		"/solicitarConta2.winner", "/buscarEmpresasImpressao.winner", "/atualizarEmpresasCupomImpressao.winner" })
public class EmpresasControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Empresas empresa;

	public EmpresasControl() {
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
		HttpSession sessions = request.getSession();
		sessions.setAttribute("msgFechatLudo", null);
		sessions.setAttribute("msgClientes", null);
		sessions.setAttribute("msgParametros", null);
		sessions.setAttribute("msgJaEsxisteToneioEmAndamento", null);
		sessions.setAttribute("numeroTorneio", null);
		sessions.setAttribute("msgAtualizaParametros", null);
		sessions.setAttribute("msg", null);
		sessions.setAttribute("listaSolicitacoes", null);
		sessions.setAttribute("msgSolicitacoes", null);
		sessions.setAttribute("msgContaConcluida", null);
		sessions.setAttribute("msgPainel", null);
		sessions.setAttribute("msgValidacaoSorteio", null);
		sessions.setAttribute("totSolicitacoes", null);
		sessions.setAttribute("msgFechatLudo", null);
		sessions.setAttribute("msgEmpresasImprime", null);

		// pegar a URL que foi chamada
		String url = request.getServletPath();
		
		if(url.equalsIgnoreCase("/atualizarEmpresasCupomImpressao.winner")){
			try {
				List<Empresas> lista = new ArrayList<Empresas>();
				
				EmpresasDao dao = new EmpresasDao();
				lista = dao.listarEmpresasCupmImpressao();
				
				String[] empresas = request.getParameterValues("empresasCupom");
				
				dao.atualizaImprimeTodoMundo();

				if(empresas!=null && empresas.length>0) {
					
				   for(int i=0; i<empresas.length; i++) {

				      for(Empresas em : lista){
				    	  if(em.getCnpj().equalsIgnoreCase(empresas[i])){
				    		  dao.atualizaImprime(empresas[i], 1);
				    	  }
				      }

				      
				   }
				}
				
				lista = dao.listarEmpresasCupmImpressao();
				
				HttpSession session = request.getSession();
				session.setAttribute("msgEmpresasImprime", null);
				session.setAttribute("listaEmpresas", lista);
				
				
				session.setAttribute("msgEmpresasImprime", "<div class='alert alert-success'>"
						+ "As empresas foram atualizadas para impressão do seu cupom.</div>");
				
				response.sendRedirect("/topwinner/restricted/listaEmpresas.jsp");
			} catch (Exception e) {
				request.setAttribute("msgEmpresasImprime", "<div class='alert alert-danger'>"
						+ "Erro: Não foi possível listar as empresas.</div>" + e.getMessage());
				request.getRequestDispatcher("/restricted/painel.jsp").forward(request, response);
			}
		}
		
		if(url.equalsIgnoreCase("/buscarEmpresasImpressao.winner")){
			try {
				List<Empresas> lista = new ArrayList<Empresas>();
				EmpresasDao dao = new EmpresasDao();
				lista = dao.listarEmpresasCupmImpressao();
				HttpSession session = request.getSession();
				session.setAttribute("msgEmpresasImprime", null);
				session.setAttribute("listaEmpresas", lista);
				response.sendRedirect("/topwinner/restricted/listaEmpresas.jsp");
			} catch (Exception e) {
				request.setAttribute("msgEmpresasImprime", "<div class='alert alert-danger'>"
						+ "Erro: Não foi possível listar as empresas.</div>" + e.getMessage());
				request.getRequestDispatcher("/restricted/painel.jsp").forward(request, response);
			}
		}

		if (url.equalsIgnoreCase("/solicitarConta.winner")) {

			Integer idUser = 0;
			EmpresasDao dao = new EmpresasDao();
			empresa = null;
			boolean gravarSolicitação = false;

			String cnpj = request.getParameter("cnpj");
			String razaoSocial = request.getParameter("razaosocial");
			String telefone = request.getParameter("telefone");
			String celular = request.getParameter("celular");
			String contato = request.getParameter("contato");
			String email = request.getParameter("email");

			if (cnpj == null) {
				request.setAttribute("msg", "<div class='alert alert-danger'>"
						+ "Solicitação não atendida, o sistema não reconheceu esta ação.</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			}

			empresa = new Empresas(cnpj, razaoSocial, telefone, celular, contato, email);

			try {
				gravarSolicitação = dao.cadastrarSolicitacao(empresa);
				if (gravarSolicitação == true) {

					request.setAttribute("msg", "<div class='alert alert-success'>"
							+ "Solicitação enviada com sucesso para o administrador do sistema!</div>");
					if (enviarEmailSolicitacao(empresa) == true) {
						request.setAttribute("email",
								"<div class='alert alert-success'>"
										+ "Sua solicitação foi enviada com sucesso, você recebeu um e-mail e em breve analisaremos sua "
										+ "solicitação de conta, fique atento ao seu e-mail!</div>");
						request.getRequestDispatcher("topwinner.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("msg", "<div class='alert alert-danger'>"
							+ "Não foi possível gravar a solicitação para sua empresa!</div>");
					request.getRequestDispatcher("topwinner.jsp").forward(request, response);
				}
			} catch (MySQLIntegrityConstraintViolationException a) {
				request.setAttribute("msg",
						"<div class='alert alert-danger'>" + "Já existe um CNPJ " + cnpj + " ou este email " + email
								+ " no sistema, por isso não pode ser solicitado uma nova conta.</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("msg", "<div class='alert alert-danger'>"
						+ "Não foi possível realizar a solicitação de conta, por favor volte a solicitar mais tarde.</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
				e.printStackTrace();
			}

		}

		if (url.equalsIgnoreCase("/solicitarConta2.winner")) {
			HttpSession session = request.getSession();
			session.setAttribute("msgCriarConta", null);

			Integer idUser = 0;
			EmpresasDao dao = new EmpresasDao();
			empresa = null;
			boolean gravarSolicitação = false;

			String cnpj = request.getParameter("cnpj");
			String razaoSocial = request.getParameter("razaosocial");
			String telefone = request.getParameter("telefone");
			String celular = request.getParameter("celular");
			String contato = request.getParameter("contato");
			String email = request.getParameter("email");

			if (cnpj == null) {
				session.setAttribute("msgCriarConta", "<div class='alert alert-danger'>"
						+ "Solicitação não atendida, o sistema não reconheceu esta ação.</div>");
				response.sendRedirect("/topwinner/restricted/criarConta.jsp");

			}

			empresa = new Empresas(cnpj, razaoSocial, telefone, celular, contato, email);

			try {
				gravarSolicitação = dao.cadastrarSolicitacao(empresa);
				if (gravarSolicitação == true) {
					if (enviarEmailSolicitacao(empresa) == true) {
						session.setAttribute("msgCriarConta",
								"<div class='alert alert-success'>"
										+ "Sua solicitação foi enviada com sucesso, você recebeu um e-mail e em breve analisaremos sua "
										+ "solicitação de conta, fique atento ao seu e-mail!</div>");
						response.sendRedirect("/topwinner/restricted/criarConta.jsp");
					}
				} else {
					session.setAttribute("msgCriarConta", "<div class='alert alert-danger'>"
							+ "Não foi possível gravar a solicitação para sua empresa!</div>");
					response.sendRedirect("/topwinner/restricted/criarConta.jsp");
				}
			} catch (MySQLIntegrityConstraintViolationException a) {
				session.setAttribute("msgCriarConta",
						"<div class='alert alert-danger'>" + "Já existe um CNPJ " + cnpj + " ou este email " + email
								+ " no sistema, por isso não pode ser solicitado uma nova conta.</div>");
				response.sendRedirect("/topwinner/restricted/criarConta.jsp");
			} catch (Exception e) {
				session.setAttribute("msgCriarConta", "<div class='alert alert-danger'>"
						+ "Não foi possível realizar a solicitação de conta, por favor volte a solicitar mais tarde.</div>");
				response.sendRedirect("/topwinner/restricted/criarConta.jsp");
			}

		}

		if (url.equalsIgnoreCase("/contaEmpresa.winner")) {
			try {
				preencherDadosSolicitacaoAtualizaCadastro(request, response);
			} catch (IllegalStateException i) {
				request.setAttribute("msg", "<div class='alert alert-danger'>" + "Erro: " + i.getMessage() + "</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("msg", "<div class='alert alert-danger'>"
						+ "Erro: Não foi possível atualizar os dados da conta, por favor volte a solicitar mais tarde.</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			}

		}
		if (url.equalsIgnoreCase("/listarSolicitacoes.winner")) {
			try {
				List<Empresas> lista = new ArrayList<Empresas>();
				EmpresasDao dao = new EmpresasDao();
				lista = dao.listarSolicitacoes();
				HttpSession session = request.getSession();
				session.setAttribute("msgSolicitacoes", null);
				session.setAttribute("listaSolicitacoes", lista);
				response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
			} catch (Exception e) {
				request.setAttribute("msg", "<div class='alert alert-danger'>"
						+ "Erro: Não foi possível listar solicitações de contas.</div>" + e.getMessage());
				request.getRequestDispatcher("/restricted/painel.jsp").forward(request, response);
			}
		}
		if (url.equalsIgnoreCase("/descartar.winner")) {
			HttpSession session = request.getSession();
			String email = request.getParameter("email");

			EmpresasDao dao = new EmpresasDao();
			boolean chave = false;
			try {
				chave = dao.descartarSolicitacao(email);

				if (chave == true) {
					List<Empresas> lista = new ArrayList<Empresas>();
					lista = dao.listarSolicitacoes();
					session.setAttribute("msgSolicitacoes", null);
					session.setAttribute("listaSolicitacoes", lista);

					session.setAttribute("msgSolicitacoes",
							"<div class='alert alert-success'>" + "Conta descartada com sucesso!</div>");
					response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
				} else if (chave != false) {
					session.setAttribute("msgSolicitacoes", "<div class='alert alert-info'>"
							+ "Não foi possível descartar esta conta, por favor tente mais tarde.</div>");
					response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
				}

			} catch (Exception e) {
				session.setAttribute("msgSolicitacoes", "<div class='alert alert-danger'>"
						+ "Erro: ao descartar conta de solicitação!</div>" + e.getMessage());

				response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
			}

		}

	}

	public boolean enviarEmailSolicitacao(Empresas empresa) throws EmailException {
		boolean enviou = false;
		Email email = new Email();
		Html html = new Html();
		String nomeDestinatario = empresa.getContato();
		String emailDestinatario = empresa.getEmail();
		String msgAssuntoCliente = "Solicitação de conta - TOP WINNER.";
		String msgAssuntoAdm = "Solicitação de conta - TOP WINNER: " + nomeDestinatario + ".";
		String msgAdm = html.htmlSoicitacaoADM(empresa);
		String msgCliente = html.htmlSoicitacaoCliente(empresa);

		email.sendEmail("topwinner@globo.com", msgAdm, "TOP WINNER", msgAssuntoAdm);

		email.sendEmail(emailDestinatario, msgCliente, nomeDestinatario, msgAssuntoCliente);
		enviou = true;
		return enviou;
	}

	public void preencherDadosSolicitacaoAtualizaCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		empresa = null;
		EmpresasDao dao = new EmpresasDao();

		Integer iduser = new Integer(request.getParameter("idUser"));

		String nomeFantasia = request.getParameter("nomeFantasia");
		String logradouro = request.getParameter("logradouro");
		String municipio = request.getParameter("municipio");
		String bairro = request.getParameter("bairro");
		String uf = request.getParameter("uf");
		String telefone = request.getParameter("telefone");
		String contato = request.getParameter("contato");
		String celular = request.getParameter("celular");
		String ramoAtividade = request.getParameter("ramoAtividade");
		String cnpjMatriz = request.getParameter("cnpjMatriz");

		String vLimite = request.getParameter("valorLimite");
		vLimite = vLimite.replace("R$ ", "");
		vLimite = vLimite.replace(".", "");
		vLimite = vLimite.replace(",", ".");
		Double valorLimite = new Double(vLimite);

		String vBaseVarejo = request.getParameter("valorBaseVarejo");
		vBaseVarejo = vBaseVarejo.replace("R$ ", "");
		vBaseVarejo = vBaseVarejo.replace(".", "");
		vBaseVarejo = vBaseVarejo.replace(",", ".");
		Double valorBaseVarejo = new Double(vBaseVarejo);

		String vBaseAtacado = request.getParameter("valorBaseAtacado");
		vBaseAtacado = vBaseAtacado.replace("R$ ", "");
		vBaseAtacado = vBaseAtacado.replace(".", "");
		vBaseAtacado = vBaseAtacado.replace(",", ".");
		Double valorBaseAtacado = new Double(vBaseAtacado);

		if (valorLimite <= valorBaseAtacado || valorLimite <= valorBaseVarejo) {
			session.setAttribute("msgAtualizaContaSolicitacao", "<div class='alert alert-info'>Atenção ! "
					+ "Valor limite não pode ser menor ou igual que valor base atacado e nem valor base varejo. Por favor preencha novamente.</div>");
			response.sendRedirect("/topwinner/restricted/preencherDadosSolicitacao.jsp");
		} else if (valorBaseVarejo >= valorBaseAtacado) {
			session.setAttribute("msgAtualizaContaSolicitacao", "<div class='alert alert-info'>Atenção ! "
					+ "Valor base varejo não pode ser maior ou igual a valor base atacado. Por favor preencha novamente.</div>");
			response.sendRedirect("/topwinner/restricted/preencherDadosSolicitacao.jsp");
		}

		else if (valorBaseVarejo < valorBaseAtacado && valorLimite > valorBaseAtacado
				&& valorLimite > valorBaseVarejo) {
			empresa = new Empresas(nomeFantasia, logradouro, municipio, bairro, uf, telefone, contato, celular,
					ramoAtividade, cnpjMatriz, valorLimite, valorBaseVarejo, valorBaseAtacado, iduser);

			try {
				boolean chave = dao.preencherDadosSolicitacaoAtualizaCadastro(empresa);
				if (chave == true) {
					session.setAttribute("msgContaConcluida", "<div class='alert alert-success'>"
							+ "Seja bem vindo ao sistema de fidelidade TOP WINNER, agora você já pode fidelizar seus clientes!.</div>");
					response.sendRedirect("restricted/painel.jsp");
				}
			} catch (IllegalStateException i) {
				request.setAttribute("msg",
						"<div class='alert alert-danger'>"
								+ "Erro: Não foi possível atualizar os dados da conta, por favor volte a solicitar mais tarde.</div>"
								+ i.getMessage());
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("msg",
						"<div class='alert alert-danger'>"
								+ "Erro: Não foi possível atualizar os dados da conta, por favor volte a solicitar mais tarde.</div>"
								+ e.getMessage());
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			}
		}

	}
}
