package modelo;

import java.util.Date;

public class Publicacion {
	
	private int idPublicacion;
	private int idContenido;
	private int idRedSocial;
	private Date fechapublicacion;
	private String estado;
	private String titulo;
	private byte[] archivo;
	
	
	public Publicacion() {
		super();
	}
	
	public Publicacion(int idPublicacion, int idContenido, int idRedSocial, Date fechapublicacion, String estado) {
		super();
		this.idPublicacion = idPublicacion;
		this.idContenido = idContenido;
		this.idRedSocial = idRedSocial;
		this.fechapublicacion = fechapublicacion;
		this.estado = estado;
	}
	
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public byte[] getArchivo() {
		return archivo;
	}

	public void setArchivo(byte[] archivo) {
		this.archivo = archivo;
	}

	public Date getFechapublicacion() {
		return fechapublicacion;
	}

	public int getIdPublicacion() {
		return idPublicacion;
	}
	public void setIdPublicacion(int idPublicacion) {
		this.idPublicacion = idPublicacion;
	}
	public int getIdContenido() {
		return idContenido;
	}
	public void setIdContenido(int idContenido) {
		this.idContenido = idContenido;
	}
	public int getIdRedSocial() {
		return idRedSocial;
	}
	public void setIdRedSocial(int idRedSocial) {
		this.idRedSocial = idRedSocial;
	}
	
	public void setFechapublicacion(Date fecha_publicacion) {
		this.fechapublicacion = fecha_publicacion;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
