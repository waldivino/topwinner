package topwinner.sorteio;

import topwinner.model.Clientes;
import topwinner.model.ClientesXEmpresas;
import topwinner.model.Sorteios;
import topwinner.model.Dao.ClientesDao;
import topwinner.util.ValidaSorteioI;

public class ValidaSorteio implements ValidaSorteioI {

	@Override
	public boolean verificaClienteJaCadastrado(Clientes cli, ClientesXEmpresas ce) throws Exception {
		boolean chave = false;

		chave = new ClientesDao().verificaClienteJaCadastrado(cli, ce);

		return chave;
	}

	@Override
	public boolean verificaCooJaCadastrado(Integer coo, String cnpj, String cpf) throws Exception {
		boolean chave = false;

		chave = new ClientesDao().verificaCooJaCadastrado(coo, cnpj, cpf);

		return chave;
	}

	@Override
	public String verificaCompraDataDoDia(String curDate, String cnpj, String cpf) throws Exception {
		String data = "";

		data = new ClientesDao().verificaCompraDataDoDia(curDate, cnpj, cpf);

		return data;
	}

	@Override
	public boolean cadastrarClienteSomenteClientesxempresas(ClientesXEmpresas cliEmp) throws Exception {
		boolean chave = false;

		chave = new ClientesDao().cadastrarClienteSomenteClientesxempresas(cliEmp);

		return chave;
	}

	@Override
	public Integer verificaTotalDeDigitosSorteio(String cnpj) throws Exception {
		Integer digitos;

		digitos = new ClientesDao().verificaTotalDeDigitosSorteio(cnpj);

		return digitos;
	}

	@Override
	public Double recuperarValorParaSorteio(String cnpj, Double valorDigitado) throws Exception {
		Double valor;

		valor = new ClientesDao().recuperarValorParaSorteio(cnpj, valorDigitado);

		return valor;
	}

	@Override
	public Double recuperarResiduo(String cnpj, String cpf) throws Exception {
		Double valor;

		valor = new ClientesDao().recuperarResiduo(cnpj, cpf);

		return valor;
	}

	@Override
	public Sorteios verificaSeClienteJaPossuiPontosSenaoCadastra(Sorteios sorteio) throws Exception {
		Sorteios sort = null;

		sort = new ClientesDao().verificaSeClienteJaPossuiPontosSenaoCadastra(sorteio);

		return sort;
	}

	@Override
	public Sorteios atualizaResiduoTabelaPontos(Sorteios sorteio) throws Exception {
		Sorteios sort = null;

		sort = new ClientesDao().atualizaResiduoTabelaPontos(sorteio);

		return sort;
	}

}
