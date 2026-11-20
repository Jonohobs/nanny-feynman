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
- **Doris Margaret Jennifer Janet Feynman** (nee Crowhurst) — the fictional retired schoolteacher who brings the method to life

## How it works

1. **Pick a concept** — choose from the [question bank](questions.md) or bring your own
2. **Explain it simply** — pretend you're explaining it to Doris, who is smart but non-technical
3. **Get pressed** — Doris finds the gaps in your explanation and asks follow-up questions
4. **Fill the gaps** — either deepen your explanation or admit what you don't know
5. **Get the verdict** — grudging approval ("You're not as daft as you look") or homework ("Go read about that before I see you next")

## Install

Doris works in most AI apps. Pick yours below. Every option uses the same two downloads, which are attached to each [release](https://github.com/Jonohobs/nanny-feynman/releases):

- **`nanny-feynman.zip`**: the skill bundle, for apps that support skills (Claude, ChatGPT, Grok, Antigravity, Claude Code).
- **`nanny-feynman-prompt.md`**: the same instructions as a plain prompt, for custom GPTs, projects and any other chatbot.

No release yet, or want the latest? Run `scripts/package.sh` and both files appear in `dist/`.

Once installed, start a session with "quiz me", "test my understanding", or "explain this to me simply".

### Claude desktop app, claude.ai and mobile

Skills need code execution and file creation switched on, in the same Capabilities settings page.

1. Download `nanny-feynman.zip`. Don't unzip it.
2. In Claude, open **Settings → Capabilities**, find **Skills**, and choose **Upload skill**.
3. Pick the zip. Nanny Feynman appears in your skills list. Make sure it's switched on.

It syncs to the desktop app, web and mobile. Claude picks Doris up automatically when you ask to be quizzed.

**No Skills option on your plan?** Use a Project instead: create a project, paste `nanny-feynman-prompt.md` into **Project instructions**, and add `doris.md` and `questions.md` to the project's files.

### ChatGPT (desktop app and web)

**Custom GPT (Plus, Pro, Business and up):**

1. Go to **Explore GPTs → Create → Configure**.
2. Name it *Nanny Feynman*. Paste the whole of `nanny-feynman-prompt.md` into **Instructions** (it fits under the 8,000 character limit).
3. Under **Knowledge**, upload `doris.md` and `questions.md`.
4. Add a conversation starter such as *"Quiz me, Doris"*, then **Create**.

The GPT shows up in the ChatGPT desktop app's sidebar as well as on the web.

**Skills (Business, Enterprise and Edu workspaces):** open **Plugins → Plugin Directory → Skills → Create → Upload from your computer**, upload `nanny-feynman.zip`, then **Install**. ChatGPT scans new skills before they can be used.

**Any plan, quickest:** a ChatGPT **Project** with `nanny-feynman-prompt.md` as its instructions and the two `.md` files added works too.

### Grok

**Skills (grok.com, iOS and Android):** go to [grok.com/skills](https://grok.com/skills), create a skill and upload `nanny-feynman.zip`. If the upload isn't accepted, create the skill from scratch and paste in `nanny-feynman-prompt.md`, or ask Grok's Skill Creator to "make a skill from this" with the file attached.

**Projects:** create a project on grok.com, paste `nanny-feynman-prompt.md` into its instructions and add `doris.md` and `questions.md` as files.

> Grok's skill upload format isn't documented yet, so the Projects route is the reliable one.

### Google Antigravity

Antigravity reads skills from folders. Unzip `nanny-feynman.zip` into either:

- `~/.gemini/config/skills/` to have Doris in every workspace, or
- `.agents/skills/` in a project to keep her to that project.

```bash
unzip nanny-feynman.zip -d ~/.gemini/config/skills/
```

The agent loads her when you ask to be quizzed, or you can call her directly with `/nanny-feynman`. In the CLI, run `/skills reload` if she doesn't show up straight away.

### Claude Code (CLI)

```bash
mkdir -p ~/.claude/skills
unzip nanny-feynman.zip -d ~/.claude/skills/
```

Or, from a clone of this repo: `mkdir -p ~/.claude/skills/nanny-feynman && cp SKILL.md doris.md questions.md ~/.claude/skills/nanny-feynman/`.

Start her with `/nanny-feynman`, or just say "quiz me".

### Anything else

The prompt is model-agnostic. Paste `nanny-feynman-prompt.md` in as a system prompt, custom instructions or the first message of a chat, in any LLM that follows instructions. Attach `questions.md` too if the app allows files.

## What's in the box

| File | Purpose |
|------|---------|
| [SKILL.md](SKILL.md) | The full skill prompt — Doris's character, the Feynman flow, and all instructions |
| [questions.md](questions.md) | A starter bank of leading questions for when you don't bring a topic of your own, each with a Doris-style hint |
| [doris.md](doris.md) | Doris's full character sheet — personality, quirks, key phrases, teaching style |
| [scripts/package.sh](scripts/package.sh) | Builds `dist/nanny-feynman.zip` and `dist/nanny-feynman-prompt.md` for the apps above |
| [LICENSE](LICENSE) | Apache 2.0 |

## The question bank

There are some leading questions in [questions.md](questions.md) for when you don't bring a topic of your own. They lean toward computer science (because that's what I was learning when I built this) and each comes with the hint Doris would give if you're stuck. Skip it entirely if you'd rather she just generates questions on whatever you're working on.

### What's in Doris's notebook

- **Computer Science Fundamentals** — hash tables, recursion, Big O
- **Networking & Web** — DNS, REST, CORS, TCP/UDP
- **AI & Machine Learning** — transformers, embeddings, backpropagation
- **Software Engineering** — CI/CD, Docker, technical debt, testing
- **Databases** — SQL vs NoSQL, ACID, sharding, normalization
- **Security** — encryption, XSS, OAuth, JWT
- **Design & UX** — accessibility, design systems, progressive disclosure
- **Licensing & Open Source** — copyleft, MIT vs GPL, public domain
- **3D & Graphics** — shaders, ray tracing, WebGPU, scene graphs

## License

Apache 2.0. Use it, fork it, embed it, sell it — same permissive spirit as before, now with an explicit patent grant so anyone adopting Doris is covered. The lesson is the point, and the more places she turns up, the better. (See [ORIGIN.md](ORIGIN.md) for the licensing journey: GPL-3.0 → MIT → Apache 2.0.)

## Credits

Created by **Jonathan Hobman** + **Claude Code**.

Inspired by Richard Feynman's teaching philosophy — the idea that true understanding means being able to explain something simply, without hiding behind jargon or authority.

---

*"I didn't ask what it's called. I asked what it DOES."* — Doris
