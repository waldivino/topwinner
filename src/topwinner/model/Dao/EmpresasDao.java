package topwinner.model.Dao;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import topwinner.model.Empresas;
import topwinner.model.Usuarios;

public class EmpresasDao extends Dao {

	public Empresas consultarLimites(Integer idUser) throws Exception {
		Empresas p = null;
		open();
		stmt = con.prepareStatement(
				"select valorlimite, valorbasevarejo, valorbaseatacado " + " from empresas where iduser = ?");
		stmt.setInt(1, idUser);

		rs = stmt.executeQuery();
		while (rs.next()) {
			NumberFormat doubleformat = NumberFormat.getInstance();
			doubleformat.setMinimumFractionDigits(2);
			doubleformat.setMaximumFractionDigits(2);

			String limite = doubleformat.format(rs.getDouble("valorlimite"));
			String vBaseVarejo = doubleformat.format(rs.getDouble("valorbasevarejo"));
			String vAtacado = doubleformat.format(rs.getDouble("valorbaseatacado"));

			p = new Empresas(limite, vBaseVarejo, vAtacado);
		}
		close();
		return p;
	}

	public boolean atualizarLimites(Empresas empresa) throws Exception {
		boolean p = false;
		open();
		stmt = con.prepareStatement("update empresas set valorlimite = ?, valorbasevarejo = ?, valorbaseatacado = ? "
				+ " where iduser = ?");
		stmt.setDouble(1, empresa.getValorLimite());
		stmt.setDouble(2, empresa.getValorBaseVarejo());
		stmt.setDouble(3, empresa.getValorBaseAtacado());
		stmt.setInt(4, empresa.getIdUser());

		stmt.execute();
		p = true;

		close();
		return p;
	}

	public String BuscarCNPJEmpresaAfiliada(Integer id) throws Exception {
		String cnpj = "";
		open();
		stmt = con.prepareStatement("select cnpj from usuarios where idUser = ?");
		stmt.setInt(1, id);
		rs = stmt.executeQuery();
		if (rs.next()) {
			cnpj = rs.getString("cnpj");
		}
		close();
		return cnpj;
	}

	public boolean cadastrarSolicitacao(Empresas p) throws Exception {
		boolean chave = false;
		open();

		stmt = con
				.prepareStatement("insert into empresas(cnpj, razaosocial, telefone, celular, contato, email, dataInc, "
						+ "status, iduser, imprime) values(?, ?, ?, ?, ?, ?, sysdate(), ?, ?, ?)");

		stmt.setString(1, p.getCnpj());
		stmt.setString(2, p.getRazaoSocial());
		stmt.setString(3, p.getTelefone());
		stmt.setString(4, p.getCelular());
		stmt.setString(5, p.getContato());
		stmt.setString(6, p.getEmail());
		stmt.setInt(7, 0);
		stmt.setInt(8, 0);
		stmt.setInt(9, 0);

		stmt.execute();

		chave = true;

		close();
		return chave;
	}

	public Empresas consultaTerminarCadastroEmpresas(Usuarios user) throws Exception {
		Empresas p = null;
		open();
		stmt = con.prepareStatement("select cnpj, razaosocial, telefone, celular, contato, email, dataInc, "
				+ "status, iduser from empresas where email = ? and cnpj = ?");
		stmt.setString(1, user.getEmail());
		stmt.setString(2, user.getCnpj());
		rs = stmt.executeQuery();
		while (rs.next()) {
			p = new Empresas(rs.getString("cnpj"), rs.getString("razaosocial"), rs.getString("telefone"),
					rs.getString("celular"), rs.getString("contato"), rs.getString("email"), rs.getDate("dataInc"),
					rs.getInt("status"), rs.getInt("idUser"));
		}
		close();
		return p;
	}

	public Empresas consultarEmpresaParaAdicionarNovoUser(String cnpj) throws Exception {
		Empresas p = null;
		open();
		stmt = con.prepareStatement("select cnpj, razaosocial, telefone, celular, contato, email, dataInc, "
				+ "status, iduser from empresas where cnpj = ?");
		stmt.setString(1, cnpj);
		rs = stmt.executeQuery();

		while (rs.next()) {
			p = new Empresas(rs.getString("cnpj"), rs.getString("razaosocial"), rs.getString("telefone"),
					rs.getString("celular"), rs.getString("contato"), rs.getString("email"), rs.getDate("dataInc"),
					rs.getInt("status"), rs.getInt("idUser"));
		}
		close();
		return p;
	}

