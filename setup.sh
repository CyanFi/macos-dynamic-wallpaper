#!/bin/bash
var=$USER
launchctl unload -w /Users/$var/Library/LaunchAgents/DynamicWalls.Scheduler.plist
DIR="$(pwd)"
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
	<dict>
		<key>Label</key>
		<string>DynamicWalls.Scheduler</string>
		<key>Program</key>
        	<string>/usr/bin/osascript</string>
        	<key>ProgramArguments</key>
        	<array>
                	<string>osascript</string>
			<string>$DIR/wallpaper.scpt</string>
		</array>
		<key>RunAtLoad</key>
		<true/>
		<key>KeepAlive</key>
		<true/>
		<key>StartInterval</key>
		<integer>10</integer>
	</dict>
</plist>" > /Users/$var/Library/LaunchAgents/DynamicWalls.Scheduler.plist

sleep 2

launchctl load -w /Users/$var/Library/LaunchAgents/DynamicWalls.Scheduler.plist

