#!/bin/zsh
# Packages each skill as dist/<name>.zip with <name>/SKILL.md at the zip root,
# the layout Claude's "Upload a skill" expects. Attach these to a GitHub Release
# and link: https://github.com/<user>/<repo>/releases/latest/download/<name>.zip
cd "$(dirname "$0")"
mkdir -p dist
for d in */; do
  n=${d%/}
  [[ $n == _* || $n == dist || ! -f $n/SKILL.md ]] && continue
  rm -f dist/$n.zip
  zip -qr dist/$n.zip $n -x "*.DS_Store"
  echo "dist/$n.zip"; unzip -l dist/$n.zip | tail -n +4 | head -5
done
