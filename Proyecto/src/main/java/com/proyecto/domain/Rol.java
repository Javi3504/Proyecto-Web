package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;


@Data
@Entity
@Table(name = "rol")

public class Rol implements Serializable {  //Serializacion funciona para almacenar ciertos datos en el disco

    private static final long serialVersionUID = 1L; //Para poder hacer el ciclo de la sumatoria del idRol
    
    @Id //La tabla rol tiene una llave o identificador que va a ser el ID
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Los valores generados que tipo de extrategia utilizan, identico = sea igual en la BD y en la clase
    @Column(name = "id_rol") // Decir cual es el nombre de la columna en la base de datos
    private long idRol;
    private String nombre;
     @Column(name = "id_usuario") // Decir cual es el nombre de la columna en la base de datos
    private long idUsuario;
    
   
}
