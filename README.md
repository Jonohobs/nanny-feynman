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

1. **Pick a concept** — choose from the [question bank](skills/nanny-feynman/questions.md) or bring your own
2. **Explain it simply** — pretend you're explaining it to Doris, who is smart but non-technical
3. **Get pressed** — Doris finds the gaps in your explanation and asks follow-up questions
4. **Fill the gaps** — either deepen your explanation or admit what you don't know
5. **Get the verdict** — grudging approval ("You're not as daft as you look") or homework ("Go read about that before I see you next")

## Install

Doris works in most AI apps. Pick yours below. Every option uses one or both of these downloads:

- **[`nanny-feynman.zip`](https://github.com/Jonohobs/nanny-feynman/releases/latest/download/nanny-feynman.zip)**: the skill bundle, for apps that support skills (Claude, ChatGPT, Grok, Antigravity, Claude Code).
- **[`nanny-feynman-prompt.md`](https://github.com/Jonohobs/nanny-feynman/releases/latest/download/nanny-feynman-prompt.md)**: the same instructions as a plain prompt, for custom GPTs, projects and any other chatbot.

Some routes also ask for [`doris.md`](skills/nanny-feynman/doris.md) and [`questions.md`](skills/nanny-feynman/questions.md) from this repo.

Once installed, start a session with "quiz me", "test my understanding", or "explain this to me simply".

### Claude desktop app, claude.ai and mobile

1. Download `nanny-feynman.zip`. Don't unzip it.
2. In **Settings → Capabilities**, make sure **Code execution and file creation** is on. Skills need it.
3. Go to **Customize → Skills**, click **+ → Create skill → Upload a skill**, and pick the zip.
4. Make sure Nanny Feynman is switched on in your skills list.

Claude picks Doris up automatically when you ask to be quizzed.

**Can't use Skills** (for example, your organisation has turned them off)? Use a Project instead: create a project, paste `nanny-feynman-prompt.md` into its instructions, and add `doris.md` and `questions.md` to the project's files.

### ChatGPT (desktop app and web)

**Project (any plan, including Free):**

1. Create a new project.
2. Paste the whole of `nanny-feynman-prompt.md` into the project's instructions.
3. Add `doris.md` and `questions.md` as project files.
4. Start a chat in the project and say "quiz me".

**Custom GPT (Business, Enterprise and Edu workspaces):** on the web, go to **Explore GPTs → Create**. Paste `nanny-feynman-prompt.md` into **Instructions**, upload `doris.md` and `questions.md` under **Knowledge**, and add a conversation starter such as *"Quiz me, Doris"*. Personal accounts (Free, Plus, Pro) can use GPTs but can't create new ones, so use a Project there.

**Skills (Business, Enterprise, Edu and Healthcare workspaces):** open **Plugins → Plugin Directory → Skills → Create → Upload from your computer** and upload `nanny-feynman.zip`. ChatGPT scans new skills before they can be used.

### Grok

**Skills (grok.com, iOS and Android):** go to [grok.com/skills](https://grok.com/skills), create a skill and upload `nanny-feynman.zip`. If the upload isn't accepted, create the skill from scratch and paste in `nanny-feynman-prompt.md`, or ask Grok's Skill Creator to "make a skill from this" with the file attached.

**Projects:** create a project on grok.com, paste `nanny-feynman-prompt.md` into its instructions and add `doris.md` and `questions.md` as files.

> Grok doesn't document which file formats its skill upload accepts yet, so if the zip is refused, the Skill Creator or a Project is the way in.

### Google Antigravity

Antigravity reads skills from folders. Unzip `nanny-feynman.zip` into either:

- `~/.gemini/config/skills/` to have Doris in every workspace, or
- `.agents/skills/` in a project to keep her to that project.

```bash
# macOS / Linux
unzip nanny-feynman.zip -d ~/.gemini/config/skills/
```

```powershell
# Windows PowerShell
Expand-Archive nanny-feynman.zip -DestinationPath $HOME\.gemini\config\skills
```

The agent loads her when you ask to be quizzed, or you can call her directly with `/nanny-feynman`. In the CLI, run `/skills reload` if she doesn't show up straight away.

### Claude Code (CLI and the desktop app's Code tab)

Nanny Feynman is a Claude Code plugin, with this repo as its marketplace. In Claude Code, run:

```
/plugin install nanny-feynman --marketplace Jonohobs/nanny-feynman
```

On Claude Code older than 2.1.275, add the marketplace first:

```
/plugin marketplace add Jonohobs/nanny-feynman
/plugin install nanny-feynman@nanny-feynman
```

Start her with `/nanny-feynman:nanny-feynman`, or just say "quiz me". Updates arrive through `/plugin marketplace update nanny-feynman`.

### Anything else

The prompt is model-agnostic. Paste `nanny-feynman-prompt.md` in as a system prompt, custom instructions or the first message of a chat, in any LLM that follows instructions. Attach `questions.md` too if the app allows files.

## What's in the box

| File | Purpose |
|------|---------|
| [SKILL.md](skills/nanny-feynman/SKILL.md) | The full skill prompt — Doris's character, the Feynman flow, and all instructions |
| [questions.md](skills/nanny-feynman/questions.md) | A starter bank of leading questions for when you don't bring a topic of your own, each with a Doris-style hint |
| [doris.md](skills/nanny-feynman/doris.md) | Doris's full character sheet — personality, quirks, key phrases, teaching style |
| [.claude-plugin/](.claude-plugin) | Claude Code plugin and marketplace manifests |
| [scripts/package.sh](scripts/package.sh) | For developers (macOS/Linux, needs `zip`): builds `dist/nanny-feynman.zip` and `dist/nanny-feynman-prompt.md`. Releases get them automatically. |
| [LICENSE](LICENSE) | Apache 2.0 |

## The question bank

There are some leading questions in [questions.md](skills/nanny-feynman/questions.md) for when you don't bring a topic of your own. They lean toward computer science (because that's what I was learning when I built this) and each comes with the hint Doris would give if you're stuck. Skip it entirely if you'd rather she just generates questions on whatever you're working on.

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
