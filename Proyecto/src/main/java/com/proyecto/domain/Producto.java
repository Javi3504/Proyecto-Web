package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "producto")

public class Producto implements Serializable {  //Serializacion funciona para almacenar ciertos datos en el disco

    private static final long serialVersionUID = 1L; //Para poder hacer el ciclo de la sumatoria del idProducto

    @Id //La tabla producto tiene una llave o identificador que va a ser el ID
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Los valores generados que tipo de extrategia utilizan, identico = sea igual en la BD y en la clase
    @Column(name = "id_producto") // Decir cual es el nombre de la columna en la base de datos
    private long idProducto;
    private String descripcion;
    private String rutaImagen;
    private boolean activo;

    private String detalle;
    private String marca;
    private double precio;
    private int existencias;

    @ManyToOne
    @JoinColumn(name = "id_categoria")
    Categoria categoria;

    public Producto() {
    }

    public Producto(String descripcion, String rutaImagen, boolean activo) {
        this.descripcion = descripcion;
        this.rutaImagen = rutaImagen;
        this.activo = activo;
    }
}
