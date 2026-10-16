# homebrew-tap

Homebrew tap for:

- [capslkagent](https://github.com/jagenaujagenau/capslkagent) — a Claude Code
  agent status indicator that drives your keyboard's Caps Lock LED (or, on Mac
  laptops, the keyboard backlight).
- [gf-tui](https://github.com/jagenaujagenau/gf-tui) — a terminal UI for
  searching Google Flights.
- [netwatch](https://github.com/jagenaujagenau/netwatch) — a terminal explorer
  for the devices on your local network.
- [Droidtty Bridge](https://droidtty.com) — the desktop app that pairs your phone
  with Herdr so you can approve, answer and steer coding agents from it (cask).

## Install

```sh
brew install jagenaujagenau/tap/capslkagent
brew install jagenaujagenau/tap/gf-tui
brew install jagenaujagenau/tap/netwatch
brew install --cask jagenaujagenau/tap/droidtty
```

Then wire capslkagent into Claude Code:

```sh
capslkagent install-hooks
```
