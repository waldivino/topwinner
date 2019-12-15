package topwinner.model;

public class ClientesXEmpresas {
	private Integer idClienteEmpresa;
	private String cpf;
	private String cnpj;

	public ClientesXEmpresas(Integer idClienteEmpresa, String cpf, String cnpj) {
		super();
		this.idClienteEmpresa = idClienteEmpresa;
		this.cpf = cpf;
		this.cnpj = cnpj;
	}

	public ClientesXEmpresas() {
		super();
	}

	public Integer getIdClienteEmpresa() {
		return idClienteEmpresa;
	}

	public void setIdClienteEmpresa(Integer idClienteEmpresa) {
		this.idClienteEmpresa = idClienteEmpresa;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	@Override
	public String toString() {
		return "ClientesXEmpresas [idClienteEmpresa=" + idClienteEmpresa + ", cpf=" + cpf + ", cnpj=" + cnpj + "]";
	}

}
