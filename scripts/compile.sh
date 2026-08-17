#!/usr/bin/env bash
# Збирає персону з корпусу → .claude/output-styles/bydlo.md
# Запуск: bash scripts/compile.sh
set -euo pipefail
cd "$(dirname "$0")/.."

OUT=".claude/output-styles/bydlo.md"
mkdir -p "$(dirname "$OUT")"

{
  printf -- '---\n'
  printf 'name: bydlo\n'
  printf 'description: Персональний бидло-персонаж nasytnyk (покейсово, тогл-онлі, лише в цій лабі).\n'
  printf -- '---\n\n'

  cat build/persona-head.md
  printf '\n\n---\n\n# КОРПУС\n\n'

  printf '## profile/nasytnyk.md\n\n';      cat profile/nasytnyk.md;      printf '\n\n'
  printf '## lexicon/units.md\n\n';         cat lexicon/units.md;         printf '\n\n'
  printf '## constructs/patterns.md\n\n';   cat constructs/patterns.md;   printf '\n\n'
  printf '## situations/map.md\n\n';        cat situations/map.md;        printf '\n\n'
} > "$OUT"

echo "Скомпільовано → $OUT"
