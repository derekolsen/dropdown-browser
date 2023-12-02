# Dropdown browser for Plasma desktops

Requirements:
- firefox
- X11 (wayland is not supported yet)
- xdotool
- xwininfo

## Installation

Installation is simple but requires a few manual steps. I might be able to streamline this with scripts in the future.

1. Take a look at `dropdown-browser.kwinrule`.
    - (lines 7 & 9) You'll want to adjust the screen width from 2560 to your monitor's.
    - (line 7) Adjust maxsize's height to be your screen height minus any panel height; for example, my top panel is 33px, so 1440-33=1407.
    - (line 13) Similarly, the position height should begin where your panel ends; for example, mine starts at 33.

2. After making any needed changes, import `dropdown-browser.kwinrule` through `System Settings > Window Management > Window Rules > Import`.

2. Create a new firefox profile just for the dropdown browser. Name it `Dropdown` (or anything, really, as long as you edit FIREFOX_PROFILE in `dropdown-browser.sh` to match), and add extensions to it or change settings as you see fit.
```
firefox -ProfileManager
```

4. Copy the `chrome` directory to `~/.mozilla/firefox/XXXXXXXX.Dropdown/`. Note that the profile folder may have a random string prefixing the name. This userChrome.css removes the address bar and other browser chrome and adds a line of pixels at the bottom. You may skip this if you want those things to be visible.

5. Open Firefox once with `firefox -P Dropdown`, go to `about:config`, and enable `toolkit.legacyUserProfileCustomizations.stylesheets`. You can also use this command to open the profile and add any extensions, change settings, et cetera.

6. Edit `URL` in dropdown-browser.sh.

7. Create a Plasma keyboard shortcut to run `dropdown-browser.sh`

## Notes

If you want to have multiple instances, just repeat the steps with a new copy of the `kwinrule` and `dropdown-browser.sh` with a different `CLASS_GUID` and possibly a different Firefox profile.
