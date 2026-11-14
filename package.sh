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

# Marketplace plugin (claude.ai "Add marketplace" and Claude Code /plugin install):
# plugins/my-business-kit/ is generated from the skill folders above. Edit the skills, not this copy.
rm -rf plugins/my-business-kit/skills && mkdir -p plugins/my-business-kit/skills plugins/my-business-kit/.claude-plugin
for n in $skills; do cp -R $n plugins/my-business-kit/skills/; done
cat > plugins/my-business-kit/.claude-plugin/plugin.json <<JSON
{
  "name": "my-business-kit",
  "displayName": "My Business Kit",
  "version": "$(python3 -c 'import json;print(json.load(open(".claude-plugin/marketplace.json"))["plugins"][0]["version"])')",
  "description": "Six skills that make Claude run the busywork of a small business: a business brain, inbox replies, follow-ups, a week of posts, a morning brief, and a score for your setup. Everything is drafted for you to review; nothing is sent on its own.",
  "author": { "name": "Austin White, Rabbithole Labs" }
}
JSON
echo "plugins/my-business-kit (marketplace plugin)"
