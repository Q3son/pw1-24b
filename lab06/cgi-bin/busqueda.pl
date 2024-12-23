#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Text::CSV; # Para leer el archivo CSV
use CGI qw(:standard);
use Encode;
use open ':std', ':encoding(UTF-8)';
binmode STDIN, ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';

# Crear objeto CGI
my $cgi = CGI->new;

# Utilizar la importación Text::CSV para leer el archivo CSV
my $Tabla_de_Universidades = Text::CSV->new({ sep_char => ",", binary => 1, auto_diag => 1 });

# Abrir el archivo CSV
open(my $fh, '<:encoding(UTF-8)', 'Universidades_Lab06.csv') or die "El archivo no se pudo abrir: $!";

# Convertir la fecha para que sea compatible con el formato de la base de datos
sub convertir_fecha {
    my ($fecha) = @_;
    $fecha =~ s/-//g; # Reemplaza los guiones por vacíos
    return $fecha;
}

# Leer parámetros CGI
my $nombre_universidad        = decode_utf8($cgi->param('NOMBRE') || '');
my $gestionamiento              = decode_utf8($cgi->param('TIPO_GESTION') || '');
my $estado_licenciamiento     = decode_utf8($cgi->param('ESTADO_LICENCIAMIENTO') || '');
my $inicio_licenciamiento     = decode_utf8($cgi->param('FECHA_INICIO') || '');
my $fin_licenciamiento        = decode_utf8($cgi->param('FECHA_FIN') || '');
my $periodo_licenciamiento    = decode_utf8($cgi->param('PERIODO_LICENCIAMIENTO') || '');
my $departamento              = decode_utf8($cgi->param('DEPARTAMENTO') || '');
my $provincia                 = decode_utf8($cgi->param('PROVINCIA') || '');
my $distrito                  = decode_utf8($cgi->param('DISTRITO') || '');

# Imprimir encabezado HTML
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Leer el archivo CSV línea por línea
my @universidades_encontradas;

while (my $row = $Tabla_de_Universidades->getline($fh)) {
    # Extraer las condiciones con UTF-8
    my ($codigo, $universidades, $tipo, $estado, $inicio, $fin, $periodo, $dpto, $prov, $dist, $ubigeo, $latitud, $longitud, $fecha_corte) = @$row;

    # Se implementan filtros basados en los parámetros proporcionados por el usuario a través del formulario HTML.
    if (($universidades =~ /\Q$nombre_universidad\E/i) && 
        ($gestionamiento eq '' || $tipo =~ /\Q$gestionamiento\E/i) &&   
        ($estado_licenciamiento eq '' || $estado =~ /\Q$estado_licenciamiento\E/i) && 
        ($inicio_licenciamiento eq '' || $inicio =~ /\Q$inicio_licenciamiento\E/i) && 
        ($fin_licenciamiento eq '' || $fin =~ /\Q$fin_licenciamiento\E/i) &&
        ($periodo_licenciamiento eq '' || $periodo =~ /\Q$periodo_licenciamiento\E/i) &&  
        ($departamento eq '' || $dpto =~ /\Q$departamento\E/i) &&   
        ($provincia eq '' || $prov =~ /\Q$provincia\E/i) &&       
        ($distrito eq '' || $dist =~ /\Q$distrito\E/i)) {

        # Si todos los filtros coinciden, agrega la fila actual (@$row) al arreglo @universidades
        push(@universidades_encontradas, $row);
    }
}
close $fh;

# Imprimir los resultados de la búsqueda
print<< "FORM";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Universidades Peruanas</title>
</head>
<style>
body {
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
    background-image: url('https://www.unsa.edu.pe/wp-content/uploads/2021/03/WhatsApp-Image-2021-03-22-at-3.18.20-PM.jpeg'); /* Reemplaza con la ruta de tu imagen */
    background-size: cover; /* Ajusta la imagen para que cubra toda la pantalla */
    background-position: center; /* Centra la imagen */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
}

/* Estilo del formulario */
.formulario {
    display: flex;
    flex-wrap: wrap; /* Permitir que los elementos se ajusten en columnas */
    gap: 20px; /* Espacio entre columnas */
    background-color: #c3c9c2dc; /* Fondo blanco */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 800px; /* Ancho máximo */
    width: 100%; /* Ancho completo */
}

/* Estilo de las columnas */
.colum {
    flex: 1; /* Ocupa espacio igual */
    min-width: 300px; /* Ancho mínimo */
}

/* Estilo de los elementos de entrada */
.input-part {
    margin-bottom: 16px;
}

.input-part input[type="text"],
.input-part input[type="date"],
.input-part select {
    width: 100%;
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
    outline: none;
    font-size: 1em;
    box-sizing: border-box;
}

