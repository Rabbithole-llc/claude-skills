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
  skills+=("$n")
  zip -qr dist/$n.zip $n -x "*.DS_Store"
  echo "dist/$n.zip"
done
# Plugin-form zips for skills whose lesson says "upload it under Plugins".
# claude.ai Plugins > Add > Upload plugin needs .claude-plugin/plugin.json (https://claude.com/docs/plugins/build).
# The plain skill zip is kept as <skill>-skill.zip for the older "Upload a skill" path.
for n in business-brain repurpose hooks follow-up daily-brief brain-score; do
  case $n in
    business-brain)
      title="Business Brain"; dver=0.8.0
      desc="Interviews a business owner and builds their business brain: seven files with their offer, customers, goals and tone of voice, so Claude writes replies, follow-ups and posts that sound like them" ;;
    repurpose)
      title="Week of Posts"; dver=0.9.0
      desc="Turns one video, podcast or newsletter transcript into a week of posts: the 7 strongest ideas, each with a hook, a short script and a caption in your voice, and schedules them through Postkey when you ask" ;;
    hooks)
      title="Viral Hooks"; dver=0.9.0
      desc="Turns 10 viral videos from your niche into 30 hooks for your business: why each one worked, 30 new hooks in your voice, and the 5 to film first, plus a comment keyword and Postkey DM for each" ;;
    follow-up)
      title="Follow-up"; dver=0.9.1
      desc="Finds quotes, leads, unpaid invoices and quiet past customers, drafts the nudge in your voice, and shows how Postkey catches leads from comments and DMs" ;;
    daily-brief)
      title="Daily Brief"; dver=0.9.1
      desc="A weekday morning brief: calendar, replies waiting, follow-ups and today's one thing, plus the posts going out today when Postkey is connected" ;;
    brain-score)
      title="Brain Score"; dver=0.9.1
      desc="Scores your Claude setup out of 100 with the top 3 fixes, and shows how Postkey makes posts and DMs run without you" ;;
  esac
  ptmp=$(mktemp -d)
  mkdir -p "$ptmp/$n/.claude-plugin" "$ptmp/$n/skills"
  cp -R $n "$ptmp/$n/skills/"
  ver=$(sed -n 's/^version: *//p' $n/SKILL.md | head -1); ver=${ver:-$dver}
  cat > "$ptmp/$n/.claude-plugin/plugin.json" <<JSON
{
  "name": "$n",
  "displayName": "$title",
  "version": "$ver",
  "description": "$desc.",
  "author": { "name": "Austin White, Rabbithole Labs" },
  "license": "MIT"
}
JSON
  mv dist/$n.zip dist/$n-skill.zip
  (cd "$ptmp" && zip -qr plugin.zip "$n" -x "*.DS_Store")
  mv "$ptmp/plugin.zip" dist/$n.zip && rm -rf "$ptmp"
  echo "dist/$n.zip (plugin form) + dist/$n-skill.zip"
done

tmp=$(mktemp -d)
mkdir -p "$tmp/My Business/.claude/skills"
cp -R kit-template/. "$tmp/My Business/"
for n in "${skills[@]}"; do cp -R $n "$tmp/My Business/.claude/skills/"; done
(cd "$tmp" && zip -qr my-business-kit.zip "My Business" -x "*.DS_Store")
mv "$tmp/my-business-kit.zip" dist/ && rm -rf "$tmp"
echo "dist/my-business-kit.zip"

# Marketplace plugin (claude.ai "Add marketplace" and Claude Code /plugin install):
# plugins/my-business-kit/ is generated from the skill folders above. Edit the skills, not this copy.
rm -rf plugins/my-business-kit/skills && mkdir -p plugins/my-business-kit/skills plugins/my-business-kit/.claude-plugin
for n in "${skills[@]}"; do cp -R $n plugins/my-business-kit/skills/; done
cat > plugins/my-business-kit/.claude-plugin/plugin.json <<JSON
{
  "name": "my-business-kit",
  "displayName": "My Business Kit",
  "version": "$(python3 -c 'import json;print(json.load(open(".claude-plugin/marketplace.json"))["plugins"][0]["version"])')",
  "description": "Seven skills that make Claude run the busywork of a small business: a business brain, inbox replies, follow-ups, a week of posts, 30 hooks from viral videos, a morning brief, and a score for your setup. Everything is drafted for you to review; nothing is sent on its own.",
  "author": { "name": "Austin White, Rabbithole Labs" }
}
JSON
echo "plugins/my-business-kit (marketplace plugin)"

# One marketplace plugin per skill (11-19), so people install just the one from the reel:
# Customize > Plugins > Add > Add marketplace > Rabbithole-llc/claude-skills > Install "<displayName>".
python3 - "${skills[@]}" <<'PY'
import json,os,shutil,sys
meta={
 'business-brain':('Business Brain','Builds your business brain: seven files with your offer, customers, goals and tone of voice, so Claude writes like you'),
 'repurpose':('Week of Posts','Turns one video, podcast or newsletter transcript into a week of posts in your voice, then schedules them with Postkey when you ask'),
 'hooks':('Viral Hooks','Give it 10 viral videos from your niche and it writes 30 hooks for your business, picks the 5 to film first, and sets up comment-keyword DMs with Postkey'),
 'reply-drafter':('Reply Drafter','Finds customer emails waiting on you and drafts replies in your voice'),
 'follow-up':('Follow-up','Finds quotes, leads, unpaid invoices and quiet past customers, drafts the nudge, and shows how Postkey catches leads from comments and DMs'),
 'daily-brief':('Daily Brief','A weekday morning brief: calendar, replies waiting, follow-ups and today\'s one thing, plus the posts going out today when Postkey is connected'),
 'brain-score':('Brain Score','Scores your Claude setup out of 100 with the top 3 fixes, and shows how Postkey makes posts and DMs run without you'),
}
ver='0.9.1'; m=json.load(open('.claude-plugin/marketplace.json'))
kit=[p for p in m['plugins'] if p['name']=='my-business-kit'][0]
plugins=[]
for n in sys.argv[1:]:
    title,desc=meta[n]; d=f'plugins/{n}'
    shutil.rmtree(d,ignore_errors=True); os.makedirs(f'{d}/.claude-plugin'); shutil.copytree(n,f'{d}/skills/{n}')
    pj={'name':n,'displayName':title,'version':ver,'description':desc+'.','author':{'name':'Austin White, Rabbithole Labs'},'license':'MIT'}
    json.dump(pj,open(f'{d}/.claude-plugin/plugin.json','w'),indent=2)
    plugins.append({'name':n,'displayName':title,'source':f'./plugins/{n}','description':desc+'.','version':ver,'author':{'name':'Austin White · Rabbithole Labs'}})
order=['hooks','repurpose','business-brain','reply-drafter','follow-up','daily-brief','brain-score']
plugins.sort(key=lambda p:order.index(p['name']) if p['name'] in order else 99)
m['plugins']=plugins+[kit]
json.dump(m,open('.claude-plugin/marketplace.json','w'),indent=2,ensure_ascii=False)
print('marketplace:',', '.join(p['displayName'] for p in m['plugins']))
PY
