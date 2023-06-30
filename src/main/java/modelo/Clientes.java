package modelo;

public class Clientes {
	private int cod_Cli;
	private String dni;
	private String nomb;
	private String direcci;
	private String estad;
	public Clientes() {
	}
	public Clientes(int cod_Cli, String dni, String nomb, String direcci, String estad) {
		this.cod_Cli = cod_Cli;
		this.dni = dni;
		this.nomb = nomb;
		this.direcci = direcci;
		this.estad = estad;
	}
	public int getCod_Cli() {
		return cod_Cli;
	}
	public void setCod_Cli(int cod_Cli) {
		this.cod_Cli = cod_Cli;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNomb() {
		return nomb;
	}
	public void setNomb(String nomb) {
		this.nomb = nomb;
	}
	public String getDirecci() {
		return direcci;
	}
	public void setDirecci(String direcci) {
		this.direcci = direcci;
	}
	public String getEstad() {
		return estad;
	}
	public void setEstad(String estad) {
		this.estad = estad;
	}
	
	
}
