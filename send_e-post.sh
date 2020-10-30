#!/bin/bash

mv ~/oblig2/brev/vedlegg/bilde1 ~/oblig2/brev/vedlegg/bilde1.png
mv ~/oblig2/brev/vedlegg/bilde2 ~/oblig2/brev/vedlegg/bilde2.png

for i in $(cat ~/oblig2/adresser.csv)
do
	Navn=$(echo $i | cut -f1 -d:)
	Adresser=$(echo $i | cut -f2 -d:)
	echo $Navn
	echo $Adresser
	cat ~/oblig2/brev/brev.txt | sed s/=mottager=/$Navn/g | sed s/=meg=/Phishermann/g | mutt $Adresser -s "oblig2 oppgave 5" -a ~/oblig2/brev/vedlegg/bilde1.png ~/oblig2/brev/vedlegg/bilde2.png
done

mv ~/oblig2/brev/vedlegg/bilde1.png ~/oblig2/brev/vedlegg/bilde1
mv ~/oblig2/brev/vedlegg/bilde2.png ~/oblig2/brev/vedlegg/bilde2
