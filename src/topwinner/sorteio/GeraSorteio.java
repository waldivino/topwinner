package topwinner.sorteio;

import java.util.List;

import topwinner.model.Parametros;
import topwinner.model.Premios;
import topwinner.model.Sorteios;
import topwinner.model.Dao.ClientesDao;
import topwinner.model.Dao.NotasDao;
import topwinner.model.Dao.ParametrosDao;
import topwinner.model.Dao.PontosDao;
import topwinner.model.Dao.PremiosDao;
import topwinner.sorteio.util.SorteioUtil;
import topwinner.util.SorteioI;

public class GeraSorteio implements SorteioI {
	@Override
	public List<String> geraAletoriosPorTotDigitos(Integer totDigitos, Integer totLances) throws Exception {
		List<String> lista = null;
		SorteioUtil sUtil = new SorteioUtil();

		lista = sUtil.geraAletoriosPorTotDigitos(totDigitos, totLances);

		return lista;
	}

	@Override
	public Sorteios geraSorteio(Sorteios sorteio, List<String> listaNumerosSorteados) throws Exception {
		Sorteios sorteios = null;

		RealizaSorteio rsorteio = new RealizaSorteio();
		sorteios = rsorteio.sorteio(sorteio, listaNumerosSorteados);

		return sorteios;
	}

	@Override
	public Sorteios atualizaResiduo(Sorteios sorteio) throws Exception {
		Sorteios sort = null;

		sort = new ClientesDao().atualizaResiduoTabelaPontos(sorteio);

		return sort;
	}

	@Override
	public Integer atualizapontos(String cpf, String cnpj, Integer pontos) throws Exception {
		Integer sort = 0;

		sort = new PontosDao().atualizaPontos(cpf, cnpj, pontos);

		return sort;
	}

	@Override
	public Integer buscaUtimoIDNota() throws Exception {
		Integer id = 1;

		id = new NotasDao().buscaUtimoIDNota();

		return id;
	}

	@Override
	public boolean cadastrarPremio(Premios premio) throws Exception {
		boolean chave = false;

		chave = new PremiosDao().cadatrarPremio(premio);

		return chave;
	}

	@Override
	public Integer consultarPontosLance(String cnpj, String cpf) throws Exception {
		Integer pontos = 0;

		pontos = new PremiosDao().consultarPontosLance(cnpj, cpf);

		return pontos;
	}

	@Override
	public boolean fecharTorneio(Parametros pamametros) throws Exception {
		boolean chave = false;

		chave = new ParametrosDao().fecharTorneio(pamametros);

		return chave;
	}

}
