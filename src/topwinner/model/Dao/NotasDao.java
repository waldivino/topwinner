package topwinner.model.Dao;

import topwinner.model.Notas;

public class NotasDao extends Dao {

	public Integer buscaUtimoIDNota() throws Exception {
		open();
		Integer idNota = 1;
		stmt = con.prepareStatement("select max(idnota) from notas");

		rs = stmt.executeQuery();

		if (rs.next()) {
			idNota = rs.getInt("max(idnota)");
			idNota++;
		}
		close();
		return idNota;
	}

	public Notas cadastrarNota(Notas nota, String cnpj, String cpf) throws Exception {
		Notas chave = new Notas();
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		open();

		stmt = con.prepareStatement(
				"select cpf, cnpj, idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cnpj);
		stmt.setString(2, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			String xcpf = rs.getString("cpf");
			String xcnpj = rs.getString("cnpj");
			if (xcnpj.equals(cnpj) && xcpf.equals(cpf)) {
				idclienteempresa = rs.getInt("idclienteempresa");
				nota.setIdClienteEmpresa(idclienteempresa);
			}
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

		stmt = con.prepareStatement("insert into notas (idnota, sequencia, coo, idclienteempresa,"
				+ " nrsorte, nrsorteado, nracertado, pontos, datainc, iduser) values(?, ?, ?, ?, ?, ?, ?, ?, sysdate(), ?)");

		stmt.setInt(1, nota.getIdNota());
		stmt.setInt(2, nota.getSequencia());
		stmt.setInt(3, new Integer(nota.getCoo()));
		stmt.setInt(4, nota.getIdClienteEmpresa());
		stmt.setString(5, nota.getNrSorte());
		stmt.setString(6, nota.getNrsorteado());

		String nrAcertado = "";
		try {
			nrAcertado = nota.getNrAcertado();
			if (nrAcertado.equals("")) {
				nrAcertado = "NENHUM";
			}
		} catch (Exception e) {
			nrAcertado = "";
		}

		stmt.setString(7, nrAcertado);
		String pontos = "0";
		try {
			pontos = nota.getPontos();
		} catch (Exception e) {
			pontos = "0";
		}
		stmt.setString(8, pontos);
		stmt.setInt(9, nota.getIdUser());

		stmt.executeUpdate();

//		rs = stmt.getGeneratedKeys();
//
//		if (rs.next()) {
//			chave.setIdNota(rs.getInt(1));
//		}

		stmt = null;

		stmt = con.prepareStatement("select cnpj, razaosocial, telefone, celular, contato, email, dataInc, "
				+ "status, iduser, logradouro from empresas where cnpj = ?");
		stmt.setString(1, cnpj);

		rs = stmt.executeQuery();

		while (rs.next()) {
			chave.setLogradouro(rs.getString("logradouro"));
			chave.setRazaoSocial(rs.getString("razaosocial"));
		}

		stmt = null;

		stmt = con.prepareStatement("select pontos from pontos where idclienteempresa = ? and torneio = ?");

		stmt.setInt(1, idclienteempresa);
		stmt.setInt(2, torneio);

		rs = stmt.executeQuery();

		if (rs.next()) {
			chave.setPontosAcumulados(rs.getInt("pontos"));
		}

		close();
		return chave;
	}
}
