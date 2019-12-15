package topwinner.model.Dao;

import topwinner.model.Parametros;

public class ParametrosDao extends Dao {
	public Integer buscarStatusAtivo(String cnpj) throws Exception {
		Integer status = null;
		open();

		stmt = con
				.prepareStatement("select status from parametros where cnpj = ?");

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

	public Integer ultimoNumeroTorneio(String cnpj) throws Exception {
		Integer torneio = null;
		open();

		stmt = con
				.prepareStatement("select max(torneio) from parametros where cnpj = ?");

		stmt.setString(1, cnpj);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("max(torneio)");
			torneio++;
		}

		close();

		return torneio;

	}

	public Integer buscarToneioEmAndamento(String cnpj) throws Exception {
		Integer torneio = null;
		open();

		stmt = con
				.prepareStatement("select torneio from parametros where cnpj = ? and status = ?");

		stmt.setString(1, cnpj);
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			torneio = rs.getInt("torneio");
		}

		close();

		return torneio;

	}

	public boolean cadastrarTorneio(Parametros p) throws Exception {
		boolean chave = false;
		open();

		stmt = con
				.prepareStatement("insert into parametros ("
						+ "torneio, digitos, premio1, premio2, premio3, premio4, premio5, premio6, premio7, premio8, "
						+ "premioMaximo, espec1, espec2, espec3, espec4, espec5, espec6, "
						+ "espec7, espec8, especMax, cnpj, status, idparametro)"
						+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

		stmt.setInt(1, p.getTorneio());
		stmt.setInt(2, p.getDigitos());
		stmt.setInt(3, p.getPremio1());
		stmt.setInt(4, p.getPremio2());
		stmt.setInt(5, p.getPremio3());
		stmt.setInt(6, p.getPremio4());
		stmt.setInt(7, p.getPremio5());
		stmt.setInt(8, p.getPremio6());
		stmt.setInt(9, p.getPremio7());
		stmt.setInt(10, p.getPremio8());
		stmt.setInt(11, p.getPremio9());
		stmt.setString(12, p.getEspec1());
		stmt.setString(13, p.getEspec2());
		stmt.setString(14, p.getEspec3());
		stmt.setString(15, p.getEspec4());
		stmt.setString(16, p.getEspec5());
		stmt.setString(17, p.getEspec6());
		stmt.setString(18, p.getEspec7());
		stmt.setString(19, p.getEspec8());
		stmt.setString(20, p.getEspec9());
		stmt.setString(21, p.getCnpj());
		stmt.setInt(22, p.getStatus());
		stmt.setString(23, p.getIdParametro());

		stmt.execute();

		chave = true;
		close();

		return chave;

	}

	public boolean atualizaParametro(Parametros p) throws Exception {
		boolean chave = false;
		open();

		stmt = con
				.prepareStatement("update parametros set "
						+ "digitos = ?, premio1 = ?, premio2 = ?, premio3 = ?, premio4 = ?, "
						+ "premio5 = ?, premio6 = ?, premio7 = ?, premio8 = ?, "
						+ "premioMaximo = ?, espec1 = ?, espec2 = ?, espec3 = ?, espec4 = ?, espec5 = ?, espec6 = ?, "
						+ "espec7 = ?, espec8 = ?, especMax = ?"
						+ " where cnpj = ? and status = ?");

		stmt.setInt(1, p.getDigitos());
		stmt.setInt(2, p.getPremio1());
		stmt.setInt(3, p.getPremio2());
		stmt.setInt(4, p.getPremio3());
		stmt.setInt(5, p.getPremio4());
		stmt.setInt(6, p.getPremio5());
		stmt.setInt(7, p.getPremio6());
		stmt.setInt(8, p.getPremio7());
		stmt.setInt(9, p.getPremio8());
		stmt.setInt(10, p.getPremio9());
		stmt.setString(11, p.getEspec1());
		stmt.setString(12, p.getEspec2());
		stmt.setString(13, p.getEspec3());
		stmt.setString(14, p.getEspec4());
		stmt.setString(15, p.getEspec5());
		stmt.setString(16, p.getEspec6());
		stmt.setString(17, p.getEspec7());
		stmt.setString(18, p.getEspec8());
		stmt.setString(19, p.getEspec9());
		stmt.setString(20, p.getCnpj());
		stmt.setInt(21, 0);

		stmt.execute();

		chave = true;
		close();

		return chave;

	}

	public Parametros buscaParametrosEmAndamento(String cnpj) throws Exception {
		Parametros p = null;
		open();

		stmt = con
				.prepareStatement("select torneio, digitos, premio1, premio2, premio3, premio4,"
						+ " premio5, premio6, premio7, premio8, premioMaximo, espec1, espec2, espec3, "
						+ "espec4, espec5, espec6, espec7, espec8, especMax, cnpj, status, idparametro"
						+ " from parametros where cnpj = ? and status = ?");

		stmt.setString(1, cnpj);
		stmt.setInt(2, 0);

		rs = stmt.executeQuery();

		if (rs.next()) {
			p = new Parametros(rs.getInt("torneio"), rs.getInt("digitos"),
					rs.getInt("premio1"), rs.getInt("premio2"),
					rs.getInt("premio3"), rs.getInt("premio4"),
					rs.getInt("premio5"), rs.getInt("premio6"),
					rs.getInt("premio7"), rs.getInt("premio8"),
					rs.getInt("premioMaximo"), rs.getString("espec1"),
					rs.getString("espec2"), rs.getString("espec3"),
					rs.getString("espec4"), rs.getString("espec5"),
					rs.getString("espec6"), rs.getString("espec7"),
					rs.getString("espec8"), rs.getString("especMax"),
					rs.getString("cnpj"), rs.getInt("status"),
					rs.getString("idparametro"));
		}

		close();

		return p;

	}
	
	public boolean fecharTorneio(Parametros pamametros)throws Exception{
		boolean chave = false;
		
		open();

		stmt = con
				.prepareStatement("update parametros set "
						+ "status = ? " 
						+ " where cnpj = ? and status = ?");

		stmt.setInt(1, 1);
		stmt.setString(2, pamametros.getCnpj());
		stmt.setInt(3, 0);

		stmt.execute();
		chave = true;
		
		//stmt = null;
		
		
		
		close();
		
		return chave;
	}

}
