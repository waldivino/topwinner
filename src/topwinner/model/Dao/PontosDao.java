package topwinner.model.Dao;


public class PontosDao extends Dao{
	
	public Integer atualizaPontos(String cpf, String cnpj, Integer pontos) throws Exception {
		boolean jaExiste = false;
		Integer idclienteempresa = 0;
		Integer torneio = 0;
		Integer pontosDB = 0;
		open();

		stmt = con.prepareStatement(
				"select cpf, cnpj, idclienteempresa from clientesxempresas where cnpj = ? and cpf = ?");

		stmt.setString(1, cnpj);
		stmt.setString(2, cpf);

		rs = stmt.executeQuery();

		if (rs.next()) {
			String cpf2 = rs.getString("cpf");
			String cnpj2 = rs.getString("cnpj");
			if (cnpj.equals(cnpj2) && cpf.equals(cpf2)) {
				idclienteempresa = rs.getInt("idclienteempresa");
			}
		}

		stmt = null;

		stmt = con.prepareStatement("select idclienteempresa from pontos where idclienteempresa = ?");

		stmt.setInt(1, idclienteempresa);

		rs = stmt.executeQuery();

		if (rs.next()) {
			Integer idclienteempresaDB = rs.getInt("idclienteempresa");
			if(idclienteempresaDB == idclienteempresa){
				jaExiste = true;
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
		
		stmt = con.prepareStatement("select pontos from pontos where idclienteempresa = ? and torneio = ?");

		stmt.setInt(1, idclienteempresa);
		stmt.setInt(2, torneio);

		rs = stmt.executeQuery();

		if (rs.next()) {
			pontosDB = rs.getInt("pontos");
		}

		stmt = null;

		if (jaExiste == true) {			
			
			stmt = null;

			stmt = con.prepareStatement("update pontos set pontos = ? "
					+ "where idclienteempresa = ? and torneio = ?");
			try {
				pontosDB = pontosDB + pontos;
				
			} catch (Exception e) {
				pontos = 0;
			}
			
			stmt.setInt(1, pontosDB);
			stmt.setInt(2, idclienteempresa);
			stmt.setInt(3, torneio);
			
			stmt.execute();

			close();
		}

		return pontosDB;
	}
	
}
