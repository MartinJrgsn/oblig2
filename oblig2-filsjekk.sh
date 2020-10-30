#!/bin/sh

# Dette skriptet kan brukes til å sjekke at dere har fått med dere
# alle påkrevde filer i innleveringen.

if [ "$1" = "-h" ] || [ $# -ne 1 ]; then

    cat<<EOF 
Legg den usignerte innleveringsfila (oblig2-STUDENTNUMMER.tar.gz) i
samme katalog som denne fila, og kjør den med studentnummer som
argument.
EOF

    exit 0

fi


FILER="deltagere.csv \
brev.docx \
typescript \
tidsfil \
lag_brev.sh \
adresser.xlsx \
hent_adresser.sh \
send_e-post.sh \
makefile"


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

for F in $FILER; do
    tar tzvf $GZ | grep -q $F\$
    if [ 0 -ne "$?" ]; then
	echo Filen $F mangler
    fi
done
