package modelo;

import java.util.Date;

public class Pedido {
	private int nropedido;
	private String estado;
	private Date fpedido, fentrega;
	
	public Pedido(int nropedido, String estado, Date fpedido, Date fentrega) {
		this.nropedido = nropedido;
		this.estado = estado;
		this.fpedido = fpedido;
		this.fentrega = fentrega;
	}

	public int getNropedido() {
		return nropedido;
	}

	public void setNropedido(int nropedido) {
		this.nropedido = nropedido;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Date getFpedido() {
		return fpedido;
	}

	public void setFpedido(Date fpedido) {
		this.fpedido = fpedido;
	}

	public Date getFentrega() {
		return fentrega;
	}

	public void setFentrega(Date fentrega) {
		this.fentrega = fentrega;
	}
	
	
}