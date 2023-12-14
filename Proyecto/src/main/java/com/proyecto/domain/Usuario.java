package com.proyecto.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "usuario")

public class Usuario implements Serializable {  //Serializacion funciona para almacenar ciertos datos en el disco

    private static final long serialVersionUID = 1L; //Para poder hacer el ciclo de la sumatoria del idUsuario

    @Id //La tabla usuario tiene una llave o identificador que va a ser el ID
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Los valores generados que tipo de extrategia utilizan, identico = sea igual en la BD y en la clase
    @Column(name = "id_usuario") // Decir cual es el nombre de la columna en la base de datos
    private long idUsuario;
    private String username;
    private String password;
    private String nombre;
    private String apellidos;
    private String correo;
    private String telefono;
    private String direccion;
    private String rutaImagen;
    private boolean activo;

    @OneToMany //Un usuario puede tener multiples roles
    @JoinColumn(name = "id_usuario")
    List<Rol> roles;

}
