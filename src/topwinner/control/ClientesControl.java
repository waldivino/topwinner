package topwinner.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import topwinner.model.Clientes;
import topwinner.model.ClientesXEmpresas;
import topwinner.model.Notas;
import topwinner.model.Sorteios;
import topwinner.model.Usuarios;
import topwinner.model.Dao.ClientesDao;
import topwinner.sorteio.ValidaSorteio;
import topwinner.util.Util;
import topwinner.util.ValidaSorteioI;

@WebServlet({ "/ClientesControl", "/cadastrarCupom.winner", "/chamarCadastroCupomECliente.winner",
		"/chamarCadastroCliente.winner", "/cadastroCliente.winner" })
public class ClientesControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Usuarios user = null;
	ClientesDao dao = null;

	public ClientesControl() {
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

		if (url.equalsIgnoreCase("/chamarCadastroCliente.winner")) {
			HttpSession s = request.getSession();
			s.setAttribute("msgClientes", null);
			Clientes cliente = new Clientes();
			ClientesDao dao = new ClientesDao();
			user = new Usuarios();
			user = (Usuarios) s.getAttribute("u");
			
			HttpSession fred = request.getSession();
			fred.setAttribute("cliente", null);

			try {
				String cpf = request.getParameter("cpfCliente");
				cliente = dao.buscarClienteJaCadastrado(cpf, user.getIduser());
				if (cliente == null) {
					cliente = new Clientes();
					cliente.setCpf(cpf);
					cliente.setAtualiza(1);
				}

				s.setAttribute("cliente", cliente);
			} catch (Exception e) {
				s.setAttribute("msgClientes", "<div class='alert alert-danger'>" + e.getMessage() + " !</div>");
				response.sendRedirect("/topwinner/restricted/cadastraCliente.jsp");
			}

			response.sendRedirect("/topwinner/restricted/cadastraCliente.jsp");
			return;
		}

		if (url.equalsIgnoreCase("/cadastroCliente.winner")) {
			HttpSession s = request.getSession();
			try {

				user = new Usuarios();
				user = (Usuarios) s.getAttribute("u");

				Clientes cliente = new Clientes();
				cliente = (Clientes) s.getAttribute("cliente");

				String nome = request.getParameter("nome");
				String celular = request.getParameter("celular");
				String cep = request.getParameter("cep");
				String tipoLogradouro = request.getParameter("tipo");
				String logradouro = request.getParameter("logradouro");
				String bairro = request.getParameter("bairro");
				String municipio = request.getParameter("municipio");
				String uf = request.getParameter("uf");
				String complemento = request.getParameter("complemento");
				Integer idade = new Integer(request.getParameter("idade"));
				String genero = request.getParameter("genero");
				Integer estadoCivil = new Integer(request.getParameter("estadoCivil"));
				Integer renda = new Integer(request.getParameter("renda"));
				Integer escolaridade = new Integer(request.getParameter("escolaridade"));

				cliente.setNome(nome);
				cliente.setCelular(celular);
				cliente.setCep(cep);
				cliente.setTipo(tipoLogradouro);
				cliente.setLogradouro(logradouro);
				cliente.setBairro(bairro);
				cliente.setMunicipio(municipio);
				cliente.setIdade(idade);
				cliente.setSexo(genero);
				cliente.setEstado_civil(estadoCivil);
				cliente.setRenda(renda);
				cliente.setEscolaridade(escolaridade);
				cliente.setUf(uf);
				cliente.setComplemento(complemento);
				cliente.setAtualiza(1);
				cliente.setIdSuer(user.getIduser());

				s.setAttribute("cliente", cliente);

				s.setAttribute("msgValidacaoSorteio", "<div class='alert alert-success'>"
						+ "Coleta de dados do cliente realizada com sucesso!</div>");
				
				response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
				return;

			} catch (Exception e) {
				s.setAttribute("msgClientes",
						"<div class='alert alert-info'>Por favor digite o CPF e clique em OK !</div>");
				response.sendRedirect("/topwinner/restricted/cadastraCliente.jsp");
			}

		}

		if (url.equalsIgnoreCase("/chamarCadastroCupomECliente.winner")) {
			HttpSession session = request.getSession();
			session.setAttribute("nota", null);
			session.setAttribute("msgValidacaoSorteio", null);
			session.setAttribute("msgContaConcluida", null);
			session.setAttribute("cupons", null);
			session.setAttribute("msgValidacaoSorteio", null);
			session.setAttribute("msgClientes", null);
			HttpSession fred = request.getSession();
			fred.setAttribute("cliente", null);
			user = new Usuarios();
			user = (Usuarios) session.getAttribute("u");
			dao = new ClientesDao();

			try {
				Integer chave = new ClientesDao().buscarStatusAtivoParametros(user.getCnpj());

				if (chave == 0) {
					response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
				} else if (chave == 2) {
					HttpSession s = request.getSession();
					s.setAttribute("msgClientes",
							"<div class='alert alert-info'>" + "Você precisa cadastrar um novo torneio!</div>");
					response.sendRedirect("/topwinner/buscarPrimeiroCadastroParametro.winner");
					return;
				} else if (chave == 1) {
					HttpSession s = request.getSession();
					s.setAttribute("msgClientes",
							"<div class='alert alert-info'>" + "Você precisa cadastrar um novo torneio!</div>");
					response.sendRedirect("/topwinner/buscarPrimeiroCadastroParametro.winner");
					return;
				}
			} catch (Exception e) {
				HttpSession s = request.getSession();
				s.setAttribute("msgClientes", "<div class='alert alert-info'>" + e.getMessage() + "</div>");
				response.sendRedirect("/topwinner/restricted/painel.jsp");
				return;
			}

		} else if (url.equalsIgnoreCase("/cadastrarCupom.winner")) {
			HttpSession sessionNota = request.getSession();
			sessionNota.setAttribute("nota", null);
			sessionNota.setAttribute("msgValidacaoSorteio", null);
			sessionNota.setAttribute("cupons", null);

			String cpf = request.getParameter("cpf");
			String telefone = request.getParameter("telefone");
			Integer coo = new Integer(request.getParameter("coo"));

			String valor = request.getParameter("valorCupom").replace("R$ ", "");
			valor = valor.replace(".", "");
			valor = valor.replace(",", ".");
			Double valorCompra = new Double(valor);

			Integer idUser = new Integer(request.getParameter("idUser"));
			String cnpj = request.getParameter("cnpj");

			ClientesDao dao = new ClientesDao();
			Clientes cli = new Clientes();
			cli.setCpf(cpf);
			cli.setTelefone(telefone);
			cli.setIdSuer(idUser);

			ClientesXEmpresas ce = new ClientesXEmpresas();
			ce.setCpf(cpf);
			ce.setCnpj(cnpj);

			Notas nota = new Notas();
			nota.setCoo(Util.zerosEsquerda6Digitos(coo.toString()));
			nota.setIdClienteEmpresa(ce.getIdClienteEmpresa());
			nota.setIdUser(idUser);

			sessionNota.setAttribute("nota", nota);

			Date curDate = new Date();
			SimpleDateFormat format = new SimpleDateFormat();
			format = new SimpleDateFormat("yyyy/MM/dd");
			String DateToStr = format.format(curDate);
			boolean chaveClienteJaCadastrado = false;
			boolean chaveCooJaCadastrado = false;
			String compraDataDoDia = DateToStr;
			try {
				curDate = format.parse(DateToStr);
				ValidaSorteioI validaSorteio = new ValidaSorteio();
				chaveClienteJaCadastrado = validaSorteio.verificaClienteJaCadastrado(cli, ce);
				if (chaveClienteJaCadastrado == false) {
					dao.inserirClienteEmpresa(cli, ce);
				}

				validaSorteio.cadastrarClienteSomenteClientesxempresas(ce);

				chaveCooJaCadastrado = validaSorteio.verificaCooJaCadastrado(coo, cnpj, cpf);

				compraDataDoDia = validaSorteio.verificaCompraDataDoDia(DateToStr, cnpj, cpf);

				if (compraDataDoDia.equals(DateToStr)) {
					sessionNota.setAttribute("msgValidacaoSorteio",
							"<div class='alert alert-info'>Este cpf: " + cpf + " já realizou uma compra hoje,"
									+ " e por este motivo não poderá participar novamente do sorteio!</div>");
					response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
					return;

				}

				else if (chaveCooJaCadastrado == true) {
					sessionNota.setAttribute("msgValidacaoSorteio", "<div class='alert alert-info'>Atenção! O COO/DOC: "
							+ coo + " já foi sorteado e não pode ser mais utilizado!</div>");
					response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
					return;
				}

				// =============================================================
				// =============================================================
				// =============================================================
				// //Aquí começa o sorteio
				else if (chaveCooJaCadastrado == false && !compraDataDoDia.equals(DateToStr)) {
					sessionNota.setAttribute("sorteio", null);
					sessionNota.setAttribute("msgSorteio", null);

					Sorteios sorteio = new Sorteios();
					sorteio.setIdUser(idUser);
					sorteio.setCpf(cpf);
					sorteio.setCnpj(cnpj);
					sorteio.setValorCompra(valorCompra);
					sorteio.setCoo(Util.zerosEsquerda6Digitos(coo.toString()));

					sorteio.setTelefone(telefone);

					Double residuo = validaSorteio.recuperarResiduo(cnpj, cpf);
					sorteio.setResiduoAnterior(residuo);
					sorteio.setResiduo(residuo);

					Date dataSort = new Date();
					SimpleDateFormat format2 = new SimpleDateFormat();
					format2 = new SimpleDateFormat("dd/MM/yyyy");
					String dataSorteio = format2.format(dataSort);
					sorteio.setData(dataSorteio);

					Double valorBase = validaSorteio.recuperarValorParaSorteio(cnpj, valorCompra);
					sorteio.setValorBase(valorBase);

					sorteio.setDigitos(validaSorteio.verificaTotalDeDigitosSorteio(cnpj));

					Double residuoValorCompra = (valorCompra + residuo) % valorBase;

					valorBase = validaSorteio.recuperarValorParaSorteio(cnpj, valorCompra + residuo);
					residuoValorCompra = (valorCompra + residuo) % valorBase;
					sorteio.setValorBase(valorBase);

					String formataStrValor = Util.formataDoublePara2CasasDecimais(residuoValorCompra);

					formataStrValor = formataStrValor.replace(",", ".");

					residuoValorCompra = new Double(formataStrValor);

					sorteio.setResiduoValorCompra(residuoValorCompra);

					Sorteios verificouSorteio = new Sorteios();
					verificouSorteio = validaSorteio.verificaSeClienteJaPossuiPontosSenaoCadastra(sorteio);

					if ((sorteio.getValorCompra() + sorteio.getResiduo()) < valorBase) {
						validaSorteio.atualizaResiduoTabelaPontos(sorteio);
						sessionNota.setAttribute("msgValidacaoSorteio",
								"<div class='alert alert-success'>Você não possui valor de resíduo e nem de compra para participar do sorteio!</div>");
						response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
						return;
					}

					if ((sorteio.getValorCompra() + sorteio.getResiduo()) >= valorBase) {
						Integer totSorteio = (int) ((valorCompra + residuo) / valorBase);
						Integer numeroLances = totSorteio;
						sorteio.setNumeroLances(numeroLances);
					}

					sorteio.setValorTotal(valorCompra + residuo);

					// Já existe
					if (verificouSorteio == null) {

						validaSorteio.atualizaResiduoTabelaPontos(sorteio);

						sessionNota.setAttribute("sorteio", sorteio);
						sorteio = new Sorteios();
						response.sendRedirect("/topwinner/restricted/sorteio.jsp");
						return;
					}
					// verifica e ou adiciona novo
					else if (verificouSorteio != null) {
						sessionNota.setAttribute("sorteio", sorteio);
						sorteio = new Sorteios();
						response.sendRedirect("/topwinner/restricted/sorteio.jsp");
						return;
					}
					// =============================================================
					// =============================================================
					// =============================================================
				}
			} catch (Exception e) {
				sessionNota.setAttribute("msgValidacaoSorteio",
						"<div class='alert alert-danger'>Erro: Campo " + e.getMessage() + "!</div>");
				response.sendRedirect("/topwinner/restricted/clienteCupom.jsp");
				return;
			}

		}
	}

}
