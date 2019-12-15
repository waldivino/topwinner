package topwinner.util;

import topwinner.model.Clientes;
import topwinner.model.ClientesXEmpresas;
import topwinner.model.Sorteios;

public interface ValidaSorteioI {

	boolean verificaClienteJaCadastrado(Clientes cli, ClientesXEmpresas ce) throws Exception;

	boolean cadastrarClienteSomenteClientesxempresas(ClientesXEmpresas cliEmp) throws Exception;

	boolean verificaCooJaCadastrado(Integer coo, String cnpj, String cpf) throws Exception;

	String verificaCompraDataDoDia(String curDate, String cnpj, String cpf) throws Exception;

	Integer verificaTotalDeDigitosSorteio(String cnpj) throws Exception;
	
	Double recuperarValorParaSorteio(String cnpj, Double valorDigitado) throws Exception;
	
	Double recuperarResiduo(String cnpj, String cpf) throws Exception;
	
	Sorteios verificaSeClienteJaPossuiPontosSenaoCadastra(Sorteios sorteio) throws Exception;
	
	Sorteios atualizaResiduoTabelaPontos(Sorteios sorteio)throws Exception;

}
