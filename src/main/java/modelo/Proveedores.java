package modelo;

public class Proveedores {
	private int cod_prov, cod_ins;
	private String nombre, numeroTel, estado;
	
	public Proveedores(int cod_prov, int cod_ins, String estado, String nombre, String numeroTel) {
		this.cod_prov = cod_prov;
		this.cod_ins = cod_ins;
		this.estado = estado;
		this.nombre = nombre;
		this.numeroTel = numeroTel;
	}

	
	public Proveedores(int cod_prov, String nombre, String numeroTel, String estado) {
		this.cod_prov = cod_prov;
		this.nombre = nombre;
		this.numeroTel = numeroTel;
		this.estado = estado;
	}

	
	public Proveedores(int cod_prov, int cod_ins) {
		this.cod_prov = cod_prov;
		this.cod_ins = cod_ins;
	}

	public Proveedores(String nombre, String numeroTel, String estado) {
		this.nombre = nombre;
		this.numeroTel = numeroTel;
		this.estado = estado;
	}


	public String toString() {
		return "Proveedores [cod_prov=" + cod_prov + ", cod_ins=" + cod_ins + ", nombre= " + nombre 
				+ ", numeroTel= "+ numeroTel + ", estado=" + estado + "]";
	}

	public int getCod_prov() {
		return cod_prov;
	}

	public void setCod_prov(int cod_prov) {
		this.cod_prov = cod_prov;
	}

	public int getCod_ins() {
		return cod_ins;
	}

	public void setCod_ins(int cod_ins) {
		this.cod_ins = cod_ins;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNumeroTel() {
		return numeroTel;
	}

	public void setNumeroTel(String numeroTel) {
		this.numeroTel = numeroTel;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
}
