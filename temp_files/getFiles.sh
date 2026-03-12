#!/bin/bash
search_dir= pwd
FILENAME=test.csv1
echo $search_dir
if [ 0 == 1 ] ; then
   echo 'comments'
 for entry in *.dat
    do
        echo $entry
       # sed -e s/data:application.pdf\;base64\.//g -i "$entry"
        cat $entry |base64 -d  >$entry.pdf
    done
else
    lineNum=2
    search_dir= pwd
    FILENAME=scef_2026Attachments-1772756270691.csv

    while read -r p
        do

           idRecord=`awk -F',' '{print $2}' $FILENAME | sed -n ''$lineNum'p'`
           fileName=`awk -F',' '{print $3}' $FILENAME | sed -n ''$lineNum'p'`
           attachment=`awk -F',' '{print $5}' $FILENAME | sed -n ''$lineNum'p'`

            outputFileName=$idRecord-$fileName-$lineNum
            echo $idRecord-$fileName-$lineNum.dat

            echo $attachment |sed -e  s/\"//g > "$outputFileName".dat
            echo $attachment |sed -e  s/\"//g |base64 -d >"$outputFileName".pdf


            #echo \"$attachment | base64 -d -w0 > "$fileName.pdf"
            #|sed -e s/data:application.pdf\;base64\.//g > $lineNum.dat
            #sed -e s/data:application.pdf\;base64\.//g -i $attachment
             ((lineNum+=1))
        done < ./$FILENAME
fi
