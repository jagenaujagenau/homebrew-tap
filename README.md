# homebrew-tap

Homebrew tap for:

- [capslkagent](https://github.com/jagenaujagenau/capslkagent) — a Claude Code
  agent status indicator that drives your keyboard's Caps Lock LED (or, on Mac
  laptops, the keyboard backlight).
- [gf-tui](https://github.com/jagenaujagenau/gf-tui) — a terminal UI for
  searching Google Flights.

## Install

```sh
brew install jagenaujagenau/tap/capslkagent
brew install jagenaujagenau/tap/gf-tui
```

Then wire capslkagent into Claude Code:

```sh
capslkagent install-hooks
```
