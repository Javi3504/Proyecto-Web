package com.proyecto.service;

import java.io.IOException;
import java.util.Map;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;

public interface ReporteService {
    public ResponseEntity<Resource> generaReporte(
            String reporte, //Nombre del archivo .jasper (usuarios.jasper o ventas.jasper)
            Map<String,Object> parametros, //Se pasan los parametros del archivo jasper, nombre, apellido, telefono, direccion
            String tipo //Tipo de reporte que el usuario va a ver o descargar (csv,pdf,excel xls)
    ) throws IOException;
}