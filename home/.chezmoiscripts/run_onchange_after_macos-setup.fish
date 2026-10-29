#!/usr/bin/env fish

# This is needed, so MacOS apps can find things installed with Brew
# https://docs.brew.sh/FAQ#my-mac-apps-dont-find-homebrew-utilities

# Update: Seems like MacOS Sequioa broke this
# https://discussions.apple.com/thread/255779464?sortBy=rank
# !: You might need to run this manually
# The script updates this file: /private/var/db/com.apple.xpc.launchd/config/user.plist

# TODO: I've commented it out for now, as it doesn't work
# echo "Adding brew to launchctl with sudo, password may be necessary..."
# sudo launchctl config user path (brew --prefix)"/bin:$PATH"
