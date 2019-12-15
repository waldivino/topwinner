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

import topwinner.email.Email;
import topwinner.email.Html;
import topwinner.model.Empresas;
import topwinner.model.Usuarios;
import topwinner.model.Dao.EmpresasDao;
import topwinner.model.Dao.UsuariosDao;
import topwinner.util.Util;

@WebServlet({ "/logar.winner", "/recuperarSenha.winner12345678900987654321657483930212784962387956789238658327568",
		"/criarConta.winner", "/atualizaSenha.winner", "/sair.winner", "/adicionarNovoUsuario" })
public class UsuariosControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Empresas empresa;
	boolean altera = false;
	Integer totSolicitacoes = 0;

	public UsuariosControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msg", "<div class='alert alert-danger'>"
				+ "Não foi possível realizar o login, entre em contato com o administrador do sistema!</div>");
		request.getRequestDispatcher("topwinner.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession sessions = request.getSession();
		sessions.setAttribute("msgFechatLudo",null);
		sessions.setAttribute("msgClientes",null);
		sessions.setAttribute("msgParametros",null);
		sessions.setAttribute("msgJaEsxisteToneioEmAndamento",null);
		sessions.setAttribute("numeroTorneio",null);
		sessions.setAttribute("msgAtualizaParametros",null);
		sessions.setAttribute("msg",null);
		sessions.setAttribute("listaSolicitacoes",null);
		sessions.setAttribute("msgSolicitacoes",null);
		sessions.setAttribute("msgContaConcluida",null);
		sessions.setAttribute("msgPainel",null);
		sessions.setAttribute("msgValidacaoSorteio",null);
		sessions.setAttribute("totSolicitacoes",null);
		sessions.setAttribute("msgFechatLudo", null);

		// pegar a URL que foi chamada
		String url = request.getServletPath();

		if (url.equalsIgnoreCase("/logar.winner")) {
			HttpSession s = request.getSession();

			Usuarios userLogado = new Usuarios();
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			s.setAttribute("empresa", null);
			s.setAttribute("msgAlterarSenha", null);
			s.setAttribute("msgSolicitacoes", null);
			s.setAttribute("msgParametros", null);
			s.setAttribute("msgJaEsxisteToneioEmAndamento", null);
			s.setAttribute("msgAtualizaParametros", null);
			s.setAttribute("msgValidacaoSorteio", null);
			s.setAttribute("msgCriarConta", null);

			try {
				userLogado = new UsuariosDao().logar(login, senha);
				totSolicitacoes = new UsuariosDao().totSolicitacoes();
			} catch (Exception e) {
				request.setAttribute("msg", "<div class='alert alert-danger'>"
						+ "Não foi possível realizar o login, entre em contato com o administrador do sistema!</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
				e.printStackTrace();
			}

			if (userLogado != null) {
				try {
					login = login.toUpperCase().substring(0, 100);
				} catch (Exception e) {
					login = userLogado.getLogin().toUpperCase();
				}

				userLogado.setLogin(login);
				// Criar uma sessao
				HttpSession session = request.getSession();

				HttpSession paginaBloqueada = request.getSession();

				paginaBloqueada.setAttribute("paginaBloqueada", userLogado.getAdministrador());

				session.setAttribute("u", userLogado);
				session.setAttribute("totSolicitacoes", totSolicitacoes);

				if (userLogado.getAdministrador() == 0) {

					try {
						Empresas empresa = new Empresas();
						EmpresasDao dao = new EmpresasDao();
						empresa = dao.consultaTerminarCadastroEmpresas(userLogado);
						session.setAttribute("empresa", empresa);
					} catch (Exception e) {
						request.setAttribute("msg", "<div class='alert alert-danger'>"
								+ "Erro: Não foi possível continuar com o cadastro, tente mais tarde, coso não consiga entre em contato com o sistema TOP WINNER!</div>");
						request.getRequestDispatcher("topwinner.jsp").forward(request, response);
					}

					response.sendRedirect("restricted/preencherDadosSolicitacao.jsp");
				} else {
					response.sendRedirect("restricted/painel.jsp");
				}

			} else {
				request.setAttribute("msg",
						"<div class='alert alert-danger'>" + "Login ou senha inválidos, Tente novamente!</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			}
		}
		if (url.equalsIgnoreCase("/recuperarSenha.winner12345678900987654321657483930212784962387956789238658327568")) {
			// recuperar Login e senha
			String email = request.getParameter("email");
			String cnpj = request.getParameter("cnpj");
			try {
				Usuarios u = new Usuarios();
				u = recuperarSenha(email, cnpj);

				if (u != null) {
					request.setAttribute("msg",
							"<div class='alert alert-success'>" + "Em breve será enviado um email para " + email
									+ " com os dados de acesso ao sistema!</div>");
					request.getRequestDispatcher("topwinner.jsp").forward(request, response);
				} else {
					request.setAttribute("msg",
							"<div class='alert alert-danger'>"
									+ "Não foi possível recuperar o login ou senha, verifique se você digitou corretamente o email:"
									+ " " + email + " e o CNPJ: " + cnpj + "!</div>");
					request.getRequestDispatcher("topwinner.jsp").forward(request, response);
				}

			} catch (Exception e) {
				request.setAttribute("msg",
						"<div class='alert alert-danger'>"
								+ "Erro: ao recuperar o login ou senha, verifique se você digitou corretamente o email:"
								+ " " + email + " e o CNPJ: " + cnpj + "!</div>");
				request.getRequestDispatcher("topwinner.jsp").forward(request, response);
			}
		}
		if (url.equalsIgnoreCase("/criarConta.winner")) {

			String aux = request.getParameter("idUser");
			String cnpj = request.getParameter("cnpj");
			String razaoSocial = request.getParameter("razaoSocial");
			String telefone = request.getParameter("telefone");
			String celular = request.getParameter("celular");
			String contato = request.getParameter("contato");
			String email = request.getParameter("email");
			Integer idUser = new Integer(request.getParameter("idUser"));
			Integer status = 0;

			HttpSession session = request.getSession();

			String senhaProvisoria = Util.passGenerator(8);

			empresa = new Empresas(cnpj, razaoSocial, telefone, contato, celular, email, status, idUser,
					senhaProvisoria);
			try {
				boolean chave = criarConta(empresa);
				if (chave == true) {
					EmpresasDao daoE = new EmpresasDao();
					List<Empresas> lista = new ArrayList<Empresas>();
					lista = daoE.listarSolicitacoes();
					HttpSession sec = request.getSession();
					sec.setAttribute("msgSolicitacoes", null);
					sec.setAttribute("listaSolicitacoes", lista);

					session.setAttribute("msgSolicitacoes",
							"<div class='alert alert-success'>"
									+ "Conta criada com sucesso para a empresa com o cnpj -> " + cnpj
									+ ", e foi enviado um e-mail com login e senha para o e-mail (" + email
									+ ") do cliente cadastrado !</div>");

					response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
				} else {
					session.setAttribute("msgSolicitacoes", "<div class='alert alert-info'>"
							+ "Não foi possível criar uma conta para este cliente, favor entre em contato com o suporte do sistema !</div>");

					response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
				}
			} catch (IllegalArgumentException a) {
				session.setAttribute("msgSolicitacoes", "<div class='alert alert-danger'>"
						+ "Erro: ao criar conta de novo usuário!<br> " + a.getMessage() + "</div>");

				response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
			} catch (Exception e) {
				session.setAttribute("msgSolicitacoes", "<div class='alert alert-danger'>"
						+ "Erro: ao criar conta de novo usuário!<br> " + e.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/solicitacoes.jsp");
			}

		}
		if (url.equalsIgnoreCase("/atualizaSenha.winner")) {
			HttpSession session = request.getSession();

			String emails = request.getParameter("email");
			String senhaAtual = request.getParameter("senhaAtual");
			String novaSenha = request.getParameter("novaSenha");
			Integer idUser = new Integer(request.getParameter("idUser"));
			String senhaCerta = request.getParameter("senhaCerta");

			if (senhaAtual.equals(senhaCerta)) {
				UsuariosDao dao = new UsuariosDao();
				try {
					altera = dao.alterarSenha(novaSenha, idUser);

					if (altera == true) {
						Html html = new Html();
						Email email = new Email();
						email.sendEmail(emails, html.htmlAlterarSenha(novaSenha), "TOP WINNER", "Alteração de senha");
						session.setAttribute("msgAlterarSenha", "<div class='alert alert-success'>"
								+ "Senha alterada com sucesso! Você receberá um email com a nova senha.</div>");
						response.sendRedirect("/topwinner/restricted/alterarSenha.jsp");
					} else {
						session.setAttribute("msgAlterarSenha", "<div class='alert alert-info'>"
								+ "Sua senha não foi alterada, tente novamente mais tarde.</div>");
						response.sendRedirect("/topwinner/restricted/alterarSenha.jsp");
					}
				} catch (Exception e) {
					session.setAttribute("msgAlterarSenha", "<div class='alert alert-danger'>"
							+ "Erro: ao aterar a senha do usuário!</div>" + e.getMessage());
					response.sendRedirect("/topwinner/restricted/alterarSenha.jsp");
				}
			} else if (!senhaAtual.equals(senhaCerta)) {
				session.setAttribute("msgAlterarSenha", "<div class='alert alert-info'>"
						+ "Sua senha não foi alterada, tente novamente mais tarde.</div>");
				response.sendRedirect("/topwinner/restricted/alterarSenha.jsp");
			}

		}
		if (url.equalsIgnoreCase("/sair.winner")) {
			HttpSession session = request.getSession();
			session.removeAttribute("u");
			session.invalidate();

			request.setAttribute("msg", "<div class='alert alert-info'>" + "Deslogado com sucesso do sistema!</div>");
			request.getRequestDispatcher("topwinner.jsp").forward(request, response);
		}
		if (url.equalsIgnoreCase("/adicionarNovoUsuario")) {
			HttpSession session = request.getSession();
			Integer idUser = new Integer(request.getParameter("idUser"));

			String login = request.getParameter("login");

			EmpresasDao dao = new EmpresasDao();
			boolean chave = false;
			try {
				UsuariosDao user = new UsuariosDao();
				Empresas empresa = new Empresas();
				String cnpj = dao.BuscarCNPJEmpresaAfiliada(idUser);
				empresa = dao.consultarEmpresaParaAdicionarNovoUser(cnpj);

				empresa.setEmail(login);
				String cnpjAux = empresa.getCnpj();

				empresa.setCnpj(cnpjAux);
				// ultimoId++;
				// empresa.setIdUser(ultimoId);

				String senhaProvisoria = Util.passGenerator(8);
				empresa.setSenhaProvisoria(senhaProvisoria);

				chave = user.adicionarNovoUsuario(empresa);

				if (chave == true) {
					Html html = new Html();
					Email email = new Email();
					email.sendEmail(login, html.htmlNovaContaAssociadaUsuario(login, senhaProvisoria), "TOP WINNER",
							"Usuário novo associado a conta da empresa: " + empresa.getRazaoSocial());
					session.setAttribute("msgNovoUsuario", "<div class='alert alert-success'>"
							+ "Nova conta criada com sucesso! O novo usuário receberá um email com as informações da conta.</div>");
					response.sendRedirect("/topwinner/restricted/adicionarNovoUsuario.jsp");

				} else if (chave != false) {
					session.setAttribute("msgNovoUsuario", "<div class='alert alert-success'>"
							+ "Não foi possível criar uma nova conta, por favor tente mais tarde.</div>");
					response.sendRedirect("/topwinner/restricted/adicionarNovoUsuario.jsp");
				}

			} catch (Exception e) {
				session.setAttribute("msgNovoUsuario",
						"<div class='alert alert-danger'>" + "Erro: ao criar nova conta!<br> "+e.getMessage()+"</div>");

				response.sendRedirect("/topwinner/restricted/adicionarNovoUsuario.jsp");
			}
		}

	}

	public boolean criarConta(Empresas empresa) throws Exception {
		boolean chave = false;
		UsuariosDao dao = new UsuariosDao();
		chave = dao.criarConta(empresa);
		enviarEmailNovaConta(empresa);
		return chave;
	}

	public void enviarEmailNovaConta(Empresas empresa) throws Exception {
		Email email = new Email();
		Html html = new Html();

		email.sendEmail(empresa.getEmail(), html.htmlNovaConta(empresa), "TOP WINNER",
				"Seja bem vindo - nova conta criada!");
	}

	public Usuarios recuperarSenha(String email, String cnpj) throws Exception {

		UsuariosDao dao = new UsuariosDao();
		Usuarios user = new Usuarios();
		user = dao.recuperarSenha(email, cnpj);
		Email emailSenha = new Email();
		Html htm = new Html();

		emailSenha.sendEmail(user.getEmail(), htm.htmlRecupararSenha(user), "TOP WINNER",
				"Solicitacao de recuperacao da senha ou login!");

		return user;
	}

}
