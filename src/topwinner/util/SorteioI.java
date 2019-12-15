package topwinner.util;

import java.util.List;

import topwinner.model.Parametros;
import topwinner.model.Premios;
import topwinner.model.Sorteios;

public interface SorteioI {
	
	List<String> geraAletoriosPorTotDigitos(Integer totDigitos, Integer totLances) throws Exception;
	
	Sorteios geraSorteio(Sorteios sorteio, List<String> listaNumerosSorteados) throws Exception;
	
	Sorteios atualizaResiduo(Sorteios sorteio)throws Exception;
	
	Integer atualizapontos(String cpf, String cnpj, Integer pontos)throws Exception;
	
	Integer buscaUtimoIDNota()throws Exception;
	
	boolean cadastrarPremio(Premios premio)throws Exception;
	
	Integer consultarPontosLance(String cnpj, String cpf) throws Exception;
	
	boolean fecharTorneio(Parametros pamametros) throws Exception;

}
