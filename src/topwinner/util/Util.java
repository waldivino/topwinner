package topwinner.util;

import java.util.ArrayList;
import java.util.List;

public class Util {
	private static List<String> lista;

	public static String passGenerator(int passLength) {
		java.util.Random r = new java.util.Random();
		char[] goodChar = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
				's', 't', 'u', 'v', 'x', 'w', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', };
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < passLength; i++) {
			sb.append(goodChar[r.nextInt(goodChar.length)]);
		}
		return sb.toString();
	}

	public static Long retiraFormatacaoCnpj(String cnpj) {
		cnpj = cnpj.replace(".", "").replace("/", "").replace("-", "").replace(" ", "");

		Long aux = Long.parseLong(cnpj);

		return aux;
	}

	public static String formataDoublePara2CasasDecimais(double x) {
		return String.format("%.2f", x);
	}

	public static String separaNumeros(String numero, Integer digitos) {
		lista = new ArrayList<String>();
		String fim = "";
		char c;
		String numeroExpandido = "";
		String aux = "";
		for (int i = 0; i < numero.trim().length(); i++) {
			c = numero.charAt(i);
			aux = "" + c;
			aux = aux.toString();
			lista.add(aux.toString());
		}

		for (String s : lista) {
			numeroExpandido = numeroExpandido + s + " - ";
		}

		if (digitos == 5) {
			fim = numeroExpandido.substring(0, 17);
		} else if (digitos == 4) {
			fim = numeroExpandido.substring(0, 13);
		}
		
		return fim;
		
	}
	
	
	public static String zerosEsquerda6Digitos(String numero){
		String num = "";
		
		Integer tamanho = numero.length();
		for(int i = tamanho; i < 6; i++){
			num = "0" + num;
		}
		
		return num + numero;
	}
}
