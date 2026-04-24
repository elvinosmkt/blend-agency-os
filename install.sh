#!/usr/bin/env bash
# Blend Agency OS — Installer
# Usage: bash install.sh
#        curl -fsSL https://raw.githubusercontent.com/elvinosmkt/blend-agency-os/main/install.sh | bash
set -euo pipefail
GREEN='\033[0;32m'; CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'
ok()   { echo -e "${GREEN}✅ $*${RESET}"; }
info() { echo -e "${CYAN}ℹ  $*${RESET}"; }
echo ""
echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════${RESET}"
echo -e "${BOLD}${CYAN}   Blend Agency OS — Installer                          ${RESET}"
echo -e "${BOLD}${CYAN}   15 squads • 146+ agents • rebuilt from source        ${RESET}"
echo -e "${BOLD}${CYAN}════════════════════════════════════════════════════════${RESET}"
echo ""
if [ -d "$HOME/.gemini/antigravity" ]; then TARGET="$HOME/.gemini/antigravity/skills"
else TARGET="$HOME/.claude/skills"; fi
TARGET="${BLEND_SKILLS_TARGET:-$TARGET}"
mkdir -p "$TARGET"
info "Installing to: $TARGET"
echo ""
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo .)"
if [ -d "$SCRIPT_DIR/skills" ]; then
  for skill_dir in "$SCRIPT_DIR/skills/"/*/; do
    skill=$(basename "$skill_dir")
    mkdir -p "$TARGET/$skill"
    cp "$skill_dir/SKILL.md" "$TARGET/$skill/SKILL.md"
    ok "$skill"
  done
else
  REPO="https://raw.githubusercontent.com/elvinosmkt/blend-agency-os/main"
  SKILLS="blend-master advisory-board brand-squad c-level-squad copy-master cybersecurity data-squad design-squad hormozi-squad movement storytelling traffic-masters ai-devtools aiox-workflow taste-skill"
  for skill in $SKILLS; do
    mkdir -p "$TARGET/$skill"
    curl -fsSL "$REPO/skills/$skill/SKILL.md" > "$TARGET/$skill/SKILL.md"
    ok "$skill"
  done
fi
echo ""
INSTALLED=$(ls "$TARGET" | wc -l | tr -d ' ')
echo -e "${BOLD}${GREEN}✅ Done! $INSTALLED skills installed at: $TARGET${RESET}"
echo ""
echo -e "Start with: activate ${CYAN}blend-master${RESET} and describe what you need."
echo ""
