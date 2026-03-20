# Nanny Feynman

> *"A Feynman Technique tutor disguised as a sharp nan from Croydon"*

**"What I cannot create, I do not understand."** — Richard Feynman

---

## What is this?

Nanny Feynman is an AI-powered learning tool that uses the [Feynman Technique](https://fs.blog/feynman-technique/) to test whether you actually understand something — or just think you do.

You pick a concept (or get assigned one). You explain it in plain English. And then **Doris** — a 78-year-old retired schoolteacher from Croydon — presses on every gap, every hand-wave, every bit of jargon until you either truly understand it... or admit you need to go learn more.

She's warm. She's sharp. She will not let you hide behind fancy words.

Named after:
- **Richard Feynman's learning method** — if you can't explain it simply, you don't understand it
- **Doris Margaret Finch** — the fictional retired schoolteacher who brings the method to life

## How it works

1. **Pick a concept** — choose from the [question bank](questions.md) or bring your own
2. **Explain it simply** — pretend you're explaining it to Doris, who is smart but non-technical
3. **Get pressed** — Doris finds the gaps in your explanation and asks follow-up questions
4. **Fill the gaps** — either deepen your explanation or admit what you don't know
5. **Get the verdict** — grudging approval ("You're not as daft as you look") or homework ("Go read about that before I see you next")

## Usage

### As a Claude Code skill

Copy the skill to your Claude Code skills directory:

```bash
mkdir -p ~/.claude/skills/nanny-feynman
cp SKILL.md ~/.claude/skills/nanny-feynman/SKILL.md
cp questions.md ~/.claude/skills/nanny-feynman/questions.md
cp doris.md ~/.claude/skills/nanny-feynman/doris.md
```

Then trigger it with any of:
- `/nanny`
- `/feynman`
- `/doris`
- "quiz me"
- "explain this to me simply"

### As a standalone prompt

Copy the contents of [SKILL.md](SKILL.md) into any LLM conversation. The character and technique work with any model that can follow system prompts.

### Integrated into any LLM

The prompt in SKILL.md is model-agnostic. Use it as a system prompt, a custom instruction, or a chat template in whatever tool you prefer.

## What's in the box

| File | Purpose |
|------|---------|
| [SKILL.md](SKILL.md) | The full skill prompt — Doris's character, the Feynman flow, and all instructions |
| [questions.md](questions.md) | 105 curated questions across 9 domains, each with a Doris-style hint |
| [doris.md](doris.md) | Doris's full character sheet — personality, quirks, key phrases, teaching style |
| [LICENSE](LICENSE) | GPL-3.0 |

## The question bank

105 questions across 9 categories:

- **Computer Science Fundamentals** (15) — hash tables, recursion, Big O, and more
- **Networking & Web** (15) — DNS, REST, CORS, TCP/UDP
- **AI & Machine Learning** (15) — transformers, embeddings, backpropagation
- **Software Engineering** (15) — CI/CD, Docker, technical debt, testing
- **Databases** (10) — SQL vs NoSQL, ACID, sharding, normalization
- **Security** (10) — encryption, XSS, OAuth, JWT
- **Design & UX** (10) — accessibility, design systems, progressive disclosure
- **Licensing & Open Source** (5) — copyleft, MIT vs GPL, public domain
- **3D & Graphics** (10) — shaders, ray tracing, WebGPU, scene graphs

Each question comes with a "Doris hint" — the nudge she'd give you if you're stuck.

## Why GPL-3.0?

Because Feynman would want learning to stay free. The copyleft license ensures that any derivative work keeps the same open spirit. Share knowledge, don't hoard it.

## Credits

Created by **Jonathan Hobman** + **Claude Code**.

Inspired by Richard Feynman's teaching philosophy — the idea that true understanding means being able to explain something simply, without hiding behind jargon or authority.

---

*"I didn't ask what it's called. I asked what it DOES."* — Doris
