package topwinner.model;

import java.util.Date;

public class Notas {
	private static final long serialVersionUID = 1L;
	private Integer idNota;
	private String cupom = "";
	private Integer sequencia = 0;
	private String coo = "";
	private Integer idClienteEmpresa;
	private String nrSorte = "";
	private String nrsorteado = "";
	private String nrAcertado = "";
	private String pontos = "0";
	private Date dataInc;
	private Integer idUser = 0;
	private Double compras = 0.00;
	private Double valorSortear = 0.00;
	private Double valorBase = 0.00;
	private String razaoSocial = "";
	private String logradouro = " ";
	private String cnpj = "";
	private String cpf = "";
	private String dataHora = "";
	private Integer totLances = 0;
	private String numerosSorteios = "";
	private Integer pontosAcumulados = 0;
	private Integer pontosAnteriores = 0;
	private Integer torneio;
	private String faixapremio;
	private String especie;
	private Double residuo;
	private Double residuoAnterior;
	private String nomePremio = "";

	private Premios premio;
	private Premios premioMaximo;
	
	
	

	public String getNomePremio() {
		return nomePremio;
	}

	public void setNomePremio(String nomePremio) {
		this.nomePremio = nomePremio;
	}

	public Double getValorSortear() {
		return valorSortear;
	}

	public void setValorSortear(Double valorSortear) {
		this.valorSortear = valorSortear;
	}

	public Integer getPontosAnteriores() {
		return pontosAnteriores;
	}

	public void setPontosAnteriores(Integer pontosAnteriores) {
		this.pontosAnteriores = pontosAnteriores;
	}

	public Double getResiduo() {
		return residuo;
	}

	public void setResiduo(Double residuo) {
		this.residuo = residuo;
	}

	public Premios getPremio() {
		return premio;
	}

	public Double getResiduoAnterior() {
		return residuoAnterior;
	}

	public void setResiduoAnterior(Double residuoAnterior) {
		this.residuoAnterior = residuoAnterior;
	}

	public void setPremio(Premios premio) {
		this.premio = premio;
	}

	public Premios getPremioMaximo() {
		return premioMaximo;
	}

	public void setPremioMaximo(Premios premioMaximo) {
		this.premioMaximo = premioMaximo;
	}

	public String getCupom() {
		return cupom;
	}

	public void setCupom(String cupom) {
		this.cupom = cupom;
	}

	public Notas() {
		super();
	}

	public Integer getIdNota() {
		return idNota;
	}

	public void setIdNota(Integer idNota) {
		this.idNota = idNota;
	}

	public Integer getSequencia() {
		return sequencia;
	}

	public void setSequencia(Integer sequencia) {
		this.sequencia = sequencia;
	}

	public String getCoo() {
		return coo;
	}

	public void setCoo(String coo) {
		this.coo = coo;
	}

	public Integer getIdClienteEmpresa() {
		return idClienteEmpresa;
	}

	public void setIdClienteEmpresa(Integer idClienteEmpresa) {
		this.idClienteEmpresa = idClienteEmpresa;
	}

	public String getNrSorte() {
		return nrSorte;
	}

	public void setNrSorte(String nrSorte) {
		this.nrSorte = nrSorte;
	}

	public String getNrsorteado() {
		return nrsorteado;
	}

	public void setNrsorteado(String nrsorteado) {
		this.nrsorteado = nrsorteado;
	}

	public String getNrAcertado() {
		return nrAcertado;
	}

	public void setNrAcertado(String nrAcertado) {
		this.nrAcertado = nrAcertado;
	}

	public String getPontos() {
		return pontos;
	}

	public void setPontos(String pontos) {
		this.pontos = pontos;
	}

	public Date getDataInc() {
		return dataInc;
	}

	public void setDataInc(Date dataInc) {
		this.dataInc = dataInc;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	public Double getCompras() {
		return compras;
	}

	public void setCompras(Double compras) {
		this.compras = compras;
	}

	public Double getValorBase() {
		return valorBase;
	}

	public void setValorBase(Double valorBase) {
		this.valorBase = valorBase;
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

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getDataHora() {
		return dataHora;
	}

	public void setDataHora(String dataHora) {
		this.dataHora = dataHora;
	}

	public Integer getTotLances() {
		return totLances;
	}

	public void setTotLances(Integer totLances) {
		this.totLances = totLances;
	}

	public String getNumerosSorteios() {
		return numerosSorteios;
	}

	public void setNumerosSorteios(String numerosSorteios) {
		this.numerosSorteios = numerosSorteios;
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

	public String getFaixapremio() {
		return faixapremio;
	}

	public void setFaixapremio(String faixapremio) {
		this.faixapremio = faixapremio;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

}