	public boolean preencherDadosSolicitacaoAtualizaCadastro(Empresas p) throws Exception {
		boolean chave = false;
		open();
		stmt = con.prepareStatement(
				"update empresas set nomeFantasia = ?, logradouro = ?, municipio = ?, bairro = ?, uf = ?, "
						+ "telefone = ?, contato = ?, celular = ?, ramoAtividade = ?, cnpjMatriz = ?, "
						+ "valorLimite = ?, valorBaseVarejo = ?, valorBaseAtacado = ?, status = ? where iduser = ?");

		stmt.setString(1, p.getNomeFantasia());
		stmt.setString(2, p.getLogradouro());
		stmt.setString(3, p.getMunicipio());
		stmt.setString(4, p.getBairro());
		stmt.setString(5, p.getUf());
		stmt.setString(6, p.getTelefone());
		stmt.setString(7, p.getContato());
		stmt.setString(8, p.getCelular());
		stmt.setString(9, p.getRamoAtividade());
		stmt.setString(10, p.getCnpjMatriz());
		stmt.setDouble(11, p.getValorLimite());
		stmt.setDouble(12, p.getValorBaseVarejo());
		stmt.setDouble(13, p.getValorBaseAtacado());
		stmt.setInt(14, 2);
		stmt.setInt(15, p.getIdUser());

		stmt.execute();

		stmt = null;

		stmt = con.prepareStatement("update usuarios set administrador = ? where iduser = ?");
		stmt.setInt(1, 2);
		stmt.setInt(2, p.getIdUser());

		stmt.execute();

		chave = true;

		close();
		return chave;
	}

	public List<Empresas> listarSolicitacoes() throws Exception {
		Empresas p = null;
		List<Empresas> lista = new ArrayList<Empresas>();
		open();
		stmt = con.prepareStatement("select cnpj, razaosocial, telefone, celular, contato, email, dataInc, "
				+ "status, iduser from empresas where status = ?");

		stmt.setInt(1, 0);

		rs = stmt.executeQuery();
		while (rs.next()) {
			p = new Empresas(rs.getString("cnpj"), rs.getString("razaosocial"), rs.getString("telefone"),
					rs.getString("celular"), rs.getString("contato"), rs.getString("email"), rs.getDate("dataInc"),
					rs.getInt("status"), rs.getInt("idUser"));
			lista.add(p);
		}
		close();
		return lista;
	}
	
	public List<Empresas> listarEmpresasCupmImpressao() throws Exception {
		Empresas p = null;
		List<Empresas> lista = new ArrayList<Empresas>();
		open();
		stmt = con.prepareStatement("select cnpj, razaosocial, imprime from empresas");
		rs = stmt.executeQuery();
		while (rs.next()) {
			p = new Empresas();
			p.setCnpj(rs.getString("cnpj"));
			p.setRazaoSocial(rs.getString("razaosocial"));
			p.setImprime(rs.getInt("imprime"));
			lista.add(p);
		}
		close();
		return lista;
	}
	
	public Empresas buscarEmpresasCupmImpressao(String cnpj) throws Exception {
		Empresas p = null;
		open();
		stmt = con.prepareStatement("select cnpj, razaosocial, imprime from empresas where cnpj = ?");
		stmt.setString(1, cnpj);
		rs = stmt.executeQuery();
		while (rs.next()) {
			p = new Empresas();
			p.setCnpj(rs.getString("cnpj"));
			p.setRazaoSocial(rs.getString("razaosocial"));
			p.setImprime(rs.getInt("imprime"));
		}
		close();
		return p;
	}
	
	public boolean atualizaImprime(String cnpj, Integer imprime) throws Exception {
		boolean chave = false;
		open();
		stmt = con.prepareStatement("update empresas set imprime = ?  where cnpj = ?");

		stmt.setInt(1, imprime);
		stmt.setString(2, cnpj);

		stmt.execute();
		chave = true;

		close();
		return chave;
	}
	
	public boolean atualizaImprimeTodoMundo() throws Exception {
		boolean chave = false;
		open();
		stmt = con.prepareStatement("update empresas set imprime = ?");

		stmt.setInt(1, 0);

		stmt.execute();
		chave = true;

		close();
		return chave;
	}

	public boolean descartarSolicitacao(String email) throws Exception {
		boolean chave = false;
		open();
		stmt = con.prepareStatement("update empresas set status = ?  where email = ?");

		stmt.setInt(1, 5);
		stmt.setString(2, email);

		stmt.execute();
		chave = true;

		close();
		return chave;
	}
}
