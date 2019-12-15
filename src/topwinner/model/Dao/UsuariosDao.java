package topwinner.model.Dao;

import topwinner.model.Empresas;
import topwinner.model.Usuarios;

public class UsuariosDao extends Dao {

	public Usuarios logar(String login, String senha) throws Exception {
		Usuarios user = null;
		open();

		stmt = con
				.prepareStatement("select iduser, login, senha, administrador, email, cnpj from usuarios where login = ? and senha = ?");

		stmt.setString(1, login);
		stmt.setString(2, senha);

		rs = stmt.executeQuery();

		if (rs.next()) {
			user = new Usuarios(rs.getInt("iduser"), rs.getString("login"),
					rs.getString("senha"), rs.getInt("administrador"),
					rs.getString("email"), rs.getString("cnpj"));
		}
		close();

		return user;

	}
	
	public Integer totSolicitacoes() throws Exception {
		Integer total = null;
		open();

		stmt = con
				.prepareStatement("select count(*) from empresas where status = ?");

		stmt.setInt(1, 0);
		
		rs = stmt.executeQuery();

		if (rs.next()) {
			total = rs.getInt("count(*)");
		}
		close();

		return total;

	}

	public Usuarios recuperarSenha(String email, String cnpj) throws Exception {
		Usuarios user = null;

		open();

		stmt = con
				.prepareStatement("select login, senha, email from usuarios where email = ? and cnpj = ?");

		stmt.setString(1, email);
		stmt.setString(2, cnpj);

		rs = stmt.executeQuery();

		if (rs.next()) {
			user = new Usuarios(rs.getString("login"), rs.getString("senha"),
					rs.getString("email"));
		}
		close();

		return user;
	}

	public boolean criarConta(Empresas e) throws Exception {
		boolean chave = false;
		Integer idUsuario = 0;
		open();
	
		stmt = con
				.prepareStatement("insert into usuarios(login, senha, administrador, email, cnpj, "
						+ " dataInc) values(?, ?, ?, ?, ?, sysdate())");

		stmt.setString(1, e.getEmail());
		stmt.setString(2, e.getSenhaProvisoria());
		stmt.setInt(3, e.getStatus());
		stmt.setString(4, e.getEmail());
		stmt.setString(5, e.getCnpj());

		stmt.executeUpdate();

		rs = stmt.getGeneratedKeys();

		if (rs.next()) {
			idUsuario = rs.getInt(1);
		}

		stmt = null;

		stmt = con
				.prepareStatement("update empresas set status = ?, iduser = ? where cnpj = ?");
		stmt.setInt(1, -1);
		stmt.setInt(2, idUsuario);
		stmt.setString(3, e.getCnpj());

		stmt.execute();

		chave = true;

		close();
		return chave;
	}

	public boolean alterarSenha(String senha, Integer idUser) throws Exception {
		boolean chave = false;
		open();
		stmt = con
				.prepareStatement("update usuarios set senha = ? where iduser = ?");
		stmt.setString(1, senha);
		stmt.setInt(2, idUser);

		stmt.execute();
		
		chave = true;

		close();
		return chave;
	}
	
	
	public boolean adicionarNovoUsuario(Empresas e) throws Exception {
		boolean chave = false;
		open();
		
		stmt = con
				.prepareStatement("insert into usuarios(login, senha, administrador, email, cnpj, "
						+ " dataInc) values(?, ?, ?, ?, ?, sysdate())");

		stmt.setString(1, e.getEmail());
		stmt.setString(2, e.getSenhaProvisoria());
		stmt.setInt(3, 3);
		stmt.setString(4, e.getEmail());
		stmt.setString(5, e.getCnpj());

		stmt.execute();

		chave = true;

		close();
		return chave;
	}
}
