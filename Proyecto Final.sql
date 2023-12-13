/*Se crea la base de datos */
drop schema if exists specialbeat;
drop user if exists usuario_proyecto;
CREATE SCHEMA specialbeat ;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'usuario_proyecto'@'%' identified by 'Usuar1o_Clave.';

/*Se asignan los prvilegios */
grant all privileges on specialbeat.* to 'usuario_proyecto'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table specialbeat.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table specialbeat.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  marca varchar(30),
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE specialbeat.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(40) NULL,
  telefono VARCHAR(15) NULL,
  direccion varchar(100),
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table specialbeat.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table specialbeat.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO specialbeat.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Instumentos', 'https://images.alphacoders.com/437/thumb-1920-437902.jpg', true), 
('2','Audio y video',  'https://www.softzone.es/app/uploads-softzone.es/2020/12/Audio-Video.jpg', true),
('3','Luces y Efectos','https://i.ytimg.com/vi/7Ex1XNoxk0c/maxresdefault.jpg',true),
('4','Accesorios','https://www.mrguitarra.com/fr-850x400-data/fotos/accesorios.jpg', false),
('5','Cables','https://http2.mlstatic.com/D_NQ_NP_849921-MCO43136618007_082020-F.jpg', false);

/*Se insertan 4 productos por categoria */
INSERT INTO specialbeat.producto (id_producto,id_categoria,descripcion,detalle,marca,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Guitarra eléctrica Raptor','Escala 25.5, 12 radios, 22 trastes, Pastillas single coil, Clavijero Peavey de seis en línea,Selector de pastillas de 5 vías, Cancelación de zumbidos en segunda y cuarta posición, Controles maestros de volumen y tono','Peavey',155000,4,'https://media.nidux.net/pull/599/800/10379/8799-product-643471b488e75-c00701303026640-1.png',true),
(2,1,'Guitarra Acústica de 3/4','Guitarra #6 (3/4), Cuerdas de metal, Tapa: Pino abeto, Diapasón: Palisandro , Color: azul, Garantía','Lone Ranger',51000,6,'https://www.mundomusicalcr.com/wp-content/uploads/0902332-0001.jpg',true),
(3,1,'Guitarra Clásica Pink','Guitarra #8 (4/4), Cuerdas de nylon , Tapa: Pino abeto , Diapasón: Palisandro , Color: Rosado , Garantía','Gretcsh',49000,2,'https://www.mundomusicalcr.com/wp-content/uploads/0902115.jpg',true),
(4,1,'Bajo Jackson','4 Cuerdas, Cuerpo de Álamo, Mástil: Arce, Diapasón: Laurel, Trastes: 24, Radio : 12″ (305 mm), Escala: 34″ (86.36 cm), Cejilla 1.5″ (38.1 mm)','Spectra',267000,2,'https://www.mundomusicalcr.com/wp-content/uploads/0903058-4.jpg',true),
(5,1,'Organeta CTX 5000','61 teclas con 3 niveles de sensibilidad y polifonia de 64 notas , 800 opciones de tonos con 100 efectos DSP, Funciones de metronomo, grabación de frases, y canciones y ritmos de acompañamiento, 2 parlantes bass reflex con amplificacion de 30 W, Entrada de audio auxiliar y pedal de sostenido, salidas USB y audifonos, incluye fuente de poder de 24 V','Casio',482.000,6,'https://media.nidux.net/pull/599/800/10379/6806-product-5e5fdd1d8579e-014054ctx5000.png',true),
(6,1,'Teclado CT-S1RD','61 teclas tipo piano sensibles a la presión, 61 tonos exquisitamente elaborados, Posibilidad de conexión USB a un PC, Entrada de audio, Color Rojo','Casio',275.000,3,'https://www.mundomusicalcr.com/wp-content/uploads/340303100-768x768.jpg',true),
(7,1,'Batería Electrónica Arrollable',' Puede tocar con altavoz o auriculares, Hasta 7 almohadillas incluyendo bajo, Tom, Snare, Hi-Hat y platillo de choque, Con ritmos y canciones de demostración en el interior, Con 7 estilos de tambor diferentes en el interior, Admite entrada MP3','Wingo',60.000,5,'https://www.mundomusicalcr.com/wp-content/uploads/1002420.jpg',true),
(8,1,'Bateria acústica','22” x 18” Bombo, 14” x 6.5" Redoblante, 12” x 10” Tom, 13” x 11” Tom, 16” x 16”Tom de piso, Pedal de bombo, Hi- Hat de 14, Herrajes, Platillos de 16", Color wine red','XSound',373.000,2,'https://media.nidux.net/pull/599/800/10379/8760-product-63a338ff18381-c008140dc1716rdw-1.png',true),
(9,2,'Mezcladora L8','6 pads programables para sonidos y música, 10 faders para controlar los niveles de audio, Efectos incorporados y ecualizador de 3 bandas, Grabación multipista mediante tarjeta SD y USB','Zoom',336.000,12,'https://media.nidux.net/pull/599/800/10379/8129-product-62a2626827579-013081zl8-1.png',true),
(10,2,'Micrófono condensador','Micrófono de condensador, Filtro pop, Montura de choque, Cable XLR de 10 pies','Blastking',91.000,20,'https://media.nidux.net/pull/599/800/10379/8035-product-61366eee08840-010161podc300-5.png',true),
(11,2,'Parlante LightWave','2 barras de LEDs en cada altavoz, Control de volumen dual, 200 vatios de potencia máxima, Salida XLR','Numark',235.000,5,'https://www.mundomusicalcr.com/wp-content/uploads/290304350-3.jpg',true),
(12,2,'Audífono KH660','Audífonos con Buetooth, Batería Recargable, Incluye cable USB para cargar, Rango de operación: 10 mts','Sky',30.000,3,'https://www.mundomusicalcr.com/wp-content/uploads/040175000-1-1.jpg',true),
(13,3,'Luz Gobo Motion Led','6 luces LED con 3 opciones de color, Patrones de luz intercambiables, Compatibilidad DMX','ADJ',184.000,1,'https://media.nidux.net/pull/599/800/10379/6732_product_5d015d2b37965_011023GOB766_1.png',true),
(14,3,'Luz PARMINI 18x3','Mezcla de colores RGB, DMX, audio, master/slave, auto. Efecto: Arcoíris','Litetek',30.000,0,'https://media.nidux.net/pull/599/800/10379/8783-product-63e12060229f8-c0110228parmini-1.png',false),
(15,3,'Máquina de neblina H700','Máquina de niebla compacta y liviana que emite gruesas ráfagas de niebla a base de agua para mejorar cualquier espectáculo de luces','Chauvet',92.000,13,'https://media.nidux.net/pull/599/800/10379/8857-product-64c2adb0c089e-c023024h1000-1.png',true),
(16,3,'Máquina de Confeti Funfetti','Lanzador de confeti profesional perfecto para conciertos, fiestas y eventos especiales, No requiere aire comprimido CO2. Sólo requiere añadir confeti','Chauvet',273.000,0,'https://media.nidux.net/pull/599/800/10379/7416-product-5e56e370d998b-023024funfettishot-1.png',false),
(17,4,'Afinador Tipo Prensa','435 a 445 Hz, Ángulo de visión perfecto, Abrazadera de retención duradera','Mooer',23.000,1,'https://www.mundomusicalcr.com/wp-content/uploads/090424-0.jpg',true),
(18,4,'Clavijero de Lujo','Apto para guitarras clásicas, Forma de clavija: ovalada, Material de la clavija: resina sintética, rojo','Alicex',12.000,25,'https://www.mundomusicalcr.com/wp-content/uploads/0908064-00.jpg',true),
(19,4,'Filtro Pop 6','6“ aro de plástico, Micro-armadura difusor de nylon negro, Cuello de ganso y el clip del eje de estilo pinza de ropa','Chauvet',11.000,13,'https://www.mundomusicalcr.com/wp-content/uploads/1299192.jpg',true),
(20,4,'Stand Ajustable para Laptop','Todas las superficies de contacto están cubiertas con goma EVA para evitar daños, Ajustes de altura fáciles de alinear de 9.5 “a 14.5” ','On-stage',34.000,3,'https://www.mundomusicalcr.com/wp-content/uploads/0306027.jpg',true),
(21,5,'Cable ADJ AC3PDMX50','Cable DMX de 3 pines macho-hembra, 15m de largo','ADJ',14.000,10,'https://media.nidux.net/pull/599/800/10379/6436_product_5d015df4df60a_016023AC3PDMX50_1.png',true),
(22,5,'Cable para Microfono','Cable de micrófono XLR3F a XLR3M, Diseñado para proporcionar años de servicio confiable, Conectores XLR con alivio de tensión interno para una fiabilidad robusta','Hosa',9.000,14,'https://media.nidux.net/pull/599/800/10379/8895-product-64d171567bbf9-c016203mbl125-1.png',true),
(23,5,'Cable para parlante Pro-Lok','Cable Speakon a MDP(banana), 9,14 m de largo','Prolok',22.000,13,'https://media.nidux.net/pull/599/800/10379/6453_product_5d015e079ecc1_016134PCS3014NMD_1.png',true),
(24,5,'Cable Speakon ','Cable Speakon a 1/4" mono','Accenta',12.000,6,'https://media.nidux.net/pull/599/800/10379/6433_product_5d015e103150c_016181ACC573_1.png',true);

/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO specialbeat.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,direccion,ruta_imagen,activo) VALUES 
(1,'kevin','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Kevin', 'Rios Soto',    'Kevrsoto@gmail.com', '888-126-7463','Heredia', 'https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person(pp_w480_h610).jpg',true),
(2,'byron','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Byron',  'Solorzano Salas', 'Byronsols@gmail.com', '635-849-1572','San Jose','https://www.superprof.fr/images/annonces/professeur-home-etudiant-italien-inscrit-universite-nice-donne-cours-italien-domicile-etudiants.jpg',true),
(3,'sofia','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Sofia', 'Lopez Chavarria', 'SLopez@gmail.com','889-098-8074','San Jose','https://1.bp.blogspot.com/-OoMliypQJwo/VXZ7yKNIYRI/AAAAAAAAAQ8/TcyIlsPk6wI/s1600/foto%2Bchica%2Bcurriculum.jpg',true);

/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO specialbeat.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);

INSERT INTO specialbeat.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,14,154000,3),
(6,2,9,15780,3),
(7,3,14,154000,1),
(8,3,6,57000,1),
(9,3,15,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,14,154000,2),
(15,2,3,24000,1),
(16,3,15,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);

create table specialbeat.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into specialbeat.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2),
 (6,'ROLE_USER',3);