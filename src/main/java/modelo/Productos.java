package modelo;

public class Productos {
	private int cod_prod;
	private String nomb;
	private double prec;
	private int stoc;
	private String estad;
	
	
	
	
	
	
	public Productos() {
	}





	public Productos(int cod_prod, String nomb, double prec, int stoc, String estad) {
		this.cod_prod = cod_prod;
		this.nomb = nomb;
		this.prec = prec;
		this.stoc = stoc;
		this.estad = estad;
	}

	
	


	public Productos(String nomb, double prec, int stoc, String estad) {
		this.nomb = nomb;
		this.prec = prec;
		this.stoc = stoc;
		this.estad = estad;
	}









	public String toString() {
		return "Insumos [cod_prod=" +cod_prod + ",stoc=" + stoc + ",nomb=" + nomb + 
				", estad=" + estad + ",prec=" + prec + "]";
	}
	
	
	
	public int getCod_prod() {
		return cod_prod;
	}
	public void setCod_prod(int cod_prod) {
		this.cod_prod = cod_prod;
	}
	public int getStoc() {
		return stoc;
	}
	public void setStoc(int stoc) {
		this.stoc = stoc;
	}
	public String getNomb() {
		return nomb;
	}
	public void setNomb(String nomb) {
		this.nomb = nomb;
	}
	public String getEstad() {
		return estad;
	}
	public void setEstad(String estad) {
		this.estad = estad;
	}
	public double getPrec() {
		return prec;
	}
	public void setPrec(double prec) {
		this.prec = prec;
	}
	
	
	
	
}
