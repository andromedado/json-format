#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Thanks http://superuser.com/questions/747884/how-to-write-a-script-that-accepts-input-from-a-file-or-from-stdin
FILE="-"
if [ $# -ge 1 ]; then
  FILE=$1
  if [ ! -e "$FILE" ]; then
    echo "`$FILE` doesn't seem to exist."
    exit 1
  fi
fi
cat "$FILE" | node "$DIR/"index.js
