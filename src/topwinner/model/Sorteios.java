package topwinner.model;

import java.util.ArrayList;
import java.util.List;

public class Sorteios {
	private static final long serialVersionUID = 1L;
	private Integer idUser;
	private String cpf;
	private String cnpj;
	private String razaoSocial;//
	private String logradouro;//
	private String dataEHoraMinSeg;//
	private String cupom;//
	private Double valorCompra;
	private Double valorTotal;
	private String coo;
	private Double valorBase;
	private Integer numeroLances;
	private String numSorteio;//
	private Double residuo;
	private Double residuoAnterior;
	private Double residuoValorCompra = 0.00;
	private String telefone;
	private String data;
	private Integer digitos;
	private Integer torneio;
	private String numeroSorte;//
	private String numeroSorteado;//
	private String numeroAcertado;//
	private String digitosAcertados;//
	private String pontosFeitos;//
	private Integer pontosAcumulados;//
	private Integer pontosAnteriores;
	private List<Notas> notas = new ArrayList<Notas>();

	
	
	
	
	public Integer getPontosAnteriores() {
		return pontosAnteriores;
	}



	public void setPontosAnteriores(Integer pontosAnteriores) {
		this.pontosAnteriores = pontosAnteriores;
	}



	public Double getResiduoAnterior() {
		return residuoAnterior;
	}



	public void setResiduoAnterior(Double residuoAnterior) {
		this.residuoAnterior = residuoAnterior;
	}



	public Double getValorTotal() {
		return valorTotal;
	}



	public void setValorTotal(Double valorTotal) {
		this.valorTotal = valorTotal;
	}



	public List<Notas> getNotas() {
		return notas;
	}



	public void setNotas(Notas nota) {
		this.notas.add(nota);
	}



	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getDataEHoraMinSeg() {
		return dataEHoraMinSeg;
	}

	public void setDataEHoraMinSeg(String dataEHoraMinSeg) {
		this.dataEHoraMinSeg = dataEHoraMinSeg;
	}

	public String getCupom() {
		return cupom;
	}

	public void setCupom(String cupom) {
		this.cupom = cupom;
	}

	public String getNumSorteio() {
		return numSorteio;
	}

	public void setNumSorteio(String numSorteio) {
		this.numSorteio = numSorteio;
	}

	public String getNumeroSorte() {
		return numeroSorte;
	}

	public void setNumeroSorte(String numeroSorte) {
		this.numeroSorte = numeroSorte;
	}

	public String getNumeroSorteado() {
		return numeroSorteado;
	}

	public void setNumeroSorteado(String numeroSorteado) {
		this.numeroSorteado = numeroSorteado;
	}

	public String getNumeroAcertado() {
		return numeroAcertado;
	}

	public void setNumeroAcertado(String numeroAcertado) {
		this.numeroAcertado = numeroAcertado;
	}

	public String getDigitosAcertados() {
		return digitosAcertados;
	}

	public void setDigitosAcertados(String digitosAcertados) {
		this.digitosAcertados = digitosAcertados;
	}

	public String getPontosFeitos() {
		return pontosFeitos;
	}

	public void setPontosFeitos(String pontosFeitos) {
		this.pontosFeitos = pontosFeitos;
	}


	public Integer getPontosAcumulados() {
		return pontosAcumulados;
	}

	public void setPontosAcumulados(Integer pontosAcumulados) {
		this.pontosAcumulados = pontosAcumulados;
	}

	public Integer getTorneio() {
		return torneio;
	}

	public void setTorneio(Integer torneio) {
		this.torneio = torneio;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Double getResiduoValorCompra() {
		return residuoValorCompra;
	}

	public void setResiduoValorCompra(Double residuoValorCompra) {
		this.residuoValorCompra = residuoValorCompra;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Double getValorCompra() {
		return valorCompra;
	}

	public void setValorCompra(Double valorCompra) {
		this.valorCompra = valorCompra;
	}

	public String getCoo() {
		return coo;
	}

	public void setCoo(String coo) {
		this.coo = coo;
	}

	public Double getValorBase() {
		return valorBase;
	}

	public void setValorBase(Double valorBase) {
		this.valorBase = valorBase;
	}

	public Integer getNumeroLances() {
		return numeroLances;
	}

	public void setNumeroLances(Integer numeroLances) {
		this.numeroLances = numeroLances;
	}

	public Double getResiduo() {
		return residuo;
	}

	public void setResiduo(Double residuo) {
		this.residuo = residuo;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Integer getDigitos() {
		return digitos;
	}

	public void setDigitos(Integer digitos) {
		this.digitos = digitos;
	}

	public Sorteios() {
		super();
	}

}
