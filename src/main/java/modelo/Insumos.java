package modelo;

public class Insumos {
	private int cod_ins, stk_min, stk_act, cod_tipo;
	private String nombre;
	private double precioXkilo;
	
	public Insumos(int cod_ins, int stk_min, int stk_act, String nombre, int cod_tipo, double precioXkilo) {
		this.cod_ins = cod_ins;
		this.stk_min = stk_min;
		this.stk_act = stk_act;
		this.nombre = nombre;
		this.cod_tipo = cod_tipo;
		this.precioXkilo = precioXkilo;
	}

	public Insumos(int cod_ins, String nombre) {
		this.cod_ins = cod_ins;
		this.nombre = nombre;
	}

	public Insumos(int cod_ins, int stk_min, int stk_act, String nombre, double precioXkilo) {
		this.cod_ins = cod_ins;
		this.stk_min = stk_min;
		this.stk_act = stk_act;
		this.nombre = nombre;
		this.precioXkilo = precioXkilo;
	}

	public Insumos(int stk_min, int stk_act, String nombre, double precioXkilo, int cod_tipo) {
		this.stk_min = stk_min;
		this.stk_act = stk_act;
		this.cod_tipo = cod_tipo;
		this.nombre = nombre;
		this.precioXkilo = precioXkilo;
	}

	public String toString() {
		return "Insumos [cod_ins=" +cod_ins + ",stk_min=" + stk_min + ",stk_act=" + stk_act + 
				", nombre=" + nombre + ",cod_tipo=" + cod_tipo + ",precioXkilo=" + precioXkilo +"]";
	}
	
	public int getCod_ins() {
		return cod_ins;
	}

	public void setCod_ins(int cod_ins) {
		this.cod_ins = cod_ins;
	}

	public int getStk_min() {
		return stk_min;
	}

	public void setStk_min(int stk_min) {
		this.stk_min = stk_min;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getCod_tipo() {
		return cod_tipo;
	}

	public void setCod_tipo(int cod_tipo) {
		this.cod_tipo = cod_tipo;
	}

	public double getPrecioXkilo() {
		return precioXkilo;
	}

	public void setPrecioXkilo(double precioXkilo) {
		this.precioXkilo = precioXkilo;
	}

	public int getStk_act() {
		return stk_act;
	}

	public void setStk_act(int stk_act) {
		this.stk_act = stk_act;
	}

	
}
