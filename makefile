innlevering: ../oblig2-240368.tar.gz.gpg


../oblig2-240368.tar.gz.gpg: ..oblig2-240368.tar.gz
	gpg --sign ~/oblig2/oblig2-240368.tar.gz
	mv ~/oblig2/oblig2-240368.tar.gz.gpg ~/oblig2-240368.tar.gz.gpg


..oblig2-240368.tar.gz: ./makefile ./deltagere.csv ./typescript ./tidsfil ./lag_brev.sh ./hent_adresser ./send_e-post.sh ./adresser.xlsx ./brev.docx
	tar -cvzf oblig2-240368.tar.gz ../oblig2


send: ./adresser.csv ./brev/brev.txt ./brev/vedlegg/bilde1 ./brev/vedlegg/bilde2

./adresser.csv: ./adresser.xlsx
	./hent_adresser.sh

./brev/brev.txt: ./brev.docx ./brev/vedlegg/bilde1 ./brev/vedlegg/bilde2
	./lag_brev.sh
