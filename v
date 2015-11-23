#/bin/bash

f1=`echo $1 | cut -d':' -f1`
f2=`echo $1 | cut -d':' -f2`
f3=`echo $1 | cut -d':' -f3`

filename=$f1
if [[ $filename == a/* ]] || [[ $filename == b/* ]]; then
  # Remove a/ and b/ prefixes (from diffs filenames)
  filename=${filename:2}
fi

case $f2 in
    ''|*[!0-9]*) ;;
    *) line=$f2 ;;
esac

case $f3 in
    ''|*[!0-9]*) ;;
    *) column=$f3 ;;
esac

if [ -z "$line" ]; then
  vim $filename
elif [ -z "$column" ]; then
  vim $filename +$line
else
  vim "+call cursor($line, $column)" $filename
fi
