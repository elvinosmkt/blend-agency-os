#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────────────────────
# BLEND AGENCY OS — Skill Installer v3.0
# Installs 14 squads from github.com/elvinosmkt/blend-agency-os
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/elvinosmkt/blend-agency-os/main/install.sh | bash
#
# Override target:
#   BLEND_SKILLS_TARGET=~/.claude/skills bash install.sh
# ─────────────────────────────────────────────────────────────────────────────

set -euo pipefail

REPO_URL="https://github.com/elvinosmkt/blend-agency-os.git"
REPO_RAW="https://raw.githubusercontent.com/elvinosmkt/blend-agency-os/main"
TMP_DIR=$(mktemp -d)

# Colors
BOLD="\033[1m"; CYAN="\033[36m"; GREEN="\033[32m"; YELLOW="\033[33m"; RESET="\033[0m"

echo ""
echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}${CYAN}║   BLEND AGENCY OS — Skill Installer v3.0                ║${RESET}"
echo -e "${BOLD}${CYAN}║   14 squads · Blend Dev Framework · blend-master         ║${RESET}"
echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════╝${RESET}"
echo ""

# ── Detect target ──────────────────────────────────────────────────────────
detect_target() {
  if [ -d "$HOME/.gemini/antigravity" ]; then
    echo "$HOME/.gemini/antigravity/skills"
  elif [ -d "$HOME/.claude" ]; then
    echo "$HOME/.claude/skills"
  else
    echo "$HOME/.claude/skills"
  fi
}

TARGET="${BLEND_SKILLS_TARGET:-$(detect_target)}"

if [[ "$TARGET" == *"antigravity"* ]]; then
  echo -e "  ${CYAN}Target:${RESET} Antigravity IDE  →  $TARGET"
else
  echo -e "  ${CYAN}Target:${RESET} Claude Code       →  $TARGET"
fi
echo ""

# ── Check dependencies ─────────────────────────────────────────────────────
for cmd in git curl; do
  if ! command -v "$cmd" &>/dev/null; then
    echo -e "  ${YELLOW}⚠ Missing dependency: $cmd — please install it first.${RESET}"
    exit 1
  fi
done

# ── Clone repo ─────────────────────────────────────────────────────────────
echo -e "  ${CYAN}Cloning blend-agency-os...${RESET}"
git clone --depth=1 --quiet "$REPO_URL" "$TMP_DIR/blend-agency-os"
echo -e "  ${GREEN}✓ Repository cloned${RESET}"
echo ""

# ── Install skills ─────────────────────────────────────────────────────────
SKILLS=(
  blend-master
  advisory-board
  brand-squad
  c-level-squad
  copy-master
  cybersecurity
  data-squad
  design-squad
  engineering-squad
  hormozi-squad
  movement
  storytelling
  traffic-masters
  taste-skill
)

mkdir -p "$TARGET"
installed=0
skipped=0

for skill in "${SKILLS[@]}"; do
  src="$TMP_DIR/blend-agency-os/skills/$skill/SKILL.md"

  # Skip deprecated stubs
  if grep -q "DEPRECATED" "$src" 2>/dev/null; then
    echo -e "  ${YELLOW}↷ $skill (deprecated, skipping)${RESET}"
    ((skipped++)) || true
    continue
  fi

  mkdir -p "$TARGET/$skill"
  cp "$src" "$TARGET/$skill/SKILL.md"
  echo -e "  ${GREEN}✓ $skill${RESET}"
  ((installed++)) || true
done

# ── Cleanup ────────────────────────────────────────────────────────────────
rm -rf "$TMP_DIR"

# ── Summary ───────────────────────────────────────────────────────────────
echo ""
echo -e "${BOLD}${GREEN}════════════════════════════════════════════════════════${RESET}"
echo -e "${BOLD}${GREEN}  ✅ $installed skills installed → $TARGET${RESET}"
echo -e "${BOLD}${GREEN}════════════════════════════════════════════════════════${RESET}"
echo ""
echo -e "${BOLD}Squads installed:${RESET}"
echo "  🎯 blend-master       — Central orchestrator (entry point for everything)"
echo "  🏛️  advisory-board     — Ray Dalio, Munger, Naval, Thiel, Hoffman, Sinek..."
echo "  🏔️  brand-squad        — Aaker, Wheeler, Sharp, Neumeier, archetypes, storybrand"
echo "  👔 c-level-squad      — CEO, COO, CMO, CTO, CIO, CAIO"
echo "  ✍️  copy-master        — 33 copywriters + persuasion experts (v2.0)"
echo "  🛡️  cybersecurity      — Pentest, red/blue team, AppSec, incident response"
echo "  📊 data-squad         — Kaushik, Fader, Ellis, Mehta, Spinks, Wes Kao"
echo "  🎭 design-squad       — Brad Frost, Dan Mall, Dave Malouf + specialists"
echo "  🧠 engineering-squad  — Blend Dev Framework: AI Tooling + Dev Lifecycle (Orion)"
echo "  🐝 hormozi-squad      — Grand Slam Offers, leads, CLOSER, retention, scale"
echo "  ✊ movement           — Movement architecture, manifestos, community"
echo "  📖 storytelling       — Campbell, Snyder, Harmon, Duarte, Klaff, Ganz..."
echo "  🎯 traffic-masters    — FB/Google/YouTube ads + 16 media specialists"
echo "  🎨 taste-skill        — Design excellence router (anti-AI-slop)"
echo ""
echo -e "${BOLD}Start with:${RESET} activate ${CYAN}blend-master${RESET} and describe what you need."
echo ""
