package modelo;

public class Categorias {
	private int cod_tipo;
	private String nom_tipo;
	
	public Categorias() {
		
	}
	
	public Categorias(int cod_tipo, String nom_tipo) {
		this.cod_tipo = cod_tipo;
		this.nom_tipo = nom_tipo;
	}

	public String toString() {
		return "Categorias [cod_tipo=" + cod_tipo + ", nom_tipo=" + nom_tipo + "]";
	}
	
	public int getCod_tipo() {
		return cod_tipo;
	}

	public void setCod_tipo(int cod_tipo) {
		this.cod_tipo = cod_tipo;
	}

	public String getNom_tipo() {
		return nom_tipo;
	}

	public void setNom_tipo(String nom_tipo) {
		this.nom_tipo = nom_tipo;
	}
	
	
}
