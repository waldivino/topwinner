package topwinner.model.Dao;

import topwinner.model.Clientes;
import topwinner.model.ClientesXEmpresas;
import topwinner.model.Sorteios;

public class ClientesDao extends Dao {

	public void atualizaDadosCliente(Clientes cli, String cnpj, int idUser) throws Exception {
		open();

		stmt = con.prepareStatement("update clientes set nome = ?, logradouro = ?, complemento = ?, "
				+ "municipio = ?, bairro = ?, uf = ?, cep = ?, celular = ?, idade = ?, sexo = ?, "
				+ "estado_civil = ?, renda = ?, escolaridade = ?, tipo = ? where cpf = ?");

		stmt.setString(1, cli.getNome());
		stmt.setString(2, cli.getLogradouro());
		stmt.setString(3, cli.getComplemento());
		stmt.setString(4, cli.getMunicipio());
		stmt.setString(5, cli.getBairro());
		stmt.setString(6, cli.getUf());
		stmt.setString(7, cli.getCep());
		stmt.setString(8, cli.getCelular());
		stmt.setInt(9, cli.getIdade());
		stmt.setString(10, cli.getSexo());
		stmt.setInt(11, cli.getEstado_civil());
		stmt.setInt(12, cli.getRenda());
		stmt.setInt(13, cli.getEscolaridade());
		stmt.setString(14, cli.getTipo());
		stmt.setString(15, cli.getCpf());

		stmt.execute();

		close();
	}

	public Integer buscarStatusAtivoParametros(String cnpj) throws Exception {
		Integer status = 2;
		open();

		stmt = con.prepareStatement("select status from parametros where cnpj = ?");

		stmt.setString(1, cnpj);

		rs = stmt.executeQuery();

		while (rs.next()) {
			status = rs.getInt("status");
			if (status == 0) {
				return status;
			}
		}

		close();

		return status;

	}

	public Integer verificaTotalDeDigitosSorteio(String cnpj) throws Exception {
		Integer digitos = 4;
		open();

		stmt = con.prepareStatement("select digitos from parametros where cnpj = ? and status = ?");

		stmt.setString(1, cnpj);
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			digitos = rs.getInt("digitos");
		}

		close();

