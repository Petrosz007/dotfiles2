#!/usr/bin/env fish

# This is needed, so MacOS apps can find things installed with Brew
# https://docs.brew.sh/FAQ#my-mac-apps-dont-find-homebrew-utilities
echo "Adding brew to launchctl with sudo, password may be necessary..."
sudo launchctl config user path (brew --prefix)"/bin:$PATH"
