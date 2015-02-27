#!/bin/bash
for FILE in $@; do
    dos2unix $FILE 2> /dev/null
    sed -e 's/if(/if (/g' -i $FILE
    sed -e 's/}else/} else/g' -i $FILE
    sed -e 's/for(/for (/g' -i $FILE
    sed -e 's/foreach\(.*\):/foreach\1 {/g' -i $FILE
    sed -e 's/endforeach;/}/g' -i $FILE
    sed -e 's/foreach(/foreach (/g' -i $FILE
    sed -e 's/while(/while (/g' -i $FILE
    sed -e 's/){/) {/g' -i $FILE
    sed -e 's/try{/try {/g' -i $FILE
    sed -e 's/}catch/} catch{/g' -i $FILE
    sed -e 's/catch(/catch (/g' -i $FILE
    sed -e 's/[ \t]*$//' -i $FILE
    expand -t 4 $FILE > $FILE.tmp
    mv $FILE.tmp $FILE
    php -l $FILE
done

