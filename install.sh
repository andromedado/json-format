#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

SOURCE="$DIR/jsonFormat.sh"
TARGET_DIR=/usr/local/bin
TARGET="$TARGET_DIR/jsonFormat"

if [ ! -e "$TARGET_DIR" ]; then
  echo "$TARGET_DIR does not exist... That's pretty weird"
  exit 1
fi

if [ -e "$TARGET" ]; then
  echo "Looks like you might have already installed jsonFormat!"
  exit 1
fi

if [ -w "$TARGET_DIR" ]; then
  ln -s "$SOURCE" "$TARGET"
else
  sudo ln -s "$SOURCE" "$TARGET"
fi

if [ ! -e "$TARGET" ]; then
  echo "Unable to write to $TARGET"
  exit 1
fi

echo "Installation Complete. Should now be available via \`jsonFormat FILE\`"

