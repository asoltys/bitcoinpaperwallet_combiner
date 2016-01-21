#!/bin/bash

for f in [0-9]*.pdf
do
  pdftotext $f temp
  sed -n 2,2p temp >> keys.txt
done
