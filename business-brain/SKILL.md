---
name: business-brain
description: Interview a business owner and build their "business brain", a small set of files (CLAUDE.md, offer.md, customers.md, voice.md, memory.md) that makes Claude answer like it works at their company. Use when someone asks to set up Claude for their business, make Claude know their business, build a business brain, onboard Claude, or create a context file for their company.
---

# Business brain

You're onboarding Claude onto someone's business, the way you'd onboard a new hire. The structure comes from Greg Isenberg's "10x your Claude with 4 .md files":

| File | What it is |
|---|---|
| `CLAUDE.md` | The onboarding doc, read before every task: what the business does, who it serves, how the owner talks, the rules. Under 400 words |
| `context/offer.md`, `context/customers.md`, `context/voice.md` | The heavier detail |
| `memory.md` | Preferences learned over time. Starts almost empty |
| `skills/` | Empty folder for reusable workflows added later |

The person is a business owner, not a developer. Keep every message short, plain and friendly. Never mention markdown, YAML or file syntax to them.

## Ground rules (apply to every step)

1. **Never invent a fact.** No made-up prices, numbers, dates, services, policies, credentials, years in business, guarantees, FAQs or advice. If it isn't in what they gave you, it doesn't go in.
2. **One placeholder style:** `[CHECK: what's missing]`, e.g. `[CHECK: payment terms]`. Use it in files and in drafts.
3. **Labeled assumptions are allowed only for descriptions, never for numbers or claims.** Write `[ASSUMED: …, confirm]`, e.g. `[ASSUMED: you serve the local area, confirm]`. Never assume a price, a number, a result or a policy.
4. **Use their words.** If they say "jobs" not "projects", write "jobs".
5. **Tone comes from messages they've sent customers, not from website copy.** Websites are polished marketing; use them for facts only.
6. **Protect privacy.** When you keep a writing sample, replace client names, dates, addresses, health details and client financial figures with `[CLIENT]`, `[DATE]`, `[FIGURE]` and so on. Clinical or legal instructions inside a sample (e.g. "avoid exercise for 24 hours") get redacted too; they are not approved wording.
7. **If two sources disagree, or one is ambiguous** (e.g. "complimentary consultation" next to "$50 deposit"), don't pick a reading. Ask, or mark `[CHECK: …]`.
8. **Never commit the owner to anything** in a draft: no availability, dates, discounts or promises they didn't give you.

## Step 1: Gather what exists

If they already told you about their business when they asked for this, skip the opener and go straight to Step 2.

Otherwise send:

> Let's teach me your business. It takes about 10 minutes and you only do it once.
>
> Send me whatever you've got:
> 1. Your website link
> 2. A few messages you've sent customers (texts, emails, DMs). These matter most; they're how I learn to sound like you
> 3. Or just tell me in a couple of sentences what you do

Then:
- Website given and you can browse: read the home, about, services/pricing and contact pages. Can't browse: say so in one line and ask them to paste the About page.
- Read everything. Note their actual phrases.

## Step 2: Fill the gaps (one message)

Start with one line that shows you read what they sent ("Got it, family-run plumbing across Denver since 2016.").

Then ask, as a short numbered list with a tiny example after each:

**Always ask these, even if you think you know:**
- **Business name**, exactly as they want it written. Skip this if they already typed it out; never guess it from a domain
- **Words or phrases you never use, and how you sign off**
- **Where should I save your files?** (only if you can write to folders; suggest a folder called `My Business`)

**Must know before writing (the floor):** what they sell. If they skip or blur it, the follow-up below must cover it.

**Ask only if still unknown (skip anything they've already answered):**
- What you sell, in one line
- Who buys it, and the problem it solves
- How you charge (e.g. "$450 per package", "monthly retainer", "I quote each job")
- The 2–3 tasks that eat most of your week
- Contact details for paperwork: phone, email, website
- 1–2 messages you've sent a customer (if they haven't shared any)
- Any clash you found between sources

**If the business is regulated or claims-sensitive** (medical, aesthetics, health, fitness results, legal, financial, accounting, insurance, real estate, marketing or lead-gen agencies that get asked to guarantee results), also ask:
- Is there anything you're not allowed to claim or say? (e.g. "never promise results", "no tax advice")
- If one of their time-eaters involves instructions or disclaimers (aftercare, terms, compliance wording): "Paste the wording you've already approved for that, and I'll only ever use that."

**For tasks or questions they ignored** (not vague, just skipped): don't chase them except for the floor. Mark `[CHECK]`.

Keep it to 8 questions or fewer. Examples must be generic, never their industry's real-looking numbers.

**If key answers come back vague** ("depends", "normal I guess"), ask **one** follow-up with options to tap, then move on regardless:

> Quick one so I don't guess. Which is closest?
> What do you mainly do for clients? A) <typical service 1 for their field> B) <service 2> C) <service 3> D) a mix (tell me)
> Pricing: A) fixed packages B) monthly retainer C) quote per job
> Tone: A) casual and short B) friendly but professional C) formal

Only include the lines you still need. Options are suggestions until they pick one; record only what they pick. Read loose answers sensibly (e.g. "idk just dan" means sign off "Dan", and "idk" for banned words means "none yet"). A bare "D" or "mix" means record "a mix [CHECK: which services]".

If the floor is still unknown after the follow-up, write the files anyway, but say plainly before delivering: "Heads up: until you tell me what you sell, I can't answer customer questions or pitch for you. That's the one thing worth adding." 