		return digitos;

	}

	public Double recuperarValorParaSorteio(String cnpj, Double valorDigitado) throws Exception {
		Double valor = 0.00;
		Double valorlimite = 0.00;
		Double valorbasevarejo = 0.00;
		Double valorbaseatacado = 0.00;
		open();

		stmt = con.prepareStatement(
				"select valorlimite, valorbasevarejo, valorbaseatacado from empresas " + "where cnpj = ?");

		stmt.setString(1, cnpj);

		rs = stmt.executeQuery();

		if (rs.next()) {
			valorlimite = rs.getDouble("valorlimite");
			valorbasevarejo = rs.getDouble("valorbasevarejo");
			valorbaseatacado = rs.getDouble("valorbaseatacado");

			if (valorDigitado > valorlimite) {
				valor = valorbaseatacado;
			} else if (valorDigitado <= valorlimite) {
				valor = valorbasevarejo;
			}

		}

		close();

		return valor;

	}

	public Double recuperarResiduo(String cnpj, String cpf) throws Exception {
		Double residuo = 0.00;
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		open();

		stmt = con.prepareStatement("select idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cnpj);
		stmt.setString(2, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			idclienteempresa = rs.getInt("idclienteempresa");
		}

		stmt = null;

		stmt = con.prepareStatement("select torneio from parametros where cnpj = ? and status = ?");

		stmt.setString(1, cnpj);
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("torneio");
		}

		stmt = null;

		stmt = con.prepareStatement("select residuo from pontos " + "where idclienteempresa = ? and torneio = ?");

		stmt.setInt(1, idclienteempresa);
		stmt.setInt(2, torneio);

		rs = stmt.executeQuery();

		if (rs.next()) {
			residuo = rs.getDouble("residuo");
		}

		close();

		return residuo;

	}

	public boolean inserirClienteEmpresa(Clientes cli, ClientesXEmpresas cliEmp) throws Exception {
		boolean chave = false;
		open();

		boolean jaExiste = false;
		open();

		stmt = con.prepareStatement("select cpf from clientes where cpf = ?");

		stmt.setString(1, cli.getCpf());

		rs = stmt.executeQuery();

		if (rs.next()) {
			String cpf = rs.getString("cpf");
			if (cli.getCpf().equals(cpf)) {
				jaExiste = true;
			}
		}

		if (jaExiste == false) {
			stmt = con.prepareStatement(
					"insert into clientes (cpf, telefone, datainc, idUser) values(?, ?, sysdate(), ?)");

			stmt.setString(1, cli.getCpf());
			stmt.setString(2, cli.getTelefone());
			stmt.setInt(3, cli.getIdSuer());

			stmt.execute();

			stmt = null;

			stmt = con.prepareStatement("insert into clientesxempresas(cpf, cnpj) values(?, ?)");

			stmt.setString(1, cliEmp.getCpf());
			stmt.setString(2, cliEmp.getCnpj());

			stmt.execute();

			chave = true;

		}

		close();

		return chave;
	}

	public boolean cadastrarClienteSomenteClientesxempresas(ClientesXEmpresas cliEmp) throws Exception {
		boolean chave = false;
		boolean jaExiste = false;
		open();

		stmt = con.prepareStatement("select cpf, cnpj from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cliEmp.getCnpj());
		stmt.setString(2, cliEmp.getCpf());

		rs = stmt.executeQuery();

		if (rs.next()) {
			String cpf = rs.getString("cpf");
			String cnpj = rs.getString("cnpj");
			if (cliEmp.getCnpj().equals(cnpj) && cliEmp.getCpf().equals(cpf)) {
				jaExiste = true;
				return chave;
			}
		}

		if (jaExiste == false) {
			stmt = null;

			stmt = con.prepareStatement("insert into clientesxempresas(cpf, cnpj) values(?, ?)");

			stmt.setString(1, cliEmp.getCpf());
			stmt.setString(2, cliEmp.getCnpj());

			stmt.execute();

			chave = true;

			close();
		}

		return chave;
	}

	public Sorteios verificaSeClienteJaPossuiPontosSenaoCadastra(Sorteios sorteio) throws Exception {
		Sorteios sorte = null;
		boolean jaExiste = false;
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		open();

		stmt = con.prepareStatement(
				"select cpf, cnpj, idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, sorteio.getCnpj());
		stmt.setString(2, sorteio.getCpf());

		rs = stmt.executeQuery();

		if (rs.next()) {
			String cpf = rs.getString("cpf");
			String cnpj = rs.getString("cnpj");
			if (sorteio.getCnpj().equals(cnpj) && sorteio.getCpf().equals(cpf)) {
				idclienteempresa = rs.getInt("idclienteempresa");
			}
		}

		stmt = null;

		stmt = con.prepareStatement("select torneio from parametros where cnpj = ? and status = ?");

		stmt.setString(1, sorteio.getCnpj());
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("torneio");
		}

		stmt = null;

		stmt = con.prepareStatement("select idclienteempresa from pontos where idclienteempresa = ? and torneio = ?");

		stmt.setInt(1, idclienteempresa);
		stmt.setInt(2, torneio);

		rs = stmt.executeQuery();

		if (rs.next()) {
			Integer idclienteempresaDB = rs.getInt("idclienteempresa");
			if (idclienteempresaDB == idclienteempresa) {
				jaExiste = true;
			}
		}

		stmt = null;

		if (jaExiste == false) {
			stmt = null;

			stmt = con
					.prepareStatement("insert into pontos(torneio, idclienteempresa, pontos, residuo, datainc, iduser) "
							+ "values(?, ?, ?, ?, sysdate(), ?)");

			stmt.setInt(1, torneio);
			stmt.setInt(2, idclienteempresa);
			stmt.setInt(3, 0);
			double residuoValorCompra = 0.00;
			try {
				residuoValorCompra = sorteio.getResiduoValorCompra();
			} catch (Exception e) {
				residuoValorCompra = 0.00;
			}

			stmt.setDouble(4, residuoValorCompra);
			stmt.setInt(5, sorteio.getIdUser());

			stmt.execute();

			sorteio.setTorneio(torneio);
			sorte = sorteio;

			close();
		}

		return sorte;
	}

	public Sorteios atualizaResiduoTabelaPontos(Sorteios sorteio) throws Exception {
		Sorteios sorte = null;
		boolean jaExiste = false;
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		open();

		stmt = con.prepareStatement(
				"select cpf, cnpj, idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, sorteio.getCnpj());
		stmt.setString(2, sorteio.getCpf());

		rs = stmt.executeQuery();

		if (rs.next()) {
			String cpf = rs.getString("cpf");
			String cnpj = rs.getString("cnpj");
			if (sorteio.getCnpj().equals(cnpj) && sorteio.getCpf().equals(cpf)) {
				idclienteempresa = rs.getInt("idclienteempresa");
			}
		}

		stmt = null;

		stmt = con.prepareStatement("select idclienteempresa from pontos where idclienteempresa = ?");

		stmt.setInt(1, idclienteempresa);

		rs = stmt.executeQuery();

		if (rs.next()) {
			Integer idclienteempresaDB = rs.getInt("idclienteempresa");
			if (idclienteempresaDB == idclienteempresa) {
				jaExiste = true;
			}
		}

		stmt = null;

		stmt = con.prepareStatement("select torneio from parametros where cnpj = ? and status = ?");

		stmt.setString(1, sorteio.getCnpj());
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("torneio");
		}

		stmt = null;

		if (jaExiste == true) {

			stmt = null;

			stmt = con
					.prepareStatement("update pontos set residuo = ? " + "where idclienteempresa = ? and torneio = ?");

			sorteio.setResiduoValorCompra(sorteio.getResiduoValorCompra());

			stmt.setDouble(1, sorteio.getResiduoValorCompra());
			stmt.setInt(2, idclienteempresa);
			stmt.setInt(3, torneio);

			stmt.execute();

			sorteio.setTorneio(torneio);
			sorte = sorteio;

			close();
		}

		return sorte;
	}

	public boolean verificaClienteJaCadastrado(Clientes cli, ClientesXEmpresas ce) throws Exception {
		open();
		boolean chave = false;
		stmt = con.prepareStatement(
				"select cpf, cnpj, idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, ce.getCnpj());
		stmt.setString(2, ce.getCpf());

		rs = stmt.executeQuery();

		String cpf = "";
		if (rs.next()) {
			cpf = rs.getString("cpf");
			if (cpf.equals(cli.getCpf())) {
				chave = true;
			}
		}
		close();
		return chave;
	}

	public Clientes buscarClienteJaCadastrado(String cpf, int id) throws Exception {
		Clientes cliente = null;
		open();

		stmt = con.prepareStatement("select idUser, cpf, telefone, celular,  nome, logradouro, "
				+ " complemento, municipio, bairro, uf, idade, sexo, estado_civil, renda, "
				+ " escolaridade, tipo, cep from clientes where cpf = ?");

		stmt.setString(1, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			cliente = new Clientes();
			cliente.setIdSuer(rs.getInt("idUser"));
			cliente.setCpf(rs.getString("cpf"));
			cliente.setTelefone(rs.getString("telefone"));
			cliente.setCelular(rs.getString("celular"));
			cliente.setNome(rs.getString("nome"));
			cliente.setLogradouro(rs.getString("logradouro"));
			cliente.setComplemento(rs.getString("complemento"));
			cliente.setMunicipio(rs.getString("municipio"));
			cliente.setBairro(rs.getString("bairro"));
			cliente.setUf(rs.getString("uf"));
			cliente.setIdade(rs.getInt("idade"));
			cliente.setSexo(rs.getString("sexo"));
			cliente.setEstado_civil(rs.getInt("estado_civil"));
			cliente.setRenda(rs.getInt("renda"));
			cliente.setEscolaridade(rs.getInt("escolaridade"));
			cliente.setTipo(rs.getString("tipo"));
			cliente.setCep(rs.getString("cep"));
		}
		close();
		return cliente;
	}

	public boolean verificaCooJaCadastrado(Integer coo, String cnpj, String cpf) throws Exception {
		open();
		boolean chave = false;
		Integer idclienteempresa = 0;

		stmt = con.prepareStatement("select idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cnpj);
		stmt.setString(2, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			idclienteempresa = rs.getInt("idclienteempresa");
		}

		stmt = null;

		stmt = con.prepareStatement("select coo from notas where coo = ? and idclienteempresa = ?");

		stmt.setInt(1, coo);
		stmt.setInt(2, idclienteempresa);

		rs = stmt.executeQuery();

		Integer cooAux = 0;
		if (rs.next()) {
			cooAux = rs.getInt("coo");
			if (cooAux.equals(coo)) {
				chave = true;
			}
		}
		close();
		return chave;
	}

	public String verificaCompraDataDoDia(String data, String cnpj, String cpf) throws Exception {
		open();
		String dataHohe = "";
		Integer idclienteempresa = 0;

		stmt = con.prepareStatement("select idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cnpj);
		stmt.setString(2, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			idclienteempresa = rs.getInt("idclienteempresa");
		}

		stmt = null;

		stmt = con.prepareStatement("select datainc from notas INNER JOIN clientesxempresas ON "
				+ "clientesxempresas.idclienteempresa = notas.idclienteempresa "
				+ "where datainc = DATE_FORMAT(datainc, ?) and "
				+ "clientesxempresas.cpf = ? and notas.idclienteempresa = ?");

		stmt.setString(1, data);
		stmt.setString(2, cpf);
		stmt.setInt(3, idclienteempresa);

		rs = stmt.executeQuery();

		if (rs.next()) {
			String dataSql = rs.getString("datainc");
			if (dataSql.equals(data)) {
				dataHohe = dataSql;
			}
		}
		close();
		return dataHohe;
	}
}
