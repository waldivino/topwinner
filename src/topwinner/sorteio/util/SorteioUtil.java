package topwinner.sorteio.util;

import java.util.ArrayList;
import java.util.List;

public class SorteioUtil{

	protected String lance;

	public List<String> geraAletoriosPorTotDigitos(Integer totDigitos, Integer totLances){
		List<String> listaDigitos = new ArrayList<String>();
		lance = "";
		if(totDigitos == 4){
			for(int i = 0; i < totLances; i++){
				Integer aleatorio = 10000000 + (int)(Math.random() * 99999999);
				
				lance = aleatorio.toString();
				lance = lance.substring(0, totDigitos);
				
				listaDigitos.add(lance);
			}
		}else if(totDigitos == 5){
			for(int i = 0; i < totLances; i++){
				Integer aleatorio = 10000000 + (int)(Math.random() * 99999999);
				
				lance = aleatorio.toString();
				lance = lance.substring(0, totDigitos);
				
				listaDigitos.add(lance);
			}
		}
		
		return listaDigitos;
	}

}
