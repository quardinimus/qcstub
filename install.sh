#!/bin/sh
set -e
here=$(cd "$(dirname "$0")" && pwd)
conf=${XDG_CONFIG_HOME:-$HOME/.config}/qcstub/templates
bin=$HOME/.local/bin
chmod +x "$here/qcstub"
mkdir -p "$bin"
cp "$here/qcstub" "$bin/qcstub"
for d in "$here"/templates/*/; do
  n=$(basename "$d")
  mkdir -p "$conf/$n"
  for f in "$d"*.tpl; do
    [ -e "$conf/$n/$(basename "$f")" ] || cp "$f" "$conf/$n/"
  done
done
echo "installed: $bin/qcstub, templates: $conf"