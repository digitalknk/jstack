#!/bin/sh
set -u

root="${1:-.}"
found=0

search() {
  label="$1"
  pattern="$2"
  hits=$(grep -rniE "$pattern" "$root" \
    --include='*.css' --include='*.scss' --include='*.html' --include='*.astro' \
    --include='*.svelte' --include='*.vue' --include='*.jsx' --include='*.tsx' \
    --include='*.js' --include='*.ts' --include='*.mdx' \
    --include='*.mjs' --include='*.cjs' --include='*.json' \
    --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist \
    --exclude-dir=build --exclude-dir=.next --exclude-dir=.astro 2>/dev/null)
  if [ -n "$hits" ]; then
    found=1
    printf '\n== %s\n%s\n' "$label" "$hits"
  fi
}

search "Banned fonts" "instrument[ _-]?serif|space[ _-]?grotesk"
search "Pills (check each is a true circle, not a capsule)" "rounded-full|border-radius: *(9999|999|50vh|100vh)"
search "One-sided colored borders" "border-(left|l|s|inline-start)(-[0-9]+)? |border-(left|inline-start): *[0-9.]+(px|rem) +solid"
search "Uppercase (check for added letter-spacing)" "text-transform: *uppercase|[\"' ]uppercase[\"' ]"
search "Letter-spacing" "letter-spacing: *[0-9.]+(em|px|rem)|tracking-(wide|wider|widest)"
search "Gradients (each needs a stated reason, no text on top)" "linear-gradient|radial-gradient|conic-gradient|bg-gradient-|bg-radial|bg-conic"
search "Shaders and canvas (one per view, still under reduced motion, fallback)" "@paper-design/shaders|<canvas|getContext\\(['\"]webgl|from ['\"]three['\"]|ShaderMaterial"
search "Heavy weights (remove any that size, color, or spacing could replace)" "font-weight: *(bold|bolder|[6-9]00)|font-(semibold|bold|extrabold|black)"
sizes=$(grep -rohE "font-size: *[0-9.]+(px|rem|em)|text-(xs|sm|base|lg|xl|[2-9]xl)\b" "$root" \
  --include='*.css' --include='*.scss' --include='*.html' --include='*.astro' \
  --include='*.svelte' --include='*.vue' --include='*.jsx' --include='*.tsx' \
  --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=dist \
  --exclude-dir=build --exclude-dir=.next --exclude-dir=.astro 2>/dev/null | sed 's/: */:/' | sort | uniq -c | sort -rn)
count=$(printf '%s' "$sizes" | grep -c . || true)
if [ "$count" -gt 3 ]; then
  found=1
  printf '\n== Font sizes: %s distinct, keep three (uses, value)\n%s\n' "$count" "$sizes"
fi

if [ "$found" -eq 0 ]; then
  echo "No flagged patterns found."
fi
