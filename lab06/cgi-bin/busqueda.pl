#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use open qw(:std :utf8); # Configura entrada/salida estándar como UTF-8
use Encode;             # Manejo explícito de codificaciones

# Declaración de variables
my $nombre_universidad = "Universidad Nacional Autónoma de México"; # Nombre de la universidad
my $pais = "México"; # País
my $ranking_min = 1; # Ranking mínimo
my $ranking_max = 100; # Ranking máximo

# Configurar salida explícitamente a UTF-8
binmode(STDOUT, ":encoding(utf8)");

# Mostrar valores seleccionados
print "Criterios de búsqueda:\n";
print "Nombre de la universidad: $nombre_universidad\n";
print "País: $pais\n";
print "Ranking mínimo: $ranking_min\n";
print "Ranking máximo: $ranking_max\n";

# Placeholder para lógica adicional
print "\n(Placeholder) Aquí realizarías la búsqueda con los criterios proporcionados.\n";

exit;