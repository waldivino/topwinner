package topwinner.model.Dao;

import topwinner.model.Notas;
import topwinner.model.Parametros;
import topwinner.model.Premios;

public class PremiosDao extends Dao {

	public boolean cadatrarPremio(Premios premio) throws Exception {
		boolean chave = false;
		open();

		stmt = con.prepareStatement(
				"insert into premios(torneio, idnota, sequencia, faixapremio, especie, datainc, iduser) "
						+ "values(?, ?, ?, ?, ?, sysdate(), ?)");
		stmt.setInt(1, premio.getTorneio());
		stmt.setInt(2, premio.getIdNota());
		stmt.setInt(3, premio.getSequencia());
		stmt.setInt(4, premio.getFaixaPremio());
		stmt.setString(5, premio.getEspecie());
		stmt.setInt(6, premio.getIdUser());

		stmt.execute();
		chave = true;

		close();
		return chave;
	}

	public Integer consultarPontosLance(String cnpj, String cpf) throws Exception {
		open();
		Integer pontosAcululados = 0;
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		
		stmt = con.prepareStatement("select torneio from parametros where cnpj = ? and status = ?");

		stmt.setString(1, cnpj);
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("torneio");
		}

		stmt = null;
		
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
			}
		}

		stmt = null;

		stmt = con.prepareStatement("select pontos from pontos where idclienteempresa = ? and torneio = ?");

		stmt.setInt(1, idclienteempresa);
		stmt.setInt(2, torneio);

		rs = stmt.executeQuery();

		if (rs.next()) {
			pontosAcululados = rs.getInt("pontos");
		}

		close();
		return pontosAcululados;
	}

	public Premios cadastraPremio(Notas nota) throws Exception {
		Premios premio = new Premios();
		open();

		stmt = con.prepareStatement("insert into premios(torneio, idnota, sequencia, faixapremio, especie, valor, "
				+ "datainc, iduser) values(?, ?, ?, ?, ?, ?, Curdate(), ?)");

		stmt.setInt(1, nota.getTorneio());
		stmt.setInt(2, nota.getIdNota());
		stmt.setInt(3, nota.getSequencia());
		stmt.setString(4, nota.getFaixapremio());
		stmt.setString(5, nota.getEspecie());
		stmt.setDouble(6, nota.getCompras());
		stmt.setInt(7, nota.getIdUser());

		close();
		return premio;
	}

	public Parametros buscaParametrosEmAndamento(Notas nota) throws Exception {
		Parametros p = null;
		open();

		stmt = con.prepareStatement("select torneio, digitos, premio1, premio2, premio3, premio4,"
				+ " premio5, premio6, premio7, premio8, premioMaximo, espec1, espec2, espec3, "
				+ "espec4, espec5, espec6, espec7, espec8, especMax, cnpj, status, idparametro"
				+ " from parametros where cnpj = ? and status = ?");

		stmt.setString(1, nota.getCnpj());
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			p = new Parametros(rs.getInt("torneio"), rs.getInt("digitos"), rs.getInt("premio1"), rs.getInt("premio2"),
					rs.getInt("premio3"), rs.getInt("premio4"), rs.getInt("premio5"), rs.getInt("premio6"),
					rs.getInt("premio7"), rs.getInt("premio8"), rs.getInt("premioMaximo"), rs.getString("espec1"),
					rs.getString("espec2"), rs.getString("espec3"), rs.getString("espec4"), rs.getString("espec5"),
					rs.getString("espec6"), rs.getString("espec7"), rs.getString("espec8"), rs.getString("especMax"),
					rs.getString("cnpj"), rs.getInt("status"), rs.getString("idparametro"));
		}

		close();

		return p;

	}

}
