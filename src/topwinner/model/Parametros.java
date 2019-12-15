package topwinner.model;

public class Parametros {
	private Integer torneio;
	private Integer digitos;
	private Integer premio1;
	private Integer premio2;
	private Integer premio3;
	private Integer premio4;
	private Integer premio5;
	private Integer premio6;
	private Integer premio7;
	private Integer premio8;
	private Integer premioMaximo;
	private String espec1;
	private String espec2;
	private String espec3;
	private String espec4;
	private String espec5;
	private String espec6;
	private String espec7;
	private String espec8;
	private String especMax;
	private Integer imprime;
	private Integer copia;
	private String idParametro;
	private String cnpj;
	private Integer status;

	public Parametros(Integer torneio, Integer digitos, Integer premio1, Integer premio2, Integer premio3,
			Integer premio4, Integer premio5, Integer premio6, Integer premio7, Integer premio8, Integer premioMaximo,
			String espec1, String espec2, String espec3, String espec4, String espec5, String espec6, String espec7,
			String espec8, String especMax, Integer imprime, Integer copia) {
		super();
		this.torneio = torneio;
		this.digitos = digitos;
		this.premio1 = premio1;
		this.premio2 = premio2;
		this.premio3 = premio3;
		this.premio4 = premio4;
		this.premio5 = premio5;
		this.premio6 = premio6;
		this.premio7 = premio7;
		this.premio8 = premio8;
		this.premioMaximo = premioMaximo;
		this.espec1 = espec1;
		this.espec2 = espec2;
		this.espec3 = espec3;
		this.espec4 = espec4;
		this.espec5 = espec5;
		this.espec6 = espec6;
		this.espec7 = espec7;
		this.espec8 = espec8;
		this.especMax = especMax;
		this.imprime = imprime;
		this.copia = copia;
	}
	
	public Parametros(Integer torneio, Integer digitos, Integer premio1, Integer premio2, Integer premio3,
			Integer premio4, Integer premio5, Integer premio6, Integer premio7, Integer premio8, Integer premioMaximo,
			String espec1, String espec2, String espec3, String espec4, String espec5, String espec6, String espec7,
			String espec8, String especMax, String cnpj, Integer status, String idParametro) {
		super();
		this.torneio = torneio;
		this.digitos = digitos;
		this.premio1 = premio1;
		this.premio2 = premio2;
		this.premio3 = premio3;
		this.premio4 = premio4;
		this.premio5 = premio5;
		this.premio6 = premio6;
		this.premio7 = premio7;
		this.premio8 = premio8;
		this.premioMaximo = premioMaximo;
		this.espec1 = espec1;
		this.espec2 = espec2;
		this.espec3 = espec3;
		this.espec4 = espec4;
		this.espec5 = espec5;
		this.espec6 = espec6;
		this.espec7 = espec7;
		this.espec8 = espec8;
		this.especMax = especMax;
		this.cnpj = cnpj;
		this.status = status;
		this.idParametro = idParametro;
	}
	
	
	public Parametros(Integer torneio, Integer digitos, Integer premio1, Integer premio2, Integer premio3,
			Integer premio4, Integer premio5, Integer premio6, Integer premio7, Integer premio8, Integer premioMaximo,
			String espec1, String espec2, String espec3, String espec4, String espec5, String espec6, String espec7,
			String espec8, String especMax, String cnpj, String idParametro) {
		super();
		this.torneio = torneio;
		this.digitos = digitos;
		this.premio1 = premio1;
		this.premio2 = premio2;
		this.premio3 = premio3;
		this.premio4 = premio4;
		this.premio5 = premio5;
		this.premio6 = premio6;
		this.premio7 = premio7;
		this.premio8 = premio8;
		this.premioMaximo = premioMaximo;
		this.espec1 = espec1;
		this.espec2 = espec2;
		this.espec3 = espec3;
		this.espec4 = espec4;
		this.espec5 = espec5;
		this.espec6 = espec6;
		this.espec7 = espec7;
		this.espec8 = espec8;
		this.especMax = especMax;
		this.cnpj = cnpj;
		this.idParametro = idParametro;
	}
	
	

