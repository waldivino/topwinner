package topwinner.model;

import java.util.Date;

public class Empresas {
	private String cnpj;
	private String razaoSocial;
	private String nomeFantasia;
	private String logradouro;
	private String municipio;
	private String bairro;
	private String uf;
	private String telefone;
	private String contato;
	private String celular;
	private String ramoAtividade;
	private String email;
	private String cnpjMatriz;
	private Date dataInc;
	private Double valorLimite;
	private Double valorBaseVarejo;
	private Double valorBaseAtacado;
	private String strvalorLimite;
	private String strvalorBaseVarejo;
	private String strvalorBaseAtacado;
	private Integer status;
	private Integer idUser;
	private String file;
	private String senhaProvisoria;
	private Integer imprime;

	public Empresas(String nomeFantasia, String logradouro, String municipio, String bairro, String uf, String telefone,
			String contato, String celular, String ramoAtividade, String cnpjMatriz, Double valorLimite,
			Double valorBaseVarejo, Double valorBaseAtacado, int idUser) {
		super();
		this.nomeFantasia = nomeFantasia;
		this.logradouro = logradouro;
		this.municipio = municipio;
		this.bairro = bairro;
		this.uf = uf;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.ramoAtividade = ramoAtividade;
		this.cnpjMatriz = cnpjMatriz;
		this.valorLimite = valorLimite;
		this.valorBaseVarejo = valorBaseVarejo;
		this.valorBaseAtacado = valorBaseAtacado;
		this.idUser = idUser;
	}

	public Empresas(String nomeFantasia, String logradouro, String telefone, String contato, String celular,
			String ramoAtividade, String uf, String cnpjMatriz, Double valorLimite, Double valorBaseVarejo,
			Double valorBaseAtacado) {
		super();
		this.nomeFantasia = nomeFantasia;
		this.logradouro = logradouro;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.ramoAtividade = ramoAtividade;
		this.uf = uf;
		this.cnpjMatriz = cnpjMatriz;
		this.valorLimite = valorLimite;
		this.valorBaseVarejo = valorBaseVarejo;
		this.valorBaseAtacado = valorBaseAtacado;
	}

	public Empresas(String cnpj, String razaoSocial, String nomeFantasia, String logradouro, String telefone,
			String contato, String celular, String ramoAtividade, String uf, String email, String cnpjMatriz,
			Date dataInc, Double valorLimite, Double valorBaseVarejo, Double valorBaseAtacado, Integer status,
			Integer idUser) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
		this.nomeFantasia = nomeFantasia;
		this.logradouro = logradouro;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.ramoAtividade = ramoAtividade;
		this.uf = uf;
		this.email = email;
		this.cnpjMatriz = cnpjMatriz;
		this.dataInc = dataInc;
		this.valorLimite = valorLimite;
		this.valorBaseVarejo = valorBaseVarejo;
		this.valorBaseAtacado = valorBaseAtacado;
		this.status = status;
		this.idUser = idUser;
	}

	public Empresas(String valorLimite, String valorBaseVarejo, String valorBaseAtacado) {
		super();
		this.strvalorLimite = valorLimite;
		this.strvalorBaseVarejo = valorBaseVarejo;
		this.strvalorBaseAtacado = valorBaseAtacado;
	}

	public Empresas(String cnpj, String razaoSocial, String telefone, String celular, String contato, String email,
			Integer idUser) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.email = email;
		this.idUser = idUser;
	}

	public Empresas(String cnpj, String razaoSocial, String telefone, String celular, String contato, String email) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.email = email;
	}

	public Empresas(String cnpj, String razaoSocial, String telefone, String celular, String contato, String email,
			Date dataInc, Integer status, Integer idUser) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.email = email;
		this.dataInc = dataInc;
		this.status = status;
		this.idUser = idUser;
	}

	public Empresas(String cnpj, String razaoSocial, String telefone, String celular, String contato, String email,
			Integer status, Integer idUser, String senhaProvisoria) {
		super();
		this.cnpj = cnpj;
		this.razaoSocial = razaoSocial;
		this.telefone = telefone;
		this.contato = contato;
		this.celular = celular;
		this.email = email;
		this.status = status;
		this.idUser = idUser;
		this.senhaProvisoria = senhaProvisoria;
	}

	public Integer getImprime() {
		return imprime;
	}

	public void setImprime(Integer imprime) {
		this.imprime = imprime;
	}

	public String getStrvalorLimite() {
		return strvalorLimite;
	}

	public void setStrvalorLimite(String strvalorLimite) {
		this.strvalorLimite = strvalorLimite;
	}

	public String getStrvalorBaseVarejo() {
		return strvalorBaseVarejo;
	}

	public void setStrvalorBaseVarejo(String strvalorBaseVarejo) {
		this.strvalorBaseVarejo = strvalorBaseVarejo;
	}

	public String getStrvalorBaseAtacado() {
		return strvalorBaseAtacado;
	}

	public void setStrvalorBaseAtacado(String strvalorBaseAtacado) {
		this.strvalorBaseAtacado = strvalorBaseAtacado;
	}

	public String getSenhaProvisoria() {
		return senhaProvisoria;
	}

	public void setSenhaProvisoria(String senhaProvisoria) {
		this.senhaProvisoria = senhaProvisoria;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public Empresas() {
		super();
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getContato() {
		return contato;
	}

	public void setContato(String contato) {
		this.contato = contato;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getRamoAtividade() {
		return ramoAtividade;
	}

	public void setRamoAtividade(String ramoAtividade) {
		this.ramoAtividade = ramoAtividade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCnpjMatriz() {
		return cnpjMatriz;
	}

	public void setCnpjMatriz(String cnpjMatriz) {
		this.cnpjMatriz = cnpjMatriz;
	}

	public Date getDataInc() {
		return dataInc;
	}

	public void setDataInc(Date dataInc) {
		this.dataInc = dataInc;
	}

	public Double getValorLimite() {
		return valorLimite;
	}

	public void setValorLimite(Double valorLimite) {
		this.valorLimite = valorLimite;
	}

	public Double getValorBaseVarejo() {
		return valorBaseVarejo;
	}

	public void setValorBaseVarejo(Double valorBaseVarejo) {
		this.valorBaseVarejo = valorBaseVarejo;
	}

	public Double getValorBaseAtacado() {
		return valorBaseAtacado;
	}

	public void setValorBaseAtacado(Double valorBaseAtacado) {
		this.valorBaseAtacado = valorBaseAtacado;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

	@Override
	public String toString() {
		return "Empresas [cnpj=" + cnpj + ", razaoSocial=" + razaoSocial + ", nomeFantasia=" + nomeFantasia
				+ ", logradouro=" + logradouro + ", telefone=" + telefone + ", contato=" + contato + ", celular="
				+ celular + ", ramoAtividade=" + ramoAtividade + ", uf=" + uf + ", email=" + email + ", cnpjMatriz="
				+ cnpjMatriz + ", dataInc=" + dataInc + ", valorLimite=" + valorLimite + ", valorBaseVarejo="
				+ valorBaseVarejo + ", valorBaseAtacado=" + valorBaseAtacado + ", status=" + status + ", idUser="
				+ idUser + "]";
	}

}
