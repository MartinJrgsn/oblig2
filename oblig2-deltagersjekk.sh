#!/bin/bash

# Dette skriptet kan brukes til å teste deltagerlista fra tar.gz-fila
# (før signering) til oblig2. Dersom delatger-fila er korrekt vil
# skriptet liste ut deltagerne på følgende måte:
#
#   Studentnummer:  123456
#   Etternavn:      Askeladden
#   Fornavn:        Espen
#    
#   Studentnummer:  234567
#   Etternavn:      von Kongeriket
#   Fornavn:        Prinsesse



if [ "$1" = "-h" ] || [ $# -ne 1 ]; then

    cat<<EOF 
Legg den usignerte innleveringsfila (oblig2-STUDENTNUMMER.tar.gz) i
samme katalog som denne fila, og kjør den med studentnummer som
argument.
EOF

    exit 0

fi

FIL=oblig2/deltagere.csv

GZ=./oblig2-$1.tar.gz

if [ ! -e $GZ ]; then

    echo Filen $GZ mangler.
    echo Sørg for at den ligger i arbeidskatalogen.
    exit 1

fi

file $GZ | grep -q gzip
if [ 0 -ne "$?" ]; then

     echo Filen $GZ er ikke en gzip-fil.
     exit 2
fi    

tar -z -f $GZ -x $FIL
if [ 0 -ne "$?" ]; then
    echo Filen $FIL finnes ikke $GZ.
    exit 1
fi

for S in $(cat $FIL);do

    SN=$(echo $S | cut -f1 -d:)
    EN="$(echo $S | cut -f2 -d:)"
    FN="$(echo $S | cut -f3 -d:)"

    echo -e "Studentnummer:\t$SN"
    echo -e "Etternavn:\t$EN"
    echo -e "Fornavn:\t$FN\n"

done
