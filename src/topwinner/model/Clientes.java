package topwinner.model;

import java.util.Date;

public class Clientes {
	private String cpf;
	private String telefone;
	private Date dataInc;
	private Integer idSuer;
	private String logradouro;
	private String complemento;
	private String municipio;
	private String bairro;
	private String uf;
	private String cep;
	private String celular;
	private Integer idade;
	private String sexo;
	private Integer estado_civil;
	private Integer renda;
	private Integer escolaridade;
	private String nome;
	private Integer atualiza = 0;
	private String tipo;

	public Clientes(String cpf, String telefone, Date dataInc, Integer idSuer) {
		super();
		this.cpf = cpf;
		this.telefone = telefone;
		this.dataInc = dataInc;
		this.idSuer = idSuer;
	}

	public Integer getAtualiza() {
		return atualiza;
	}

	public void setAtualiza(Integer atualiza) {
		this.atualiza = atualiza;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
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

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public Integer getIdade() {
		return idade;
	}

	public void setIdade(Integer idade) {
		this.idade = idade;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexos) {
		this.sexo = sexos;
	}

	public Integer getEstado_civil() {
		return estado_civil;
	}

	public void setEstado_civil(Integer estado_civil) {
		this.estado_civil = estado_civil;
	}

	public Integer getRenda() {
		return renda;
	}

	public void setRenda(Integer renda) {
		this.renda = renda;
	}

	public Integer getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(Integer escolaridade) {
		this.escolaridade = escolaridade;
	}

	public Clientes() {
		super();
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Date getDataInc() {
		return dataInc;
	}

	public void setDataInc(Date dataInc) {
		this.dataInc = dataInc;
	}

	public Integer getIdSuer() {
		return idSuer;
	}

	public void setIdSuer(Integer idSuer) {
		this.idSuer = idSuer;
	}

	@Override
	public String toString() {
		return "Clientes [cpf=" + cpf + ", telefone=" + telefone + ", dataInc=" + dataInc + ", idSuer=" + idSuer + "]";
	}

}
