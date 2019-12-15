package topwinner.sorteio;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import topwinner.model.Notas;
import topwinner.model.Parametros;
import topwinner.model.Premios;
import topwinner.model.Sorteios;
import topwinner.model.Dao.NotasDao;
import topwinner.model.Dao.ParametrosDao;
import topwinner.util.SorteioI;
import topwinner.util.Util;
import topwinner.util.ValorPosicaoDigitosEnum;

public class RealizaSorteio {

	private String numerosAcertados;
	public Integer idNota;

	static Parametros parametros = null;
	List<String> mascaraCom4;
	List<String> mascaraCom5;

	protected boolean fechaTorneio = false;
	protected boolean nenhumAchado = false;
	Integer posicao = 0;

	protected Sorteios sorteio(Sorteios sorteio, List<String> listaNumerosSorteados) throws Exception {
		mascaraCom4 = new ArrayList<String>();
		mascaraCom5 = new ArrayList<String>();
		List<Integer> pontosAcumuladosSorteioAtual = new ArrayList<Integer>();
		List<Integer> pontosAcumuladosSorteioAtualLance = new ArrayList<Integer>();
		List<String> listaNumeroAcertado = new ArrayList<String>();
		Notas nota = new Notas();
		parametros = new Parametros();
		ParametrosDao paramDao = new ParametrosDao();
		SorteioI pegaId = new GeraSorteio();

		idNota = pegaId.buscaUtimoIDNota();

		boolean jaGanhouGrandePremio = false;

		Integer sequencia = 0;
		String digitosAcertados = "";

		Integer totalPontosAumuluadosNesteSorteio = 0;
		Integer totalPontosAumuluadosNesteSorteioLance = 0;
		Integer ponto = 0;
		numerosAcertados = "";

		parametros = paramDao.buscaParametrosEmAndamento(sorteio.getCnpj());

		for (String lance : listaNumerosSorteados) {

			numerosAcertados = "";
			numerosAcertados = "";
			sequencia++;
			nota.setIdNota(idNota);
			nota.setSequencia(sequencia);
			nota.setCoo(sorteio.getCoo().toString());
			nota.setIdUser(sorteio.getIdUser());
			nota.setNrSorte(sorteio.getNumeroSorte());
			nota.setNrsorteado(lance);
			nota.setIdUser(sorteio.getIdUser());
			nota.setNumerosSorteios(String.valueOf(listaNumerosSorteados.size()));
			nota.setPontosAnteriores(sorteio.getPontosAnteriores());

			if (sorteio.getDigitos() == 4) {

				Integer um = new Integer(lance.substring(3, 4));
				Integer dois = new Integer(lance.substring(2, 3));
				Integer tres = new Integer(lance.substring(1, 2));
				Integer quatro = new Integer(lance.substring(0, 1));

				String numeroSorte = sorteio.getNumeroSorte();

				Integer digito1 = new Integer(numeroSorte.substring(3, 4));
				Integer digito2 = new Integer(numeroSorte.substring(2, 3));
				Integer digito3 = new Integer(numeroSorte.substring(1, 2));
				Integer digito4 = new Integer(numeroSorte.substring(0, 1));

				if (um.equals(digito1)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_1.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito1.toString());
					mascaraCom4.add(digito1.toString());
				}
				if (dois.equals(digito2)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_2.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito2.toString());
					mascaraCom4.add(digito2.toString());
				}
				if (tres.equals(digito3)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_3.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito3.toString());
					mascaraCom4.add(digito3.toString());
				}
				if (quatro.equals(digito4)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_4.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito4.toString());
					mascaraCom4.add(digito4.toString());
				}

			} else if (sorteio.getDigitos() == 5) {
				Integer um = new Integer(lance.substring(4, 5));
				Integer dois = new Integer(lance.substring(3, 4));
				Integer tres = new Integer(lance.substring(2, 3));
				Integer quatro = new Integer(lance.substring(1, 2));
				Integer cinco = new Integer(lance.substring(0, 1));

				String numeroSorte = sorteio.getNumeroSorte();

				Integer digito1 = new Integer(numeroSorte.substring(4, 5));
				Integer digito2 = new Integer(numeroSorte.substring(3, 4));
				Integer digito3 = new Integer(numeroSorte.substring(2, 3));
				Integer digito4 = new Integer(numeroSorte.substring(1, 2));
				Integer digito5 = new Integer(numeroSorte.substring(0, 1));

				if (um.equals(digito1)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_1.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito1.toString());
					mascaraCom5.add(digito1.toString());
				}
				if (dois.equals(digito2)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_2.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito2.toString());
					mascaraCom5.add(digito2.toString());
				}
				if (tres.equals(digito3)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_3.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito3.toString());
					mascaraCom5.add(digito3.toString());
				}
				if (quatro.equals(digito4)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_4.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito4.toString());
					mascaraCom5.add(digito4.toString());
				}
				if (cinco.equals(digito5)) {
					ponto = ValorPosicaoDigitosEnum.POSICAO_5.valorPonto;
					pontosAcumuladosSorteioAtual.add(ponto);
					pontosAcumuladosSorteioAtualLance.add(ponto);
					listaNumeroAcertado.add(digito5.toString());
					mascaraCom5.add(digito5.toString());
				}
			}

			for (Integer pontosLance : pontosAcumuladosSorteioAtualLance) {
				totalPontosAumuluadosNesteSorteioLance = totalPontosAumuluadosNesteSorteioLance + pontosLance;
			}

			if (totalPontosAumuluadosNesteSorteioLance > 0) {
				nota.setPontos(totalPontosAumuluadosNesteSorteioLance.toString());
			}

			for (String dig : listaNumeroAcertado) {
				digitosAcertados = dig + "" + digitosAcertados;
			}

			nota.setNrAcertado(digitosAcertados);

			for (Integer p : pontosAcumuladosSorteioAtual) {
				totalPontosAumuluadosNesteSorteio = totalPontosAumuluadosNesteSorteio + p;
			}

			sorteio.setPontosAcumulados(totalPontosAumuluadosNesteSorteio);

			// Chama pra gravar no banco de dados notas
			try {
				Notas notaAux = new Notas();
				NotasDao dao = new NotasDao();

				String nrAcertado = "";
				try {
					nrAcertado = nota.getNrAcertado();
					if (nrAcertado.equals("")) {
						nrAcertado = "NENHUM";
						nenhumAchado = true;
					}
				} catch (Exception e) {
					nrAcertado = "";
				}

				nota.setNrAcertado(nrAcertado);

				notaAux = dao.cadastrarNota(nota, sorteio.getCnpj(), sorteio.getCpf());

				nota.setIdNota(idNota);
				nota.setCupom(idNota + "" + sequencia);
				nota.setCnpj(sorteio.getCnpj());
				nota.setCpf(sorteio.getCpf());
				nota.setCompras(sorteio.getValorCompra());
				nota.setRazaoSocial(sorteio.getRazaoSocial());
				nota.setLogradouro(sorteio.getLogradouro());
				nota.setValorBase(sorteio.getValorBase());
				nota.setTotLances(listaNumerosSorteados.size());
				nota.setTorneio(sorteio.getTorneio());

				Date curDate = new Date();
				SimpleDateFormat format = new SimpleDateFormat();
				format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
				String DateToStr = format.format(curDate);

				nota.setDataHora(DateToStr);
				nota.setLogradouro(notaAux.getLogradouro());
				nota.setRazaoSocial(notaAux.getRazaoSocial());
				nota.setPontosAnteriores(notaAux.getPontosAcumulados());
				nota.setPontosAcumulados(notaAux.getPontosAcumulados() + totalPontosAumuluadosNesteSorteio);

				// #########################################################################################
				// #########################################################################################
				// #########################################################################################
				// #########################################################################################
				// Verifica se ganhou
				Premios premio = new Premios();
				Premios premioMaximo = new Premios();
				SorteioI daoPremio = new GeraSorteio();

				Integer pontosAcululadosDB = daoPremio.consultarPontosLance(sorteio.getCnpj(), sorteio.getCpf());

				pontosAcululadosDB = pontosAcululadosDB + totalPontosAumuluadosNesteSorteioLance;

				if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio1()) {
					premio.setIdPremio(parametros.getPremio1());
					premio.setEspecie(parametros.getEspec1());
					premio.setFaixaPremio(1);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio2()) {
					premio.setIdPremio(parametros.getPremio2());
					premio.setEspecie(parametros.getEspec2());
					premio.setFaixaPremio(2);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio3()) {
					premio.setIdPremio(parametros.getPremio3());
					premio.setEspecie(parametros.getEspec3());
					premio.setFaixaPremio(3);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio4()) {
					premio.setIdPremio(parametros.getPremio4());
					premio.setEspecie(parametros.getEspec4());
					premio.setFaixaPremio(4);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio5()) {
					premio.setIdPremio(parametros.getPremio5());
					premio.setEspecie(parametros.getEspec5());
					premio.setFaixaPremio(5);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio6()) {
					premio.setIdPremio(parametros.getPremio6());
					premio.setEspecie(parametros.getEspec6());
					premio.setFaixaPremio(6);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio7()) {
					premio.setIdPremio(parametros.getPremio7());
					premio.setEspecie(parametros.getEspec7());
					premio.setFaixaPremio(7);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				} else if (totalPontosAumuluadosNesteSorteioLance == parametros.getPremio8()) {
					premio.setIdPremio(parametros.getPremio8());
					premio.setEspecie(parametros.getEspec8());
					premio.setFaixaPremio(8);

					premio.setIdNota(idNota);
					premio.setIdUser(sorteio.getIdUser());
					premio.setSequencia(sequencia);
					premio.setValor(sorteio.getValorCompra());
					premio.setTorneio(parametros.getTorneio());
					premio.setDataInc(DateToStr);

					nota.setPremio(premio);
					daoPremio.cadastrarPremio(premio);
				}
				// **************Premio máximo**************
				else if (pontosAcululadosDB >= parametros.getPremio9()) {

					if (jaGanhouGrandePremio == false) {

						premioMaximo.setIdPremio(parametros.getPremio9());
						premioMaximo.setEspecie(parametros.getEspec9());
						premioMaximo.setFaixaPremio(9);
						premioMaximo.setIdNota(idNota);
						premioMaximo.setIdUser(sorteio.getIdUser());
						premioMaximo.setSequencia(sequencia);
						premioMaximo.setValor(sorteio.getValorCompra());
						premioMaximo.setTorneio(parametros.getTorneio());
						premio.setDataInc(DateToStr);
						nota.setPremioMaximo(premioMaximo);
						;

						daoPremio.cadastrarPremio(premioMaximo);

						fechaTorneio = true;
						jaGanhouGrandePremio = true;

					}

					// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
					// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
					totalPontosAumuluadosNesteSorteioLance = 0;
				}

				// #########################################################################################
				// #########################################################################################
				// #########################################################################################
				// #########################################################################################

				// Atualiza pontos
				if (!sorteio.getPontosAcumulados().equals(0)) {
					daoPremio.atualizapontos(sorteio.getCpf(), sorteio.getCnpj(), totalPontosAumuluadosNesteSorteio);
					sorteio.setPontosAcumulados(0);
				}

				nota.setResiduo(sorteio.getResiduoValorCompra());
				nota.setNrSorte(Util.separaNumeros(sorteio.getNumeroSorte() + "</b>", sorteio.getDigitos()));
				nota.setNrsorteado(Util.separaNumeros(lance + "</b>", sorteio.getDigitos()));
				nota.setCoo(Util.zerosEsquerda6Digitos(sorteio.getCoo().toString()));
				nota.setResiduoAnterior(sorteio.getResiduoAnterior());
				nota.setNomePremio(premio.getEspecie());
				nota.setValorSortear(sorteio.getValorTotal());
				
				if(nota.getNomePremio()  == null){
					nota.setNomePremio("");
				}
				
				if(nota.getResiduoAnterior() < 0.1){
					nota.setResiduoAnterior(0.00);
				}


				nenhumAchado = false;
				sorteio.setNotas(nota);
				nota = new Notas();
				notaAux = new Notas();
				listaNumeroAcertado = new ArrayList<String>();

				totalPontosAumuluadosNesteSorteio = 0;
				totalPontosAumuluadosNesteSorteioLance = 0;
				pontosAcumuladosSorteioAtualLance.clear();

			} catch (Exception e) {
				new Exception();
				System.out.println(e.getMessage());
			}

			digitosAcertados = "";
			listaNumeroAcertado.clear();
			pontosAcumuladosSorteioAtual.clear();

			nota.setPontos("0");
			ponto = 0;

			nota = new Notas();

		}
		SorteioI daoPremio = new GeraSorteio();
		// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		/// Fechar o torneio
		if (fechaTorneio == true) {
			boolean chave = daoPremio.fecharTorneio(parametros);
			if (chave == true) {
				System.out.println("Ludo fechado.");
			}

		}

		return sorteio;
	}

}
