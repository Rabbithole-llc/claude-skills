#!/bin/zsh
# Builds release assets in dist/:
#   <skill>.zip         one per skill, <skill>/SKILL.md at the zip root (what Claude's "Upload a skill" expects)
#   my-business-kit.zip folder kit for Claude Code / Cowork: kit-template/ + every skill under .claude/skills/
# Attach dist/*.zip to a GitHub Release; links use
#   https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/<file>.zip
cd "$(dirname "$0")"
rm -rf dist && mkdir -p dist
skills=()
for d in */; do
  n=${d%/}
  [[ $n == _* || $n == dist || $n == kit-template || ! -f $n/SKILL.md ]] && continue
  skills+=$n
  zip -qr dist/$n.zip $n -x "*.DS_Store"
  echo "dist/$n.zip"
done
tmp=$(mktemp -d)
mkdir -p "$tmp/My Business/.claude/skills"
cp -R kit-template/. "$tmp/My Business/"
for n in $skills; do cp -R $n "$tmp/My Business/.claude/skills/"; done
(cd "$tmp" && zip -qr my-business-kit.zip "My Business" -x "*.DS_Store")
mv "$tmp/my-business-kit.zip" dist/ && rm -rf "$tmp"
echo "dist/my-business-kit.zip"
