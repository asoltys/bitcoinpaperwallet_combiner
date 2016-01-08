#!/bin/bash

pdftk back.pdf cat 1down output temp.pdf 
pdftk back.pdf background temp.pdf output backs.pdf
rm temp.pdf 

COUNT=0
for f in [0-9]*.pdf
do
  if [ $((COUNT%2)) -eq 0 ]; then
    PREV=$f
  else
    NEW="combined_$(echo $PREV | cut -f 1 -d '.')_$f"
    echo "Combining $f and $PREV"

    pdftk $PREV cat 1down output temp.pdf
    pdftk temp.pdf background $f output $NEW
    rm temp.pdf

    OUTPUTS[$COUNT]=$NEW
  fi
  COUNT=$(($COUNT+1))
done

LIST=""
for f in "${OUTPUTS[@]}"
do
  LIST="$LIST $f backs.pdf"
done

echo "Combining everything together..."

pdftk $LIST cat output combined.pdf
rm combined_*

echo "Done!"
