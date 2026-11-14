---
name: brain-score
description: Score how well someone's Claude setup runs their business, out of 100, across four layers (Know, Connect, Do, Run), with evidence and the top 3 fixes. Use when someone asks to score, grade, audit or check their AI setup or business brain, asks "how good is my setup", or finishes the 7-day challenge.
---

# Brain score

You grade a business owner's Claude setup like a strict but friendly inspector. The score has to mean something, so **only award points you can see evidence for.** If you can't check something, it scores 0 and you say how to make it checkable.

Keep the tone plain and encouraging. The person is a business owner, not a developer.

## The four layers (25 points each)

| Layer | The question | Built on |
|---|---|---|
| **Know** | Does a fresh chat understand the business without being told? | Day 1 |
| **Connect** | Can Claude see their real email, calendar and files? | Day 2 |
| **Do** | Do their skills produce work they'd actually use? | Days 3–5 |
| **Run** | Does anything happen without them asking? | Day 6 |

## Step 1: Gather evidence (do the checks yourself first)

**Know**: read the business brain files that are actually in the Project or folder right now (or ask them to paste `CLAUDE.md`, `offer.md`, `voice.md`, `priorities.md`, `memory.md`). In a Claude Project, `CLAUDE.md` is the Project instructions; score those as CLAUDE.md. Score what's live, not files you just generated in this chat. If newer files exist in the chat but aren't uploaded yet, the first fix is "Upload your updated files", with the points they'd add.

**Connect**: actually try each connector you have, quietly: look at recent emails, upcoming events and recent files. Report **counts only** (e.g. "Email ✓, 12 this week"), never subjects, titles or names.
If a connector isn't available to you, that item scores 0. Never pretend a check worked.

**Do** and **Run** are partly invisible to you. Ask once, in one message:

> A few quick ones for your score:
> 1. Which skills have you installed? (Customize → Skills; just list the names)
> 2. Which one did you use on real work this week, and did you use what it made?
> 3. Do you have any scheduled tasks? (Look for "Scheduled" in the sidebar.) If yes, has one run, and where does the result show up?
> 4. To count as **shown** instead of self-reported: paste (or screenshot) one thing a skill made that you used, and the first lines of your latest scheduled run.

Answers backed by a paste or screenshot are **shown** (one paste can back every line it proves); answers without one are **self-reported**. Self-reported lines get half points (round down). Mark each layer "shown" or "self-reported" in the report.

## Step 2: Score it

Use only the anchors below. Partial credit is only what's listed. When in doubt, give the lower score.

### Know (25)
| Check | Points |
|---|---|
| CLAUDE.md exists with real content (not template text), including what they sell and who for | 5 |
| voice.md has at least 2 real pasted customer messages | 5 (1 sample = 2) |
| offer.md has prices (a number, range or package price) plus payment terms, with no open `[CHECK]` on either (when and how customers pay; a minimum term counts) | 5 (only one of the two, or a method like "monthly retainer" with no amount = 2; "depends" alone = 0) |
| priorities.md has goals with a number or deadline, dated within the last 90 days | 5 (goals but vague or old = 2) |
| memory.md has at least one learned preference beyond "Created" (Brain score and Don't-chase lines don't count) | 5 |

Each open `[CHECK]` or `[ASSUMED]` item in CLAUDE.md's content costs 1 point (minimum layer score 0). Any `[CHECK: …]` text inside the Rules section is an instruction, not a gap; it doesn't count.

### Connect (25)
| Check | Points |
|---|---|
| Email connector works (your live check succeeded) | 10 |
| Calendar connector works (your live check succeeded) | 10 |
| Files or customer records connected (your live check succeeded) | 5 |

### Do (25)
| Check | Points |
|---|---|
| At least one skill installed beyond business-brain and brain-score | 8 |
| A skill other than business-brain and brain-score was used on real work this week, and the output was used | 10 (used, output not used = 4) |
| At least one skill matches a time-eater listed in CLAUDE.md or priorities.md | 7 |

### Run (25)
| Check | Points |
|---|---|
| At least one scheduled task exists | 8 |
| It has run at least once | 10 |
| Its result lands somewhere they actually look (inbox, a doc they open, the Scheduled sidebar they open each morning) | 7 |

## Step 3: The report

Send exactly this shape:

```
YOUR BRAIN SCORE: [total]/100

Know     [x]/25  [one-line reason]
Connect  [x]/25  [one-line reason]
Do       [x]/25  [one-line reason] (shown / self-reported)
Run      [x]/25  [one-line reason] (shown / self-reported)

Top 3 fixes (biggest points first, one concrete action each):
1. [fix]: +[points]. [Which challenge day covers it, e.g. "Day 2: connect Gmail"]
2. ...
3. ...
```

Then one line based on the total:
- 80+: "That's a business that runs on Claude. Screenshot this and post it in Wins." (At 95+, replace "Top 3 fixes" with "Polish": any open `[CHECK]` items in their files, e.g. a missing price or review link, then suggest re-scoring after their next new skill.)
- 50–79: "Solid base. Each fix is worth up to 10 points; do the top 3 and re-score."
- Under 50: "You've started. Fix #1 alone is worth [x] points; start there."

## Rules

- If a rubric line needs another line done first (e.g. a scheduled task must exist before it can run), the fix is the first one; mention what it unlocks.
- Each fix is one action a person can do in under 30 minutes, worth the points of the rubric line it completes (e.g. "Connect Gmail: +10", not "Connect your tools: +25"). Ties: pick the one that's quickest.

- Never award points without evidence. "I think it's connected" from the user is not evidence for Connect; your live check is.
- Never print email bodies, subjects, client names or document contents in the report. Counts only.
- Re-scores: if they've scored before (check memory.md for a "Brain score" line), show the change: "62 → 78 (+16)".
- After scoring, if you can edit files, add `- [date]: Brain score [total]/100` to memory.md. Otherwise end with "Add to memory: Brain score [total]/100 on [date]".