/* Efecto de hover y focus */
.input-part input[type="text"]:focus,
.input-part input[type="date"]:focus,
.input-part select:focus {
    border-color: #929793;
}

/* Estilo del botón */
.buscar {
    background-color: #8c9196;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s;
}

.buscar:hover {
    background-color: #626466;
}

/* Asegurar que el título ocupe el ancho total */
.titulo {
    width: 100%;
    text-align: center;
    margin-bottom: 20px;
}
</style>
<body>
    <form class="formulario" action="/cgi-bin/busqueda.pl" method="get">
        <div class="colum 1"></div>
            <h1 class="titulo">Buscador de Universidades</h1>
        
            <div class="input-part">
                <input type="text" name="NOMBRE" id="NOMBRE" placeholder="Nombre de la universidad">
            </div>

            <div class="input-part">
                <select name="GESTION" id="TIPO_GESTION">
                    <option value="TIPO" disabled selected >Tipo de gestion</option>
                    <option value="PRIVADO">Privado</option>
                    <option value="PÚBLICO">Publico</option>
                </select>
            </div>

            <div class="input-part">
                <select name="ESTADO" id="ESTADO">
                    <option value="ESTADO" disabled selected >Estado de licenciamiento</option>
                    <option value="LICENCIA OTORGADA">Licencia otorgada</option>
                    <option value="LICENCIA DENEGADA">Licencia denegada</option>
                    <option value="NO PRESENTADO">No presentado</option>
                </select>
            </div>

            <div class="input-part">
                <label>Fecha inicio</label>
                <input type="date" name="FECHA_INICIO" id="FECHA_INICIO" >
            </div>

            <div class="input-part">
                <label>Fecha fin</label>
                <input type="date" name="FECHA_FIN" id="FECHA_FIN" >
            </div>
        </div>
        <div class="colum 2">
            <div class="input-part">
                <input type="text" name="PERIODO_LICENCIAMIENTO" id="PERIODO_LICENCIAMIENTO" placeholder="Periodo de licenciamiento (años)">
            </div>

            <!-- Selección de Departamento -->
            <div class="input-part">  
                    <select name="DEPARTAMENTO" id="DEPARTAMENTO">
                        <option value="DEPARTAMENTO" disabled selected>Departamento</option>
                        <option value="AMAZONAS">Amazonas</option>
                        <option value="ÁNCASH">Áncash</option>
                        <option value="APURÍMAC">Apurímac</option>
                        <option value="AREQUIPA">Arequipa</option>
                        <option value="AYACUCHO">Ayacucho</option>
                        <option value="CAJAMARCA">Cajamarca</option>
                        <option value="CALLAO">Callao</option>
                        <option value="CUSCO">Cusco</option>
                        <option value="HUANCAVELICA">Huancavelica</option>
                        <option value="HUÁNUCO">Huánuco</option>
                        <option value="ICA">Ica</option>
                        <option value="JUNÍN">Junín</option>
                        <option value="LA LIBERTAD">La Libertad</option>
                        <option value="LAMBAYEQUE">Lambayeque</option>
                        <option value="LIMA">Lima</option>
                        <option value="LORETO">Loreto</option>
                        <option value="MADRE DE DIOS">Madre de Dios</option>
                        <option value="MOQUEGUA">Moquegua</option>
                        <option value="PASCO">Pasco</option>
                        <option value="PIURA">Piura</option>
                        <option value="PUNO">Puno</option>
                        <option value="SAN MARTÍN">San Martín</option>
                        <option value="TACNA">Tacna</option>
                        <option value="TUMBES">Tumbes</option>
                        <option value="UCAYALI">Ucayali</option>
                    </select> 
            </div>

            <!-- Selección de Provincia -->
    
            <div class="input-part">
                    <select name="PROVINCIA" id="PROVINCIA">
                        <option value="PROVINCIA" disabled selected>Provincia</option>
                        <option value="LIMA">Lima</option>
                        <option value="HUAMANGA">Huamanga</option>
                        <option value="TRUJILLO">Trujillo</option>
                        <option value="AREQUIPA">Arequipa</option>
                        <option value="MAYNAS">Maynas</option>
                        <option value="PUNO">Puno</option>
                        <option value="CAJAMARCA">Cajamarca</option>
                        <option value="PIURA">Piura</option>
                        <option value="TACNA">Tacna</option>
                        <option value="HUARAZ">Huaraz</option>
                        <option value="CORONEL PORTILLO">Coronel Portillo</option>
                        <option value="CUSCO">Cusco</option>
                        <option value="CHICLAYO">Chiclayo</option>
                        <option value="CHACHAPOYAS">Chachapoyas</option>
                        <option value="ANGARAES">Angaraes</option>
                        <option value="ANDAHUAYLAS">Andahuaylas</option>
                        <option value="MARISCAL NIETO">Mariscal Nieto</option>
                        <option value="SAN ROMÁN">San Román</option>
                        <option value="JAÉN">Jaén</option>
                        <option value="CHOTA">Chota</option>
                        <option value="BARRANCA">Barranca</option>
                        <option value="CAÑETE">Cañete</option>
                        <option value="BAGUA">Bagua</option>
                        <option value="CHANCHAMAYO">Chanchamayo</option>
                        <option value="ALTO AMAZONAS">Alto Amazonas</option>
                        <option value="TARMA">Tarma</option>
                        <option value="HUANTA">Huanta</option>
                        <option value="HUANCAYO">Huancayo</option>
                        <option value="TAYACAJA">Tayacaja</option>
                        <option value="SÁNCHEZ CARRIÓN">Sánchez Carrión</option>
                        <option value="ICA">Ica</option>
                        <option value="LEÓNCIO PRADO">Leóncio Prado</option>
                        <option value="HUÁNUCO">Huánuco</option>
                        <option value="PASCO">Pasco</option>
                        <option value="PROV. CONST. DEL CALLAO">Prov. Const. del Callao</option>
                        <option value="HUAURA">Huaura</option>
                        <option value="LAMBAYEQUE">Lambayeque</option>
                        <option value="SAN MARTÍN">San Martín</option>
                        <option value="ABANCAY">Abancay</option>
                        <option value="TUMBES">Tumbes</option>
                        <option value="SANTA">Santa</option>
                        <option value="HUANCAVELICA">Huancavelica</option>
                        <option value="LA CONVENCIÓN">La Convención</option>
                        <option value="HUAROCHERÍ">Huarocherí</option>
                        <option value="UTCUBAMBA">Utcubamba</option>
                        <option value="SULLANA">Sullana</option>
                </select>
            </div>
            <!-- Selección de Distrito -->
            <div class="input-part">
            <select name="DISTRITO" id="DISTRITO">
                <option value="DISTRITO" disabled selected>Distrito</option>
                <!-- Agregar distritos aquí según corresponda -->
                <option value="LIMA">Lima</option>
                <option value="AYACUCHO">Ayacucho</option>
                <option value="TRUJILLO">Trujillo</option>
                <option value="AREQUIPA">Arequipa</option>
                <option value="RÍMAC">Rímac</option>
                <option value="LA MOLINA">La Molina</option>
                <option value="SAN MIGUEL">San Miguel</option>
                <option value="SAN JUAN BAUTISTA">San Juan Bautista</option>
                <option value="PUNO">Puno</option>
                <option value="SAN MARTÍN DE PORRES">San Martín de Porres</option>
                <option value="CAJAMARCA">Cajamarca</option>
                <option value="JESÚS MARÍA">Jesús María</option>
                <option value="SANTIAGO DE SURCO">Santiago de Surco</option>
                <option value="SANTA ANITA">Santa Anita</option>
                <option value="PIURA">Piura</option>
                <option value="TACNA">Tacna</option>
                <option value="INDEPENDENCIA">Independencia</option>
                <option value="CALLERÍA">Callería</option>
                <option value="LURIGANCHO">Lurigancho</option>
                <option value="SAN JERÓNIMO">San Jerónimo</option>
                <option value="POCOLLAY">Pocollay</option>
                <option value="VILLA EL SALVADOR">Villa El Salvador</option>
                <option value="CHICLAYO">Chiclayo</option>
                <option value="LOS OLIVOS">Los Olivos</option>
                <option value="CHACHAPOYAS">Chachapoyas</option>
                <option value="PUEBLO LIBRE">Pueblo Libre</option>
                <option value="LIRCAY">Lircay</option>
                <option value="YARINACOCHA">Yarinacocha</option>
                <option value="MOQUEGUA">Moquegua</option>
                <option value="CHOTA">Chota</option>
                <option value="BARRANCA">Barranca</option>
                <option value="SAN VICENTE DE CAÑETE">San Vicente de Cañete</option>
                <option value="BAGUA">Bagua</option>
                <option value="CHANCHAMAYO">Chanchamayo</option>
                <option value="YURIMAGUAS">Yurimaguas</option>
                <option value="TARMA">Tarma</option>
                <option value="HUANTA">Huanta</option>
                <option value="BARRANCO">Barranco</option>
                <option value="SAN JUAN DE LURIGANCHO">San Juan de Lurigancho</option>
                <option value="HUANCAYO">Huancayo</option>
                <option value="DANIEL HERNÁNDEZ">Daniel Hernández</option>
                <option value="HUAMACHUCO">Huamachuco</option>
                <option value="CUSCO">Cusco</option>
                <option value="ICA">Ica</option>
                <option value="EL TAMBO">El Tambo</option>
                <option value="CASTILLA">Castilla</option>
                <option value="RUPA-RUPA">Rupa-Rupa</option>
                <option value="PILLCO MARCA">Pillco Marca</option>
                <option value="LINCE">Lince</option>
                <option value="YANACANCHA">Yanacancha</option>
                <option value="BELLAVISTA">Bellavista</option>
                <option value="HUACHO">Huacho</option>
                <option value="LAMBAYEQUE">Lambayeque</option>
                <option value="TARAPOTO">Tarapoto</option>
                <option value="ABANCAY">Abancay</option>
                <option value="TUMBES">Tumbes</option>
                <option value="NUEVO CHIMBOTE">Nuevo Chimbote</option>
                <option value="PIMENTEL">Pimentel</option>
                <option value="HUÁNUCO">Huánuco</option>
                <option value="HUANCAVELICA">Huancavelica</option>
                <option value="VÍCTOR LARCO HERRERA">Víctor Larco Herrera</option>
                <option value="CHIMBOTE">Chimbote</option>
                <option value="CHORRILLOS">Chorrillos</option>
                <option value="MOCHE">Moche</option>
                <option value="LAREDO">Laredo</option>
                <option value="SULLANA">Sullana</option>
                <option value="YANAHUARA">Yanahuara</option>
                <option value="TIABAYA">Tiabaya</option>
                <option value="BREÑA">Breña</option>
                <option value="ATE">Ate</option>
                <option value="SANTA ANA">Santa Ana</option>
                <option value="SAN ANTONIO">San Antonio</option>
                <option value="CHINCHA ALTA">Chincha Alta</option>
                <option value="IQUITOS">Iquitos</option>
                <option value="BAGUA GRANDE">Bagua Grande</option>
                <option value="SAN BORJA">San Borja</option>
            </select>
            </div>
            <button class="buscar" type="submit">Buscar</button>
        </div>
    </form>
