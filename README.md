# homebrew-tap

Homebrew tap for:

- [capslkagent](https://github.com/jagenaujagenau/capslkagent) — a Claude Code
  agent status indicator that drives your keyboard's Caps Lock LED (or, on Mac
  laptops, the keyboard backlight).
- [gf-tui](https://github.com/jagenaujagenau/gf-tui) — a terminal UI for
  searching Google Flights.
- [netwatch](https://github.com/jagenaujagenau/netwatch) — a terminal explorer
  for the devices on your local network.

## Install

```sh
brew install jagenaujagenau/tap/capslkagent
brew install jagenaujagenau/tap/gf-tui
brew install jagenaujagenau/tap/netwatch
```

Then wire capslkagent into Claude Code:

```sh
capslkagent install-hooks
```
