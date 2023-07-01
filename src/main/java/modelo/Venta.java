package modelo;

import java.time.LocalDateTime;

public class Venta {
	private int idproducto;
	private int item;
	private int idventa;
    private int idcliente;
    private LocalDateTime fecha;
    private String numeroserie;
    private Double precio;
    private int cantidad;
    private Double subtotal;
    private Double monto;
    private String estado;
    
	public Venta() {
		this.fecha = LocalDateTime.now();
		this.estado = "S";
	}

	public Venta(int idcliente, String numeroserie, Double precio, int cantidad, Double subtotal, Double monto) {
		this();
		this.idcliente = idcliente;
		this.numeroserie = numeroserie;
		this.precio = precio;
		this.cantidad = cantidad;
		this.subtotal = subtotal;
		this.monto = monto;
	}
	
	public int getIdproducto() {
		return idproducto;
	}

	public void setIdproducto(int idproducto) {
		this.idproducto = idproducto;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public String getNumeroserie() {
		return numeroserie;
	}

	public void setNumeroserie(String numeroserie) {
		this.numeroserie = numeroserie;
	}

	public int getIdventa() {
		return idventa;
	}

	public void setIdventa(int idventa) {
		this.idventa = idventa;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}

	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public Double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getIdcliente() {
		return idcliente;
	}

	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}

	public double subtotal(){
		return precio * cantidad;
	}
}