package topwinner.model;

import java.util.Date;

public class Usuarios {
	private Integer iduser;
	private String login;
	private String senha;
	private Integer administrador;
	private String email;
	private String cnpj;
	private Date dataInc;

	public Usuarios(Integer iduser, String login, String senha, Integer administrador, String email, String cnpj,
			Date dataInc) {
		super();
		this.iduser = iduser;
		this.login = login;
		this.senha = senha;
		this.administrador = administrador;
		this.email = email;
		this.cnpj = cnpj;
		this.dataInc = dataInc;
	}
	
	public Usuarios(String login, String senha, String email) {
		super();
		this.login = login;
		this.senha = senha;
		this.email = email;
	}
	
	public Usuarios(Integer iduser, String login, String senha, Integer administrador, String email, String cnpj) {
		super();
		this.iduser = iduser;
		this.login = login;
		this.senha = senha;
		this.administrador = administrador;
		this.email = email;
		this.cnpj = cnpj;
	}

	public Usuarios() {
		super();
	}

	public Integer getIduser() {
		return iduser;
	}

	public void setIduser(Integer iduser) {
		this.iduser = iduser;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getAdministrador() {
		return administrador;
	}

	public void setAdministrador(Integer administrador) {
		this.administrador = administrador;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public Date getdataInc() {
		return dataInc;
	}

	public void setdataInc(Date dataInc) {
		this.dataInc = dataInc;
	}

	@Override
	public String toString() {
		return "Usuarios [iduser=" + iduser + ", login=" + login + ", senha=" + senha + ", administrador="
				+ administrador + ", email=" + email + ", cnpj=" + cnpj + ", dataInc=" + dataInc + "]";
	}

}
