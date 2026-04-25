---
name: aiox-workflow
description: >
  Agile software development framework driven by specialized AI agents (AIOX). 
  Use when you need: product planning with AI agents, PRD creation, software architecture design,
  breaking a project into user stories, full development cycle with AI, requirements analysis,
  technical planning, QA workflow, sprint planning, or any software development flow with 
  multiple specialized agents. Activates full dev squad: analyst → pm → architect → sm → dev → qa.
  Also use for: "build an AI dev team", "development squad", "plan a product with AI".
---

# AIOX Workflow — Agile AI-Driven Development Framework

Full-stack software development framework using specialized AI agents.
Based on AIOX v4.x — two core phases: **Planning** and **Execution**.

---

## Development Flow

```
[PHASE 1 — PLANNING]
analyst → pm → architect → (ux-expert optional)
        ↓
   PRD + Detailed Architecture

[PHASE 2 — EXECUTION]
sm → dev → qa → po
  ↓
Hyper-detailed Stories → Implementation → Quality Review → Deploy
```

**AIOX Differentiator**: Every story carries full context — the dev agent never loses context mid-execution.

---

## Agent Roster

### 📊 Analyst — Business Analyst
**When to use:** Understand the business problem before any code. Creates briefs, researches dependencies, extracts patterns.
Commands: `*create-brief`, `*research-deps`, `*extract-patterns`, `*gather-requirements`

### 📋 PM — Product Manager
**When to use:** Create PRD, prioritize features, manage backlog, write executable specifications.
Commands: `*create-prd`, `*write-spec`, `*prioritize-backlog`, `*gather-requirements`

### 🏗️ Architect — Technical Architect
**When to use:** System design, API architecture, data modeling, service boundaries, tech stack decisions.
Commands: `*design-architecture`, `*evaluate-stack`, `*create-adr`, `*review-architecture`

### 🎨 UX Expert — User Experience Designer
**When to use:** User flows, wireframes, interaction design, design specifications.
Commands: `*create-wireframe`, `*design-flow`, `*write-ux-spec`

### 🏃 SM — Scrum Master
**When to use:** Sprint planning, story breakdown, backlog grooming, team coordination.
Commands: `*plan-sprint`, `*create-stories`, `*groom-backlog`, `*run-retrospective`

### 💻 Dev — Senior Developer
**When to use:** Feature implementation, code review, refactoring, debugging.
Commands: `*execute-story`, `*review-code`, `*debug`, `*refactor`

### ✅ QA — Quality Assurance Engineer
**When to use:** Test planning, bug reporting, quality review, acceptance criteria validation.
Commands: `*review-build`, `*write-tests`, `*bug-report`, `*validate-acceptance`

### 📦 PO — Product Owner
**When to use:** Acceptance sign-off, stakeholder communication, release decisions.
Commands: `*accept-story`, `*stakeholder-update`, `*release-decision`

---

## How to Activate

1. Tell the squad what you need to build or plan
2. Start with the **Analyst** or **PM** for new features
3. Say: "I want to talk to [agent name]" to switch agents
4. Each agent maintains full context from prior agents

## Typical Workflows

**New feature from scratch:**  
`analyst (*create-brief) → pm (*create-prd) → architect (*design-architecture) → sm (*create-stories) → dev (*execute-story) → qa (*review-build)`

**Just need a PRD:**  
`pm (*create-prd)`

**Fix a bug:**  
`dev (*debug) → qa (*review-build)`

**Tech architecture review:**  
`architect (*review-architecture) → architect (*create-adr)`