</body>
</html>
FORM

if (@universidades_encontradas == 1) {
    # Si solo hay una universidad, redirigir a Google Maps con latitud y longitud
    my $univ = $universidades_encontradas[0];
    my ($codigo, $universidades, $tipo, $estado, $inicio, $fin, $periodo, $dpto, $prov, $dist, $ubigeo, 
    $latitud, $longitud, $fecha_corte) = @$univ;

print << "HTML";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Google Maps</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column; /* Elementos en una columna */
            align-items: center; /* Centrar horizontalmente */
            justify-content: flex-start; /* Alinear hacia arriba */
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5; /* Fondo claro */
        }

        h2 {
            text-align: center;
            margin-bottom: 16px;
            background-color: white;
	        margin-top: 20px;
            padding: 30px;
            border: 3px solid black;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Espacio entre el div y el iframe */
        }

        .fondo-unis {
            background-color: white;
	        margin-top: 20px;
            padding: 30px;
            border: 3px solid black;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Espacio entre el div y el iframe */
        }

        iframe {
            border: 10px solid black;
            border-radius: 20px;
            width: 100%;
            max-width: 1000px; /* Limitar ancho máximo */
            height: 450px;
        }
</style>
<body>
    <div class="fondo-unis">
        <h2>$universidades</h2>
    </div>
    <iframe
        loading="lazy"
        allowfullscreen
        referrerpolicy="no-referrer-when-downgrade"
        src="https://www.google.com/maps?q=$latitud,$longitud&hl=es;z=14&output=embed"
	sandbox="allow-scripts allow-same-origin">
    </iframe>