	public Parametros(Integer torneio, Integer digitos, Integer premio1,
			Integer premio2, Integer premio3, Integer premio4, Integer premio5,
			Integer premio6, Integer premio7, Integer premio8, Integer premioMaximo,
			String espec1, String espec2, String espec3, String espec4,
			String espec5, String espec6, String espec7, String espec8,
			String especMax, Integer imprime, Integer copia, String idParametro,
			String cnpj, Integer status) {
		super();
		this.torneio = torneio;
		this.digitos = digitos;
		this.premio1 = premio1;
		this.premio2 = premio2;
		this.premio3 = premio3;
		this.premio4 = premio4;
		this.premio5 = premio5;
		this.premio6 = premio6;
		this.premio7 = premio7;
		this.premio8 = premio8;
		this.premioMaximo = premioMaximo;
		this.espec1 = espec1;
		this.espec2 = espec2;
		this.espec3 = espec3;
		this.espec4 = espec4;
		this.espec5 = espec5;
		this.espec6 = espec6;
		this.espec7 = espec7;
		this.espec8 = espec8;
		this.especMax = especMax;
		this.imprime = imprime;
		this.copia = copia;
		this.idParametro = idParametro;
		this.cnpj = cnpj;
		this.status = status;
	}

	public String getIdParametro() {
		return idParametro;
	}

	public void setIdParametro(String idParametro) {
		this.idParametro = idParametro;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Parametros() {
		super();
	}

	public Integer getTorneio() {
		return torneio;
	}

	public void setTorneio(Integer torneio) {
		this.torneio = torneio;
	}

	public Integer getDigitos() {
		return digitos;
	}

	public void setDigitos(Integer digitos) {
		this.digitos = digitos;
	}

	public Integer getPremio1() {
		return premio1;
	}

	public void setPremio1(Integer premio1) {
		this.premio1 = premio1;
	}

	public Integer getPremio2() {
		return premio2;
	}

	public void setPremio2(Integer premio2) {
		this.premio2 = premio2;
	}

	public Integer getPremio3() {
		return premio3;
	}

	public void setPremio3(Integer premio3) {
		this.premio3 = premio3;
	}

	public Integer getPremio4() {
		return premio4;
	}

	public void setPremio4(Integer premio4) {
		this.premio4 = premio4;
	}

	public Integer getPremio5() {
		return premio5;
	}

	public void setPremio5(Integer premio5) {
		this.premio5 = premio5;
	}

	public Integer getPremio6() {
		return premio6;
	}

	public void setPremio6(Integer premio6) {
		this.premio6 = premio6;
	}

	public Integer getPremio7() {
		return premio7;
	}

	public void setPremio7(Integer premio7) {
		this.premio7 = premio7;
	}

	public Integer getPremio8() {
		return premio8;
	}

	public void setPremio8(Integer premio8) {
		this.premio8 = premio8;
	}

	public Integer getPremio9() {
		return premioMaximo;
	}

	public void setPremio9(Integer premioMaximo) {
		this.premioMaximo = premioMaximo;
	}

	public String getEspec1() {
		return espec1;
	}

	public void setEspec1(String espec1) {
		this.espec1 = espec1;
	}

	public String getEspec2() {
		return espec2;
	}

	public void setEspec2(String espec2) {
		this.espec2 = espec2;
	}

	public String getEspec3() {
		return espec3;
	}

	public void setEspec3(String espec3) {
		this.espec3 = espec3;
	}

	public String getEspec4() {
		return espec4;
	}

	public void setEspec4(String espec4) {
		this.espec4 = espec4;
	}

	public String getEspec5() {
		return espec5;
	}

	public void setEspec5(String espec5) {
		this.espec5 = espec5;
	}

	public String getEspec6() {
		return espec6;
	}

	public void setEspec6(String espec6) {
		this.espec6 = espec6;
	}

	public String getEspec7() {
		return espec7;
	}

	public void setEspec7(String espec7) {
		this.espec7 = espec7;
	}

	public String getEspec8() {
		return espec8;
	}

	public void setEspec8(String espec8) {
		this.espec8 = espec8;
	}

	public String getEspec9() {
		return especMax;
	}

	public void setEspec9(String especMax) {
		this.especMax = especMax;
	}

	public Integer getImprime() {
		return imprime;
	}

	public void setImprime(Integer imprime) {
		this.imprime = imprime;
	}

	public Integer getCopia() {
		return copia;
	}

	public void setCopia(Integer copia) {
		this.copia = copia;
	}

}
