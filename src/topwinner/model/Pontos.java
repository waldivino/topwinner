package topwinner.model;

import java.util.Date;

public class Pontos {
	private Integer torneio;
	private Integer IdClienteEmpresa;
	private Integer pontos;
	private Double residuo;
	private Date dataInc;
	private Integer idUser;
	private Integer ponto0 = 0;
	private Integer ponto1 = 0;
	private Integer ponto2 = 0;
	private Integer ponto3 = 0;
	private Integer ponto4 = 0;
	private Integer ponto5 = 0;
	private Integer ponto6 = 0;
	private Integer ponto7 = 0;
	private Integer ponto8 = 0;
	private Integer ponto9 = 0;
	private Integer ponto10 = 0;
	private Integer ponto11 = 0;
	private Integer ponto12 = 0;
	private Integer ponto13 = 0;
	private Integer ponto14 = 0;
	private Integer ponto15 = 0;

	private Double calculoPonto0 = 0.00;
	private Double calculoPonto1 = 0.00;
	private Double calculoPonto2 = 0.00;
	private Double calculoPonto3 = 0.00;
	private Double calculoPonto4 = 0.00;
	private Double calculoPonto5 = 0.00;
	private Double calculoPonto6 = 0.00;
	private Double calculoPonto7 = 0.00;
	private Double calculoPonto8 = 0.00;
	private Double calculoPonto9 = 0.00;
	private Double calculoPonto10 = 0.00;
	private Double calculoPonto11 = 0.00;
	private Double calculoPonto12 = 0.00;
	private Double calculoPonto13 = 0.00;
	private Double calculoPonto14 = 0.00;
	private Double calculoPonto15 = 0.00;

	private String razaosocial = "";

	private Integer total = 0;

	public Pontos(Integer torneio, Integer idClienteEmpresa, Integer pontos, Double residuo, Date dataInc,
			Integer idUser) {
		super();
		this.torneio = torneio;
		IdClienteEmpresa = idClienteEmpresa;
		this.pontos = pontos;
		this.residuo = residuo;
		this.dataInc = dataInc;
		this.idUser = idUser;
	}

	public String getRazaosocial() {
		return razaosocial;
	}

