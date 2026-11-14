# Claude Skills by Rabbithole Labs

Plug-and-play skills for Claude that do real work for your business. No code.

| Day | Skill | What it does | Download |
|---|---|---|---|
| 1 | **business-brain** | Claude interviews you and builds files so every chat knows what you sell, who you sell to, how you charge, how you talk and what you're working toward. Say "update my business brain" any time | [business-brain.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/business-brain.zip) |
| 3 | **reply-drafter** | Finds customer emails waiting on you and drafts replies in your voice | [reply-drafter.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/reply-drafter.zip) |
| 4 | **follow-up** | Finds quotes, leads, unpaid invoices and past customers that went quiet, and drafts the nudge | [follow-up.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/follow-up.zip) |
| 5 | **repurpose** | Turns one video or transcript into a week of posts | [repurpose.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/repurpose.zip) |
| 6 | **daily-brief** | A weekday morning brief (calendar, replies waiting, follow-ups, today's one thing) that runs on its own | [daily-brief.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/daily-brief.zip) |
| 7 | **brain-score** | Scores your setup out of 100 across Know, Connect, Do and Run, with the top 3 fixes | [brain-score.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/brain-score.zip) |

Day 2 is connecting Gmail, Google Calendar and Google Drive under Customize → Connectors (no skill needed).

All skills draft for you to review; none of them send emails or change anything on their own.

More skills are added regularly.

## Install a skill (Claude app or claude.ai)

1. You need a paid Claude plan (Pro, Max or Team).
2. Turn on **Settings → Capabilities → Code execution and file creation**.
3. Download the skill's `.zip` from the table above. **Don't unzip it.**
4. In Claude, go to **Customize → Skills → + → Upload a skill**, choose the zip, and switch it on.
5. Start a new chat and ask for it, e.g. "Set up my business brain."

> Use the download links above, not GitHub's green "Code → Download ZIP" button. That button wraps everything in an extra folder, and Claude's skill upload will reject it.

## Claude Code or Cowork: the My Business kit

Download **[my-business-kit.zip](https://github.com/Rabbithole-llc/claude-skills/releases/latest/download/my-business-kit.zip)**, unzip it, open the `My Business` folder in Claude Code or Cowork, and say "Set up my business brain." All skills are already inside `.claude/skills/` (Claude Code picks them up; if Cowork doesn't list them, upload the zips under Customize → Skills).

Or copy any skill folder into `~/.claude/skills/` yourself.

## For maintainers

`./package.sh` builds `dist/<skill>.zip` with the layout Claude's upload expects (`<skill>/SKILL.md` at the root), plus `dist/my-business-kit.zip` from `kit-template/` and every skill. Attach those zips to a GitHub Release; the links above always point at the latest release.

---

Made by Austin White · Rabbithole Labs
