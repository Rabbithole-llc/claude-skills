# Claude Skills by Rabbithole Labs

Plug-and-play skills for Claude that do real work for your business. No code.

| Skill | What it does | Download |
|---|---|---|
| **business-brain** | Claude interviews you and builds a small set of files so every chat knows what you sell, who you sell to, how you charge and how you talk | [business-brain.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/business-brain.zip) |

More skills are added regularly.

## Install a skill (Claude app or claude.ai)

1. You need a paid Claude plan (Pro, Max or Team).
2. Turn on **Settings → Capabilities → Code execution and file creation**.
3. Download the skill's `.zip` from the table above. **Don't unzip it.**
4. In Claude, go to **Customize → Skills → + → Upload a skill**, choose the zip, and switch it on.
5. Start a new chat and ask for it, e.g. "Set up my business brain."

> Use the download links above, not GitHub's green "Code → Download ZIP" button. That button wraps everything in an extra folder, and Claude's skill upload will reject it.

## Install in Claude Code

Copy the skill folder (e.g. `business-brain/`) into `~/.claude/skills/` for all projects, or into `.claude/skills/` inside a project.

## For maintainers

`./package.sh` builds `dist/<skill>.zip` with the layout Claude's upload expects (`<skill>/SKILL.md` at the root). Attach those zips to a GitHub Release; the links above always point at the latest release.

---

Made by Austin White · Rabbithole Labs