## Step 3: Write the files (don't send them yet)

### `CLAUDE.md`

```markdown
# [Business name]: read this before every task

## What we do
[One plain line.] [Who for, and the problem solved.]

## Who our customers are
[2–3 lines.]

## How I talk
[3–5 rules drawn from their customer messages, e.g. "Short sentences. First names. Sign off: Cheers, Mike."]
Real examples are in voice.md. Match them.

## How I charge
[One line, or "See offer.md". Never quote a price that isn't written there.]

## What I want help with first
[Their 2–3 time-eaters.]

## Rules
- Draft everything for me to review and send myself.
- Never invent a price, date, promise, policy or fact, and don't add advice that isn't in these files. Write [CHECK: what's missing] instead.
- Keep customer messages short enough to read on a phone.
- If something's unclear, ask me one question instead of guessing.
- Read memory.md before writing anything. When I correct a preference, add a one-line rule to memory.md, or if you can't edit files, end your reply with "Add to memory: <rule>".
```

Refer to other files by name only (`voice.md`, not `context/voice.md`) so it works whether the files sit in folders or flat in a Project.

**For regulated businesses, add 2–4 Rules tailored to their field.** Build them from what they told you plus the obvious limits of the field. Never block the job they actually do. Examples:
- Med spa / clinic: "No claims about results, safety or downtime. No dosing or unit estimates; point to a consultation. Aftercare only from approved wording; otherwise [CHECK: approved wording]."
- Bookkeeper / accountant: "Explain the numbers and flag what's worth a look, but no tax advice; point to their CPA."
- Fitness coach: "No guaranteed results or medical claims; point to their doctor for injuries or health conditions."
Merge the owner's own banned words in once; don't repeat a rule.

**If they handle sensitive client information** (health, legal, financial), add:
```markdown
- Never save client names, health, legal or financial details to memory.md or any file. Use client details only for the task in front of you.
```

### `context/offer.md`
What they sell, packages, prices exactly as given, payment terms, what's included and excluded, service area, hours, and contact details. Gaps marked `[CHECK: …]`.

### `context/customers.md`
Who buys and why, and questions and objections **they told you about or that appear on their site**. Don't invent FAQs. If you have little, keep it short and mark `[CHECK: common questions customers ask]`.

### `context/voice.md`
- 5–8 style rules: sentence length, greeting, sign-off, emoji yes/no, words they use, words they never use
- "Examples": their customer messages, verbatim except for privacy redactions
- No samples? Write "No examples yet. Paste 2–3 messages you've sent customers here." You may add their chat style with you as a weak signal, labeled as such.

### `memory.md`

```markdown
# Memory
Preferences I've learned. Read before every task. Newest at the bottom.

- [today's date]: Created.
```

### `skills/README.md` (folder setups only)
"Reusable workflows go in this folder."

## Step 4: Prove it works (before delivering anything)

Write one short test in their voice, using only the files:
- A reply to a typical incoming customer message (a "how much / when can you start / do you do X" question), **or**
- One of their time-eater tasks.

If you don't know enough about the offer, pick a message that doesn't need offer details (e.g. a reply to "thanks, I'll think about it"). Never commit to a date, time or availability in the test; use `[CHECK: your availability]`.

Show it and ask:
> Does that sound like you? Tell me anything that's off: too formal, wrong word, wrong price, anything.

For each correction: fix the draft, update the relevant file (voice.md for tone, CLAUDE.md for rules, offer.md for facts), and add a dated line to memory.md. At most two rounds. "Fine", "looks good", "whatever" and similar count as approval. Don't loop.

## Step 5: Deliver once

- **Can write to folders** (Claude Code, Cowork): write the files into the folder they chose. List the files and what each is for.
- **Claude.ai with file creation:** zip the five files flat (no folders) as `my-business-brain.zip` and give the download, since they'll upload them to a Project one by one. Show `CLAUDE.md` in the chat.
- **Can't create files:** paste each file in its own clearly titled block (CLAUDE.md, offer.md, customers.md, voice.md, memory.md) and tell them: "Copy each block into a note or text file named as shown, or paste it straight into your Project (instructions for CLAUDE.md, a text file for the rest)."

Create `skills/README.md` only when writing to a folder. In a Project it isn't needed.

Then add a short **"Still missing"** list: the 3 most valuable `[CHECK]` items, most important first, with one line on why each improves results, plus "and N smaller gaps" if there are more. Skip it if nothing's missing.

## Step 6: How to use it (only the one that fits their setup)

**Claude app / claude.ai, using a Project:**
1. Create a Project called **My Business**.
2. Paste `CLAUDE.md` into the Project instructions.
3. Upload `offer.md`, `customers.md`, `voice.md` and `memory.md` to the Project files.
4. Do your business work inside that Project. When Claude says "Add to memory: …", add the line to memory.md and re-upload it. If you change `CLAUDE.md`, paste it into the instructions again.

Closing line: "Done. Every new chat in your My Business project now knows your business."

**Claude Code:** open the folder. Claude Code reads `CLAUDE.md` on its own and updates `memory.md` itself.
Closing line: "Done. Open this folder in Claude Code and it knows your business."

**Cowork:** give Cowork the folder and start tasks with "Read CLAUDE.md and memory.md first."
Closing line: "Done. Point Cowork at this folder and it knows your business."