	public void setRazaosocial(String razaosocial) {
		this.razaosocial = razaosocial;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getPonto0() {
		return ponto0;
	}

	public void setPonto0(Integer ponto0) {
		this.ponto0 = ponto0;
	}

	public Integer getPonto1() {
		return ponto1;
	}

	public void setPonto1(Integer ponto1) {
		this.ponto1 = ponto1;
	}

	public Integer getPonto2() {
		return ponto2;
	}

	public void setPonto2(Integer ponto2) {
		this.ponto2 = ponto2;
	}

	public Integer getPonto3() {
		return ponto3;
	}

	public void setPonto3(Integer ponto3) {
		this.ponto3 = ponto3;
	}

	public Integer getPonto4() {
		return ponto4;
	}

	public void setPonto4(Integer ponto4) {
		this.ponto4 = ponto4;
	}

	public Integer getPonto5() {
		return ponto5;
	}

	public void setPonto5(Integer ponto5) {
		this.ponto5 = ponto5;
	}

	public Integer getPonto6() {
		return ponto6;
	}

	public void setPonto6(Integer ponto6) {
		this.ponto6 = ponto6;
	}

	public Integer getPonto7() {
		return ponto7;
	}

	public void setPonto7(Integer ponto7) {
		this.ponto7 = ponto7;
	}

	public Integer getPonto8() {
		return ponto8;
	}

	public void setPonto8(Integer ponto8) {
		this.ponto8 = ponto8;
	}

	public Integer getPonto9() {
		return ponto9;
	}

	public void setPonto9(Integer ponto9) {
		this.ponto9 = ponto9;
	}

	public Integer getPonto10() {
		return ponto10;
	}

	public void setPonto10(Integer ponto10) {
		this.ponto10 = ponto10;
	}

	public Integer getPonto11() {
		return ponto11;
	}

	public void setPonto11(Integer ponto11) {
		this.ponto11 = ponto11;
	}

	public Integer getPonto12() {
		return ponto12;
	}

	public void setPonto12(Integer ponto12) {
		this.ponto12 = ponto12;
	}

	public Integer getPonto13() {
		return ponto13;
	}

	public void setPonto13(Integer ponto13) {
		this.ponto13 = ponto13;
	}

	public Integer getPonto14() {
		return ponto14;
	}

	public void setPonto14(Integer ponto14) {
		this.ponto14 = ponto14;
	}

	public Integer getPonto15() {
		return ponto15;
	}

	public void setPonto15(Integer ponto15) {
		this.ponto15 = ponto15;
	}

	public Double getCalculoPonto0() {
		return calculoPonto0;
	}

	public void setCalculoPonto0(Double calculoPonto0) {
		this.calculoPonto0 = calculoPonto0;
	}

	public Double getCalculoPonto1() {
		return calculoPonto1;
	}

	public void setCalculoPonto1(Double calculoPonto1) {
		this.calculoPonto1 = calculoPonto1;
	}

	public Double getCalculoPonto2() {
		return calculoPonto2;
	}

	public void setCalculoPonto2(Double calculoPonto2) {
		this.calculoPonto2 = calculoPonto2;
	}

	public Double getCalculoPonto3() {
		return calculoPonto3;
	}

	public void setCalculoPonto3(Double calculoPonto3) {
		this.calculoPonto3 = calculoPonto3;
	}

	public Double getCalculoPonto4() {
		return calculoPonto4;
	}

	public void setCalculoPonto4(Double calculoPonto4) {
		this.calculoPonto4 = calculoPonto4;
	}

	public Double getCalculoPonto5() {
		return calculoPonto5;
	}

	public void setCalculoPonto5(Double calculoPonto5) {
		this.calculoPonto5 = calculoPonto5;
	}

	public Double getCalculoPonto6() {
		return calculoPonto6;
	}

	public void setCalculoPonto6(Double calculoPonto6) {
		this.calculoPonto6 = calculoPonto6;
	}

	public Double getCalculoPonto7() {
		return calculoPonto7;
	}

	public void setCalculoPonto7(Double calculoPonto7) {
		this.calculoPonto7 = calculoPonto7;
	}

	public Double getCalculoPonto8() {
		return calculoPonto8;
	}

	public void setCalculoPonto8(Double calculoPonto8) {
		this.calculoPonto8 = calculoPonto8;
	}

	public Double getCalculoPonto9() {
		return calculoPonto9;
	}

	public void setCalculoPonto9(Double calculoPonto9) {
		this.calculoPonto9 = calculoPonto9;
	}

	public Double getCalculoPonto10() {
		return calculoPonto10;
	}

	public void setCalculoPonto10(Double calculoPonto10) {
		this.calculoPonto10 = calculoPonto10;
	}

	public Double getCalculoPonto11() {
		return calculoPonto11;
	}

	public void setCalculoPonto11(Double calculoPonto11) {
		this.calculoPonto11 = calculoPonto11;
	}

	public Double getCalculoPonto12() {
		return calculoPonto12;
	}

	public void setCalculoPonto12(Double calculoPonto12) {
		this.calculoPonto12 = calculoPonto12;
	}

	public Double getCalculoPonto13() {
		return calculoPonto13;
	}

	public void setCalculoPonto13(Double calculoPonto13) {
		this.calculoPonto13 = calculoPonto13;
	}

	public Double getCalculoPonto14() {
		return calculoPonto14;
	}

	public void setCalculoPonto14(Double calculoPonto14) {
		this.calculoPonto14 = calculoPonto14;
	}

	public Double getCalculoPonto15() {
		return calculoPonto15;
	}

	public void setCalculoPonto15(Double calculoPonto15) {
		this.calculoPonto15 = calculoPonto15;
	}

	public Pontos() {
		super();
	}

	public Integer getTorneio() {
		return torneio;
	}

	public void setTorneio(Integer torneio) {
		this.torneio = torneio;
	}

	public Integer getIdClienteEmpresa() {
		return IdClienteEmpresa;
	}

	public void setIdClienteEmpresa(Integer idClienteEmpresa) {
		IdClienteEmpresa = idClienteEmpresa;
	}

	public Integer getPontos() {
		return pontos;
	}

	public void setPontos(Integer pontos) {
		this.pontos = pontos;
	}

	public Double getResiduo() {
		return residuo;
	}

	public void setResiduo(Double residuo) {
		this.residuo = residuo;
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

	@Override
	public String toString() {
		return "Pontos [torneio=" + torneio + ", IdClienteEmpresa=" + IdClienteEmpresa + ", pontos=" + pontos
				+ ", residuo=" + residuo + ", dataInc=" + dataInc + ", idUser=" + idUser + "]";
	}

}
