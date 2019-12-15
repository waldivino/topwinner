package topwinner.model.Dao;

import java.text.NumberFormat;

import topwinner.model.Pontos;

public class RelatoriosDao extends Dao {

	public Integer perc() throws Exception {
		Integer p = 0;
		open();
		stmt = con.prepareStatement("select count(*) perc " + "from ( " + "select count(pontos) cpf, pontos "
				+ "from ( " + "select n.idclienteempresa,sum(pontos) pontos "
				+ "from notas n, clientesxempresas ce,parametros p " + "where n.idclienteempresa = ce.idclienteempresa "
				+ "and ce.cnpj = p.cnpj " + "and p.status=0 " + "group by idclienteempresa) t " + "group by pontos) o");

		rs = stmt.executeQuery();
		while (rs.next()) {

			p = rs.getInt("perc");
		}
		close();
		return p;
	}

	public Pontos SorteiosMesAno(String cnpj, Integer mes, Integer ano) throws Exception {
		Pontos p = new Pontos();
		NumberFormat doubleformat = NumberFormat.getInstance();
		doubleformat.setMinimumFractionDigits(2);
		doubleformat.setMaximumFractionDigits(2);

		open();
		rs = null;
		try {

			stmt = con.prepareStatement("select max(torneio) from parametros where cnpj = ?");

			stmt.setString(1, cnpj);

			rs = stmt.executeQuery();

			if (rs.next()) {
				int torneio = rs.getInt("max(torneio)");
				p.setTorneio(torneio);
			}

			stmt = null;

			Integer totalPontos = 0;
			stmt = con.prepareStatement("select count(1) from notas n, clientesxempresas ce, empresas e "
					+ "where n.idclienteempresa = ce.idclienteempresa and ce.cnpj = e.cnpj "
					+ "and MONTH(n.datainc) = ? " + "and  YEAR(n.datainc) = ? " + "and e.cnpj = ?");

			stmt.setInt(1, mes);
			stmt.setInt(2, ano);
			stmt.setString(3, cnpj);

			rs = stmt.executeQuery();

			if (rs.next()) {
				totalPontos = rs.getInt("count(1)");
				p.setTotal(totalPontos);
			}

			stmt = null;

			stmt = con.prepareStatement(
					"select razaosocial, pontos, count(1) " + "from notas n, clientesxempresas ce, empresas e "
							+ "where n.idclienteempresa = ce.idclienteempresa " + "and ce.cnpj = e.cnpj "
							+ "and MONTH(n.datainc) = ? " + "and YEAR(n.datainc) = ? " + "and e.cnpj = ? "
							+ "group by razaosocial,pontos " + "order by 1,2");

			stmt.setInt(1, mes);
			stmt.setInt(2, ano);
			stmt.setString(3, cnpj);

			rs = stmt.executeQuery();

			while (rs.next()) {

				p.setRazaosocial(rs.getString("razaosocial"));

				if (rs.getInt("pontos") == 0) {

					p.setPonto0(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto0(new Double(calcStr));

				} else if (rs.getInt("pontos") == 1) {

					p.setPonto1(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto1(new Double(calcStr));

				} else if (rs.getInt("pontos") == 2) {

					p.setPonto2(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto2(new Double(calcStr));

				} else if (rs.getInt("pontos") == 3) {

					p.setPonto3(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto3(new Double(calcStr));

				} else if (rs.getInt("pontos") == 4) {

					p.setPonto4(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto4(new Double(calcStr));

				} else if (rs.getInt("pontos") == 5) {

					p.setPonto5(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto5(new Double(calcStr));

				} else if (rs.getInt("pontos") == 6) {

					p.setPonto6(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto6(new Double(calcStr));

				} else if (rs.getInt("pontos") == 7) {

					p.setPonto7(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto7(new Double(calcStr));

				} else if (rs.getInt("pontos") == 8) {

					p.setPonto8(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto8(new Double(calcStr));

				} else if (rs.getInt("pontos") == 9) {

					p.setPonto9(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto9(new Double(calcStr));

				} else if (rs.getInt("pontos") == 10) {

					p.setPonto10(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto10(new Double(calcStr));

				} else if (rs.getInt("pontos") == 11) {

					p.setPonto11(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto11(new Double(calcStr));

				} else if (rs.getInt("pontos") == 12) {

					p.setPonto12(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto12(new Double(calcStr));

				} else if (rs.getInt("pontos") == 13) {

					p.setPonto13(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto13(new Double(calcStr));

				} else if (rs.getInt("pontos") == 14) {

					p.setPonto14(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto14(new Double(calcStr));

				} else if (rs.getInt("pontos") == 15) {

					p.setPonto15(rs.getInt("count(1)"));
					Integer aux = rs.getInt("count(1)");
					Double calc = (new Double(aux) / totalPontos) * 100;
					String calcStr = doubleformat.format(calc);
					calcStr = calcStr.replace(",", ".");
					p.setCalculoPonto15(new Double(calcStr));

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return p;
	}

}