</body>
</html>
HTML

} elsif (@universidades_encontradas > 1){
print << "FORM";
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            color: white; /* Establece el color del texto de toda la tabla */
        }

        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #333; /* Fondo oscuro para las cabeceras */
        }

        td {
            background-color: #555; /* Fondo oscuro para las celdas */
        }

        tr:nth-child(even) {
            background-color: #444; /* Fondo más claro para las filas pares */
        }
    </style>
    <title>Universidades Peruanas</title>
</head>
<body>
    <h1>Resultados de Universidades</h1>
    <table>
        <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Estado</th>
            <th>Inicio</th>
            <th>Fin</th>
            <th>Periodo</th>
            <th>Departamento</th>
            <th>Provincia</th>
            <th>Distrito</th>
        </tr>
FORM

foreach my $univ (@universidades_encontradas) {
    my ($codigo, $universidades, $tipo, $estado, $inicio, $fin, $periodo, $dpto, $prov, $dist) = @$univ;
    
    # Imprimir los resultados en la tabla HTML
    print "<tr><td>$codigo</td><td>$universidades</td><td>$tipo</td><td>$estado</td><td>$inicio</td><td>$fin</td><td>$periodo</td><td>$dpto</td><td>$prov</td><td>$dist</td></tr>";
}

print "</table>";
print end_html;
} else {
    print "No se encontraron universidades que coincidan con los criterios.";
}