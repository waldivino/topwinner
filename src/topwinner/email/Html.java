package topwinner.email;

import topwinner.model.Empresas;
import topwinner.model.Usuarios;

public class Html {

	public String htmlSoicitacaoCliente(Empresas empresa) {

		String codigo = "<html>"
				+ "<head>"
				+ "<head>"
				+ "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     "
				+ "  min-height:340px; '>"
				+ "<h2 class='tag-title'>TOP WINNER - Solicitacao de Conta.</h2>"
				+ "<center>E um grande prazer recebermos uma solicitacao para o nosso sistema de fidelidade, por "
				+ "favor aguarde a aprovacao de sua conta, e em seguida caso seja aprovada voce recebera um email "
				+ "com o login e senha para acesso ao sistema.</center><br>"
				+ "<table>" + "<tr>" + "<td>" + "Razao Social:" + "</td>"
				+ "<td>"
				+ empresa.getRazaoSocial()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "CNPJ:"
				+ "</td>"
				+ "<td>"
				+ empresa.getCnpj()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Telefone: "
				+ "</td>"
				+ "<td>"
				+ empresa.getTelefone()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Celular:"
				+ "</td>"
				+ "<td>"
				+ empresa.getCelular()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Email:"
				+ "</td>"
				+ "<td>"
				+ empresa.getEmail()
				+ "</td>"
				+ "</tr>"
				+ "</table>"
				+ "<br><h4>TOP WINNER - SISTEMA DE FIDELIDADE</h4>"
				+ "</div>"
				+ "</body>" + "</html>";

		return codigo;
	}

	public String htmlSoicitacaoADM(Empresas empresa) {
		String codigo = "";

		codigo = "<html>" + "<head>" + "<head>" + "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     " + "  min-height:340px; '>"
				+ "<h2>TOP WINNER - Solicitação de Conta.</h2>"
				+ "<center>O cliente "
				+ " solicita uma conta para o sistema TOP WINNER.</center><br>"
				+ "<table>" + "<tr>" + "<td>" + "Razão Social:" + "</td>"
				+ "<td>"
				+ empresa.getRazaoSocial()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "CNPJ:"
				+ "</td>"
				+ "<td>"
				+ empresa.getCnpj()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Telefone: "
				+ "</td>"
				+ "<td>"
				+ empresa.getTelefone()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Celular:"
				+ "</td>"
				+ "<td>"
				+ empresa.getCelular()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Email:"
				+ "</td>"
				+ "<td>"
				+ empresa.getEmail()
				+ "</td>"
				+ "</tr>"
				+ "</table>"
				+ ""
				+ "<br>"
				+ "<span>Acesse o painel do sistema para verificar e aprovar este cliente.</span>"
				+ "</div>" + "</body>" + "</html>";
		return codigo;
	}
	
	public String htmlRecupararSenha(Usuarios user){
		String codigo = "";

		codigo = "<html>" + "<head>" + "<head>" + "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     " + "  min-height:340px; '>"
				+ "<h2>TOP WINNER - Solicitacao de recuperacao de login e senha.</h2>"
				+ "<center>Abaixo estao seu login e senha para acesso ao sistema:</center><br>"
				+ "<table>" + "<tr>" + "<td>" + "Login:" + "</td>"
				+ "<td>"
				+ user.getLogin()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Senha:"
				+ "</td>"
				+ "<td>"
				+ user.getSenha()
				+ "</td>"
				+ "</table>"
				+ ""
				+ "<br>"
				+ "<span>Agora voce ja pode acessar sua area restrita do sistema.</span>"
				+ "</div>" + "</body>" + "</html>";
		return codigo;
	}
	
	public String htmlNovaConta(Empresas user){
		String codigo = "";

		codigo = "<html>" + "<head>" + "<head>" + "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     " + "  min-height:340px; '>"
				+ "<h2>TOP WINNER - Seja bem vindo! Sua conta ja foi criada e segue abaixo seu login e senha para acesso ao sistema.</h2>"
				+ "<center>Voce podera alterar sua senha no painel seguindo o menu: ADMINISTRAÇÃO -> ALTERAR SENHA</center><br>"
				+ "<table>" + "<tr>" + "<td>" + "Login:" + "</td>"
				+ "<td>"
				+ user.getEmail()
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Senha:"
				+ "</td>"
				+ "<td>"
				+ user.getSenhaProvisoria()
				+ "</td>"
				+ "</table>"
				+ ""
				+ "<br>"
				+ "<span>Agora voce ja pode acessar sua area restrita do sistema.</span>"
				+ "</div>" + "</body>" + "</html>";
		return codigo;
	}
	
	public String htmlAlterarSenha(String senha){
		String codigo = "";

		codigo = "<html>" + "<head>" + "<head>" + "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     " + "  min-height:340px; '>"
				+ "<h2>TOP WINNER - Solicitacao de alteracao de senha.</h2>"
				+ "<center>Sua senha foi alterada, segue abaixo sua nova senha:</center><br>"
				+ "<table>"
				+ "<tr>"
				+ "<td>"
				+ "Senha:"
				+ "</td>"
				+ "<td>"
				+ senha
				+ "</td>"
				+ "</table>"
				+ ""
				+ "<br>"
				+ "<span>Agora voce ja pode acessar sua area restrita do sistema com sua nova senha.</span>"
				+ "</div>" + "</body>" + "</html>";
		return codigo;
	}
	
	
	public String htmlNovaContaAssociadaUsuario(String login, String senha){
		String codigo = "";

		codigo = "<html>" + "<head>" + "<head>" + "<body>"
				+ "<div style='height: 400px; width: 400px; padding:10px;"
				+ "background:#fff;              "
				+ "  transition:all 0.2s ease;     "
				+ "  border:2px dashed #dadada;    "
				+ "  margin-top: 10px;             "
				+ "  box-sizing: border-box;       "
				+ "  border-radius: 5px;           "
				+ "  background-clip: padding-box; "
				+ "  padding:0 20px 20px 20px;     " + "  min-height:340px; '>"
				+ "<h2>TOP WINNER - Nova conta criada associada.</h2>"
				+ "<center>Abaixo estao seu login e senha para acesso ao sistema:</center><br>"
				+ "<table>" + "<tr>" + "<td>" + "Login:" + "</td>"
				+ "<td>"
				+ login
				+ "</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>"
				+ "Senha:"
				+ "</td>"
				+ "<td>"
				+ senha
				+ "</td>"
				+ "</table>"
				+ ""
				+ "<br>"
				+ "<span>Agora voce ja pode acessar sua area restrita do sistema.</span>"
				+ "</div>" + "</body>" + "</html>";
		return codigo;
	}

}
