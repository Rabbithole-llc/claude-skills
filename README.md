# Claude Skills by Rabbithole Labs

Plug-and-play skills for Claude that do real work for your business. No code.

| Skill | What it does | Download |
|---|---|---|
| **business-brain** | Claude interviews you and builds a small set of files so every chat knows what you sell, who you sell to, how you charge, how you talk and what you're working toward. Say "update my business brain" any time to add to it | [business-brain.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/business-brain.zip) |
| **brain-score** | Scores your Claude setup out of 100 across four layers (Know, Connect, Do, Run) and gives you the top 3 fixes | [brain-score.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/brain-score.zip) |

More skills are added regularly.

## Install a skill (Claude app or claude.ai)

1. You need a paid Claude plan (Pro, Max or Team).
2. Turn on **Settings → Capabilities → Code execution and file creation**.
3. Download the skill's `.zip` from the table above. **Don't unzip it.**
4. In Claude, go to **Customize → Skills → + → Upload a skill**, choose the zip, and switch it on.
5. Start a new chat and ask for it, e.g. "Set up my business brain."

> Use the download links above, not GitHub's green "Code → Download ZIP" button. That button wraps everything in an extra folder, and Claude's skill upload will reject it.

## Claude Code or Cowork: the My Business kit

Download **[my-business-kit.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/my-business-kit.zip)**, unzip it, open the `My Business` folder in Claude Code or Cowork, and say "Set up my business brain." All skills are already inside `.claude/skills/`.

Or copy any skill folder into `~/.claude/skills/` yourself.

## For maintainers

`./package.sh` builds `dist/<skill>.zip` with the layout Claude's upload expects (`<skill>/SKILL.md` at the root), plus `dist/my-business-kit.zip` from `kit-template/` and every skill. Attach those zips to a GitHub Release; the links above always point at the latest release.

---

Made by Austin White · Rabbithole Labs
