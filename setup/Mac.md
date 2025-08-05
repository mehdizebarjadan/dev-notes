  
## Here is the code for the dock. Paste it into your terminal:

defaults write com.apple.dock autohide-delay -int 0 defaults write com.apple.dock autohide-time-modifier -float 0.45 killall Dock

## and if you want to restore the default speed: 

defaults delete com.apple.dock autohide-delay defaults delete com.apple.dock autohide-time-modifier killall Dock