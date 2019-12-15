package topwinner.model;

import java.util.Date;

public class Premios {
	private Integer idPremio;
	private Integer torneio;
	private Integer idNota;
	private Integer sequencia;
	private Integer faixaPremio;
	private String especie;
	private Double valor;
	private String dataInc;
	private Integer idUser;

	public Integer getIdPremio() {
		return idPremio;
	}

	public void setIdPremio(Integer idPremio) {
		this.idPremio = idPremio;
	}

	public Integer getTorneio() {
		return torneio;
	}

	public void setTorneio(Integer torneio) {
		this.torneio = torneio;
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

	public Integer getFaixaPremio() {
		return faixaPremio;
	}

	public void setFaixaPremio(Integer faixaPremio) {
		this.faixaPremio = faixaPremio;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public String getDataInc() {
		return dataInc;
	}

	public void setDataInc(String dataInc) {
		this.dataInc = dataInc;
	}

	public Integer getIdUser() {
		return idUser;
	}

	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}

}
