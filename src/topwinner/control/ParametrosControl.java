package topwinner.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import topwinner.model.Empresas;
import topwinner.model.Parametros;
import topwinner.model.Usuarios;
import topwinner.model.Dao.EmpresasDao;
import topwinner.model.Dao.ParametrosDao;
import topwinner.util.Util;

@WebServlet({ "/ParametrosControl", "/cadastrarParametros", "/atualizarParametros",
		"/buscarPrimeiroCadastroParametro.winner", "/atualizaTorneio1.winner", "/atualizaTorneio2.winner",
		"/atualizarLimites.winner", "/chamaAtualizarLimites.winner", "/fecharLudo.winner" })
public class ParametrosControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Parametros parametro = null;
	private Parametros parametro2;

	public ParametrosControl() {
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
		// pegar a URL que foi chamada
		String url = request.getServletPath();
		Integer status = null;
		Integer ultimoNumeroTorneio = 0;
		HttpSession parametros = request.getSession();

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
		parametros.setAttribute("msgAtualizaParametros", null);

		if (url.equalsIgnoreCase("/atualizaTorneio2.winner")) {
			String espec1 = request.getParameter("espec1");
			String espec2 = request.getParameter("espec2");
			String espec3 = request.getParameter("espec3");
			String espec4 = request.getParameter("espec4");
			String espec5 = request.getParameter("espec5");
			String espec6 = request.getParameter("espec6");
			String espec7 = request.getParameter("espec7");
			String espec8 = request.getParameter("espec8");
			String espec9 = request.getParameter("espec9");
			String cnpj = request.getParameter("cnpj");
			Integer torneio = new Integer(request.getParameter("nTorneio"));
			Integer digitos = new Integer(request.getParameter("digitos"));
			Integer premio1 = new Integer(request.getParameter("premio1"));
			Integer premio2 = new Integer(request.getParameter("premio2"));
			Integer premio3 = new Integer(request.getParameter("premio3"));
			Integer premio4 = new Integer(request.getParameter("premio4"));
			Integer premio5 = new Integer(request.getParameter("premio5"));
			Integer premio6 = new Integer(request.getParameter("premio6"));
			Integer premio7 = new Integer(request.getParameter("premio7"));
			Integer premio8 = new Integer(request.getParameter("premio8"));
			Integer premio9 = new Integer(request.getParameter("premio9"));
			String idParametro = request.getParameter("idParametro");

			parametro = new Parametros(torneio, digitos, premio1, premio2, premio3, premio4, premio5, premio6, premio7,
					premio8, premio9, espec1, espec2, espec3, espec4, espec5, espec6, espec7, espec8, espec9, cnpj,
					idParametro);

			try {
				ParametrosDao dao = new ParametrosDao();
				boolean chave = dao.atualizaParametro(parametro);

				if (chave == true) {
					parametros.setAttribute("msgAtualizaParametros",
							"<div class='alert alert-success'>" + "Parametros atualizados com sucesso !</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				} else if (chave == false) {
					parametros.setAttribute("msgAtualizaParametros",
							"<div class='alert alert-danger'>"
									+ "Erro: na atualização dos campos referêntes aos parametros do ludo em andamento nº "
									+ ultimoNumeroTorneio + ", por favor tente novamente mais tarde!</div>");
					response.sendRedirect("/topwinner/restricted/atualizaParametros.jsp");
				}

			} catch (NumberFormatException a) {
				parametros.setAttribute("msgJaEsxisteToneioEmAndamento",
						"<div class='alert alert-danger'>" + "Erro: " + a.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
			} catch (Exception e) {
				parametros.setAttribute("msgJaEsxisteToneioEmAndamento", "<div class='alert alert-danger'>"
						+ "Erro: na atualização dos campos referêntes aos parametros do ludo em andamento nº "
						+ ultimoNumeroTorneio + ", por favor tente novamente mais tarde! " + e.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
			}
			
		}

		else if (url.equalsIgnoreCase("/fecharLudo.winner")) {
			String senha = request.getParameter("senha");
			String cnpj = request.getParameter("cnpj");

			HttpSession session = request.getSession();
			Usuarios user = (Usuarios) session.getAttribute("u");
			String senhaBd = user.getSenha();

			if (senha.equals(senhaBd)) {

				Parametros p = new Parametros();
				p.setCnpj(cnpj);

				try {
					boolean chave = new ParametrosDao().fecharTorneio(p);

					if (chave == true) {
						parametros.setAttribute("msgFechatLudo",
								"<div class='alert alert-success'>" + "Ludo fechado com sucesso!</div>");
						response.sendRedirect("/topwinner/restricted/painel.jsp");
					} else {
						parametros.setAttribute("msgFechatLudo", "<div class='alert alert-info'>"
								+ "Não foi possível fechar o ludo, tente novamente!</div>");
						response.sendRedirect("/topwinner/restricted/fecharLudo.jsp");
					}

				} catch (Exception e) {
					parametros.setAttribute("msgFechatLudo",
							"<div class='alert alert-danger'>" + "Erro: " + e.getMessage() + "</div>");
					response.sendRedirect("/topwinner/restricted/fecharLudo.jsp");
				}

			} else if (!senha.equals(senhaBd)) {
				parametros.setAttribute("msgFechatLudo",
						"<div class='alert alert-info'>" + "Não foi possível fechar o ludo, tente novamente!</div>");
				response.sendRedirect("/topwinner/restricted/fecharLudo.jsp");
			}

		}

		if (url.equalsIgnoreCase("/buscarPrimeiroCadastroParametro.winner")) {
			parametros.setAttribute("msgParametros", null);
			parametros.setAttribute("msgJaEsxisteToneioEmAndamento", null);
			HttpSession session = request.getSession();
			Usuarios user = (Usuarios) session.getAttribute("u");
			String cnpj = user.getCnpj();
			ParametrosDao dao = new ParametrosDao();

			try {
				status = dao.buscarStatusAtivo(cnpj);

				if (status == null) {
					ultimoNumeroTorneio = 1;
					parametros.setAttribute("numeroTorneio", ultimoNumeroTorneio);
					parametros.setAttribute("msgParametros", "<div class='alert alert-info'>"
							+ "Segue abaixo o número do ludo, agora atualize o restante dos campos!</div>");
					response.sendRedirect("/topwinner/restricted/parametros.jsp");
				} else if (status == 1) {
					parametros.setAttribute("msgJaEsxisteToneioEmAndamento", null);
					ultimoNumeroTorneio = dao.ultimoNumeroTorneio(cnpj);
					parametros.setAttribute("numeroTorneio", ultimoNumeroTorneio);
					response.sendRedirect("/topwinner/restricted/parametros.jsp");
				} else if (status == 0) {
					parametros.setAttribute("numeroTorneio", null);
					Integer torneioEmAndamento = dao.buscarToneioEmAndamento(cnpj);
					parametros.setAttribute("msgJaEsxisteToneioEmAndamento",
							"<div class='alert alert-info'>"
									+ "Não é possível cadastrar outro ludo, pois já existe o ludo ( nº "
									+ torneioEmAndamento + " ) em andamento!</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				}

			} catch (Exception e) {
				parametros.setAttribute("msgJaEsxisteToneioEmAndamento",
						"<div class='alert alert-danger'>"
								+ "Erro: na atualização dos campos referêntes aos parametros do novo ludo "
								+ ultimoNumeroTorneio + ", por favor tente novamente mais tarde!</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
			}

		}
		if (url.equalsIgnoreCase("/cadastrarParametros")) {
			Integer torneio = new Integer(request.getParameter("nTorneio"));
			Integer digitos = new Integer(request.getParameter("digitos"));
			Integer premio1 = new Integer(request.getParameter("premio1"));
			Integer premio2 = new Integer(request.getParameter("premio2"));
			Integer premio3 = new Integer(request.getParameter("premio3"));
			Integer premio4 = new Integer(request.getParameter("premio4"));
			Integer premio5 = new Integer(request.getParameter("premio5"));
			Integer premio6 = new Integer(request.getParameter("premio6"));
			Integer premio7 = new Integer(request.getParameter("premio7"));
			Integer premio8 = new Integer(request.getParameter("premio8"));
			Integer premio9 = new Integer(request.getParameter("premio9"));
			String espec1 = request.getParameter("espec1");
			String espec2 = request.getParameter("espec2");
			String espec3 = request.getParameter("espec3");
			String espec4 = request.getParameter("espec4");
			String espec5 = request.getParameter("espec5");
			String espec6 = request.getParameter("espec6");
			String espec7 = request.getParameter("espec7");
			String espec8 = request.getParameter("espec8");
			String espec9 = request.getParameter("espec9");
			String cnpj = request.getParameter("cnpj");

			Integer statusTorneio = 0;
			Long cnpjAux = Util.retiraFormatacaoCnpj(cnpj);

			String idParametro = cnpjAux.toString() + "" + torneio;

			parametro = new Parametros(torneio, digitos, premio1, premio2, premio3, premio4, premio5, premio6, premio7,
					premio8, premio9, espec1, espec2, espec3, espec4, espec5, espec6, espec7, espec8, espec9, cnpj,
					statusTorneio, idParametro);
			ParametrosDao cadastraDao = new ParametrosDao();

			try {
				boolean chave = cadastraDao.cadastrarTorneio(parametro);

				if (chave == true) {
					parametros.setAttribute("msgParametros",
							"<div class='alert alert-success'>" + "Ludo cadastrado com sucesso !</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				} else if (chave == false) {
					parametros.setAttribute("msgParametros",
							"<div class='alert alert-danger'>" + "Ludo cadastrado com sucesso !</div>");
					response.sendRedirect("/topwinner/restricted/parametros.jsp");
				}

			} catch (Exception e) {
				parametros.setAttribute("msgParametros", "<div class='alert alert-danger'>"
						+ "Erro: na atualização dos campos referêntes aos parametros do novo ludo "
						+ ultimoNumeroTorneio + ", por favor tente novamente mais tarde! " + e.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/parametros.jsp");
			}

		}
		if (url.equalsIgnoreCase("/atualizaTorneio1.winner")) {

			parametros.setAttribute("msgParametros", null);
			HttpSession session = request.getSession();
			Usuarios user = (Usuarios) session.getAttribute("u");
			String cnpj = user.getCnpj();
			ParametrosDao dao = new ParametrosDao();

			try {
				status = dao.buscarStatusAtivo(cnpj);

				if (status == null) {
					parametros.setAttribute("msgParametros", "<div class='alert alert-info'>"
							+ "Não existe ludo cadastrado atualmente, por favor cadastre um ludo novo!</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				} else if (status == 1) {
					parametros.setAttribute("msgJaEsxisteToneioEmAndamento", null);
					parametros.setAttribute("msgJaEsxisteToneioEmAndamento",
							"<div class='alert alert-info'>" + "Não existe ludo em aberto para atualizar!</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				} else if (status == 0) {
					// Aqui chama para atualizar
					parametros.setAttribute("numeroTorneio", null);
					parametro2 = new Parametros();
					parametro2 = dao.buscaParametrosEmAndamento(cnpj);

					parametros.setAttribute("p", parametro2);

					response.sendRedirect("/topwinner/restricted/atualizaParametros.jsp");
				}

			} catch (Exception e) {
				parametros.setAttribute("msgJaEsxisteToneioEmAndamento",
						"<div class='alert alert-danger'>"
								+ "Erro: na atualização dos campos referêntes aos parametros do novo ludo "
								+ ultimoNumeroTorneio + ", por favor tente novamente mais tarde!</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
			}

		}
		if (url.equalsIgnoreCase("/chamaAtualizarLimites.winner")) {

			EmpresasDao chamaAtuDao = new EmpresasDao();
			Empresas empresa = new Empresas();

			HttpSession session = request.getSession();
			Usuarios user = (Usuarios) session.getAttribute("u");
			Integer idUser = user.getIduser();
			empresa.setIdUser(idUser);
			parametros.setAttribute("msgAtualizarLimites", null);

			try {
				empresa = chamaAtuDao.consultarLimites(idUser);

				session.setAttribute("limites", empresa);

				response.sendRedirect("/topwinner/restricted/atualizarLimites.jsp");

			} catch (Exception e) {
				parametros.setAttribute("msgAtualizarLimites",
						"<div class='alert alert-danger'>" + "Erro:  " + e.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
			}

		}
		if (url.equalsIgnoreCase("/atualizarLimites.winner")) {
			Empresas empresa = new Empresas();
			EmpresasDao limite = new EmpresasDao();
			HttpSession session = request.getSession();
			Usuarios user = (Usuarios) session.getAttribute("u");
			Integer idUser = user.getIduser();
			empresa.setIdUser(idUser);

			String vLimite = request.getParameter("valorLimite");
			vLimite = vLimite.replace("R$ ", "");
			vLimite = vLimite.replace(".", "");
			vLimite = vLimite.replace(",", ".");
			Double valorLimite = new Double(vLimite);
			empresa.setValorLimite(valorLimite);

			String vBaseVarejo = request.getParameter("valorBaseVarejo");
			vBaseVarejo = vBaseVarejo.replace("R$ ", "");
			vBaseVarejo = vBaseVarejo.replace(".", "");
			vBaseVarejo = vBaseVarejo.replace(",", ".");
			Double valorBaseVarejo = new Double(vBaseVarejo);
			empresa.setValorBaseVarejo(valorBaseVarejo);

			String vBaseAtacado = request.getParameter("valorBaseAtacado");
			vBaseAtacado = vBaseAtacado.replace("R$ ", "");
			vBaseAtacado = vBaseAtacado.replace(".", "");
			vBaseAtacado = vBaseAtacado.replace(",", ".");
			Double valorBaseAtacado = new Double(vBaseAtacado);
			empresa.setValorBaseAtacado(valorBaseAtacado);

			if (valorLimite <= valorBaseAtacado || valorLimite <= valorBaseVarejo) {
				session.setAttribute("limites", empresa);
				session.setAttribute("msgAtualizarLimites", "<div class='alert alert-info'>Atenção ! "
						+ "Valor limite não pode ser menor ou igual que valor base atacado e nem valor base varejo. Por favor preencha novamente.</div>");
				response.sendRedirect("/topwinner/restricted/atualizarLimites.jsp");
			} else if (valorBaseVarejo >= valorBaseAtacado) {
				session.setAttribute("limites", empresa);
				session.setAttribute("msgAtualizarLimites", "<div class='alert alert-info'>Atenção ! "
						+ "Valor base varejo não pode ser maior ou igual a valor base atacado. Por favor preencha novamente.</div>");
				response.sendRedirect("/topwinner/restricted/atualizarLimites.jsp");
			} else if (valorBaseVarejo < valorBaseAtacado && valorLimite > valorBaseAtacado
					&& valorLimite > valorBaseVarejo) {

				try {
					boolean chave = limite.atualizarLimites(empresa);

					if (chave == true) {
						session.setAttribute("limites", empresa);

						empresa = limite.consultarLimites(idUser);

						session.setAttribute("limites", empresa);
						session.setAttribute("msgAtualizarLimites",
								"<div class='alert alert-success'>" + "Limites atualizados com sucesso!</div>");
						response.sendRedirect("/topwinner/restricted/atualizarLimites.jsp");
					}
					if (chave == false) {
						session.setAttribute("msgAtualizarLimites",
								"<div class='alert alert-info'>" + "Não foi possível atualizar os limites!</div>");
						response.sendRedirect("/topwinner/restricted/atualizarLimites.jsp");
					}

				} catch (Exception e) {
					parametros.setAttribute("msgAtualizarLimites",
							"<div class='alert alert-danger'>" + "Erro:  " + e.getMessage() + "</div>");
					response.sendRedirect("/topwinner/restricted/painel.jsp");
				}

			}

		}
	}
}
