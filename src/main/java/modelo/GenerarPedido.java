package modelo;
import java.sql.Date;

public class GenerarPedido {
	private int num_pedido, cod_ins, cod_prov, cantidad;
	private double precio, subtotoal, monto;
	private Date fechaPedido, fechaEntrega ;
	private String nom_ins, nom_prov;
	private  String estado;

	
	public GenerarPedido() {
		super();
	}

	public GenerarPedido(int num_pedido, int cod_ins, int cod_prov, int cantidad, double subtotoal, double monto,
			Date fechaPedido, Date fechaEntrega) {
		this.num_pedido = num_pedido;
		this.cod_ins = cod_ins;
		this.cod_prov = cod_prov;
		this.cantidad = cantidad;
		this.subtotoal = subtotoal;
		this.monto = monto;
		this.fechaPedido = fechaPedido;
		this.fechaEntrega = fechaEntrega;
	}

	public GenerarPedido(int cod_ins, int cod_prov, int cantidad, double precio) {
		this.cod_ins = cod_ins;
		this.cod_prov = cod_prov;
		this.cantidad = cantidad;
		this.precio = precio;
	}

	public GenerarPedido(int cod_ins, String nom_ins, int cod_prov,  String nom_prov, int cantidad, double precio) {
		this.cod_ins = cod_ins;
		this.cod_prov = cod_prov;
		this.cantidad = cantidad;
		this.precio = precio;
		this.nom_ins = nom_ins;
		this.nom_prov = nom_prov;
	}

	public GenerarPedido(int cod_ins, String nom_ins, int cod_prov,  String nom_prov, int cantidad, double precio, String estado) {
		this.cod_ins = cod_ins;
		this.cod_prov = cod_prov;
		this.cantidad = cantidad;
		this.precio = precio;
		this.nom_ins = nom_ins;
		this.nom_prov = nom_prov;
		this.estado = estado;
	}
	
	public int getNum_pedido() {
		return num_pedido;
	}

	public void setNum_pedido(int num_pedido) {
		this.num_pedido = num_pedido;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getCod_ins() {
		return cod_ins;
	}

	public void setCod_ins(int cod_ins) {
		this.cod_ins = cod_ins;
	}

	public int getCod_prov() {
		return cod_prov;
	}

	public void setCod_prov(int cod_prov) {
		this.cod_prov = cod_prov;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getSubtotoal() {
		return subtotoal;
	}

	public void setSubtotoal(double subtotoal) {
		this.subtotoal = subtotoal;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public Date getFechaPedido() {
		return fechaPedido;
	}

	public void setFechaPedido(Date fechaPedido) {
		this.fechaPedido = fechaPedido;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	public String getNom_ins() {
		return nom_ins;
	}

	public void setNom_ins(String nom_ins) {
		this.nom_ins = nom_ins;
	}

	public String getNom_prov() {
		return nom_prov;
	}

	public void setNom_prov(String nom_prov) {
		this.nom_prov = nom_prov;
	}

	public double subtotal() {
		return Math.round((precio * cantidad) * 100)/100d;
	}
	
	
}
