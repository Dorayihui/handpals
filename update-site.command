#!/bin/bash
# Double-click me after a new build to update https://dorayihui.github.io/handpals/
cd "$(dirname "$0")" || exit 1
NEW=$(ls -t ../handpals-*.html 2>/dev/null | head -1)
[ -z "$NEW" ] && { echo "No handpals-*.html found next to this folder."; read -p "Press Enter"; exit 1; }
echo "Publishing $(basename "$NEW") ..."
cp "$NEW" index.html
git add -A
git commit -m "Update site to $(basename "$NEW")" || { echo "Nothing changed."; read -p "Press Enter"; exit 0; }
git push origin main && echo && echo "Done. Live in about a minute at https://dorayihui.github.io/handpals/"
read -p "Press Enter to close"
