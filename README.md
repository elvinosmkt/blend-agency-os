# 🎯 Blend Agency OS

> **Sistema operacional de IA da Blend Agency** — 15 squads especializados, 146+ agentes, orquestrados pelo Blend Master.

[![Skills](https://img.shields.io/badge/Skills-15%20squads-blue)](https://github.com/elvinosmkt/blend-agency-os)
[![Agents](https://img.shields.io/badge/Agents-146%2B-green)](https://github.com/elvinosmkt/blend-agency-os)
[![Version](https://img.shields.io/badge/Version-2.0-orange)](https://github.com/elvinosmkt/blend-agency-os)
[![License](https://img.shields.io/badge/License-MIT-lightgrey)](LICENSE)

---

## O que é o Blend Agency OS?

O Blend Agency OS é uma stack completa de agentes de IA organizados em squads especializados, prontos para serem usados com **Claude Code**, **Antigravity IDE** (Google), **Cursor**, **Codex CLI** ou qualquer ambiente compatível com o formato `SKILL.md`.

O **Blend Master** funciona como maestro central — você descreve o que precisa, e ele roteia automaticamente para o squad e agente correto.

---

## 🚀 Instalação Rápida

```bash
# Clone e instale
git clone https://github.com/elvinosmkt/blend-agency-os.git
cd blend-agency-os
bash install.sh
```

Ou diretamente via curl:

```bash
curl -fsSL https://raw.githubusercontent.com/elvinosmkt/blend-agency-os/main/install.sh | bash
```

---

## 🏛️ Squads Disponíveis

| Squad | Agentes | Domínio |
|-------|---------|---------|
| 🎯 blend-master | 1 | Orquestrador central |
| 🏛️ advisory-board | 11 | Estratégia, liderança, investimento |
| 🎨 brand-squad | 15 | Branding, posicionamento, identidade |
| 👔 c-level-squad | 6 | C-suite executivo |
| ✍️ copy-master | 33 | Copywriting, persuasão, conversão |
| 🛡️ cybersecurity | 15 | Pentest, AppSec, blue/red team |
| 📊 data-squad | 7 | Analytics, growth, CLV, comunidade |
| 🎭 design-squad | 8 | Design systems, UX, UI |
| 🐝 hormozi-squad | 16 | Offers, leads, CLOSER, scaling |
| ✊ movement | 7 | Construção de movimentos |
| 📖 storytelling | 12 | Narrative, pitch, screenplay |
| 🎯 traffic-masters | 16 | Tráfego pago, FB/Google/YT |
| 🧠 ai-devtools | 8 | Claude Code, MCP, hooks, swarms |
| 🔧 aiox-workflow | 8 | Agile: analyst→pm→arch→dev→qa |
| 🎨 taste-skill | 1 | Design excellence router |
| **Total** | **~146+** | |

---

## ⚙️ Como Funciona

```
Você descreve o problema
        ↓
  blend-master diagnostica
        ↓
  Roteia para o squad correto
        ↓
  Chief do squad entra em ação
        ↓
  Resultado de nível expert
```

---

## 🔧 Instalação Manual

```bash
# Antigravity
mkdir -p ~/.gemini/antigravity/skills && cp -r skills/* ~/.gemini/antigravity/skills/

# Claude Code
mkdir -p ~/.claude/skills && cp -r skills/* ~/.claude/skills/
```

---

## 📄 Licença

MIT — Blend Agency
