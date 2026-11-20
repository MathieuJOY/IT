defaults write -g InitialKeyRepeat -int 15 && defaults write -g KeyRepeat -int 2 && defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock persistent-apps -array

apps=(
  "/Applications/Safari.app"
  "/Applications/Google Chrome.app"
  "/System/Applications/System Settings.app"
  "/System/Applications/Utilities/Terminal.app"
)

for app in "${apps[@]}"; do
  [ -e "$app" ] && defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
done

killall Dock
