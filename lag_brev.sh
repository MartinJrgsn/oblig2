#!/bin/bash

mkdir ~/oblig2/brev ~/oblig2/brev/vedlegg

unzip ~/oblig2/brev.docx

cp ~/oblig2/word/document.xml ~/oblig2
cp ~/oblig2/word/media/image1.png ~/oblig2/brev/vedlegg/bilde1
cp ~/oblig2/word/media/image2.png ~/oblig2/brev/vedlegg/bilde2

sed -i 's|<w:t>|\n<w:t>|g' ~/oblig2/document.xml

sed -i 's|</w:t>|</w:t>\n|g' ~/oblig2/document.xml

grep '<w:t>' ~/oblig2/document.xml | cat > ~/oblig2/brev/brev.txt


rm -r ~/oblig2/brev/docProps
rm -r ~/oblig2/brev/_rels
rm -r ~/oblig2/brev/word
rm ~/oblig2/brev/[Content_Types].xml
rm ~/oblig2/document.xml
