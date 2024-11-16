#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use CGI qw(:standard);
use Encode;

# Configuración UTF-8 para entrada/salida
use open ':std', ':encoding(UTF-8)';
binmode STDIN, ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';
binmode STDERR, ':encoding(UTF-8)';

# Crear objeto CGI
my $cgi = CGI->new;

# Enviar encabezado HTTP con UTF-8
print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Leer parámetros CGI
my $nombre_universidad         = decode_utf8($cgi->param('NOMBRE') || '');
my $tipo_gestion               = decode_utf8($cgi->param('TIPO_GESTION') || '');
my $estado_licenciamiento      = decode_utf8($cgi->param('ESTADO_LICENCIAMIENTO') || '');
my $fecha_inicio_licenciamiento = decode_utf8($cgi->param('FECHA_INICIO') || '');
my $fecha_fin_licenciamiento   = decode_utf8($cgi->param('FECHA_FIN') || '');
my $periodo_licenciamiento     = decode_utf8($cgi->param('PERIODO_LICENCIAMIENTO') || '');
my $departamento               = decode_utf8($cgi->param('DEPARTAMENTO') || '');
my $provincia                  = decode_utf8($cgi->param('PROVINCIA') || '');
my $distrito                   = decode_utf8($cgi->param('DISTRITO') || '');

# Imprimir datos en HTML
print <<HTML;
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Información de la Universidad</title>
</head>
<body>
    <p>universidad: $nombre_universidad</p>
    <p>tipo gestion: $tipo_gestion</p>
    <p>estado de licenciamiento: $estado_licenciamiento</p>
    <p>fecha inicio licenciamiento: $fecha_inicio_licenciamiento</p>
    <p>fecha fin licenciamiento: $fecha_fin_licenciamiento</p>
    <p>periodo licenciamiento: $periodo_licenciamiento</p>
    <p>departamento: $departamento</p>
    <p>provincia: $provincia</p>
    <p>distrito: $distrito</p>
</body>
</html>
HTML
