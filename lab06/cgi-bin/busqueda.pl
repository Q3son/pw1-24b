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
open(my $fh, '<:encoding(UTF-8)', 'Universidades_LAB06.csv') or die "El archivo no se pudo abrir: $!";

# Convertir la fecha para que sea compatible con el formato de la base de datos
sub convertir_fecha {
    my ($fecha) = @_;
    $fecha =~ s/-//g; # Reemplaza los guiones por vacíos
    return $fecha;
}

# Leer parámetros CGI
my $nombre_universidad        = decode_utf8($cgi->param('NOMBRE') || '');
my $tipo_gestion              = decode_utf8($cgi->param('TIPO_GESTION') || '');
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
    my ($nombre, $tipo, $estado, $fecha_inicio, $fecha_fin, $periodo, $departamento_csv, $provincia_csv, $distrito_csv) = @$row;

    # Filtrar universidades por los criterios seleccionados
    if (($nombre_universidad eq '' || $nombre =~ /$nombre_universidad/i) &&
        ($tipo_gestion eq '' || $tipo =~ /$tipo_gestion/i) &&
        ($estado_licenciamiento eq '' || $estado =~ /$estado_licenciamiento/i) &&
        ($inicio_licenciamiento eq '' || convertir_fecha($fecha_inicio) >= convertir_fecha($inicio_licenciamiento)) &&
        ($fin_licenciamiento eq '' || convertir_fecha($fecha_fin) <= convertir_fecha($fin_licenciamiento)) &&
        ($periodo_licenciamiento eq '' || $periodo == $periodo_licenciamiento) &&
        ($departamento eq '' || $departamento_csv eq $departamento) &&
        ($provincia eq '' || $provincia_csv eq $provincia) &&
        ($distrito eq '' || $distrito_csv eq $distrito)) {

        push @universidades_encontradas, {
            nombre            => $nombre,
            tipo              => $tipo,
            estado            => $estado,
            fecha_inicio      => $fecha_inicio,
            fecha_fin         => $fecha_fin,
            periodo           => $periodo,
            departamento      => $departamento_csv,
            provincia         => $provincia_csv,
            distrito          => $distrito_csv,
        };
    }
}

# Imprimir los resultados de la búsqueda
if (@universidades_encontradas) {
    print "<h2>Resultados de la búsqueda:</h2>";
    print "<ul>";
    foreach my $universidad (@universidades_encontradas) {
        print "<li><strong>Universidad:</strong> $universidad->{nombre}, <strong>Tipo:</strong> $universidad->{tipo}, <strong>Estado:</strong> $universidad->{estado}, <strong>Fecha inicio:</strong> $universidad->{fecha_inicio}, <strong>Fecha fin:</strong> $universidad->{fecha_fin}, <strong>Periodo:</strong> $universidad->{periodo}, <strong>Departamento:</strong> $universidad->{departamento}, <strong>Provincia:</strong> $universidad->{provincia}, <strong>Distrito:</strong> $universidad->{distrito}</li>";
    }
    print "</ul>";
} else {
    print "<p>No se encontraron universidades que coincidan con los criterios.</p>";
}

close($fh);
