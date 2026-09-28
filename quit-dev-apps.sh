#!/bin/zsh
# quit-dev-apps.sh – 指定アプリを静かに終了させる

apps=(
  "Cursor"
  "PyCharm"
  "Visual Studio Code"
  "Terminal"        # これもまとめて閉じる
)

# まず AppleScript で "優しく" quit
for app in "${apps[@]}"; do
  /usr/bin/osascript -e "tell application \"${app}\" to quit" 2>/dev/null || true
done

# 10 秒待っても生きているプロセスは強制終了
sleep 10
for app in "${apps[@]}"; do
  /usr/bin/pkill -x "${app}" 2>/dev/null || true
done 
