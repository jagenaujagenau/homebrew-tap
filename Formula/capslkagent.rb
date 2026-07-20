# Homebrew formula for capslkagent.
#
# Builds from a pinned git revision rather than GitHub's auto-generated source
# tarball: those tarballs are not byte-stable (their sha256 drifts across CDN
# nodes), which would make `brew install` fail intermittently. A git tag +
# revision is immutable and needs no sha256.
#
# To cut a new version: push a tag, then update `tag` and `revision` below.
#   git rev-parse vX.Y.Z^{commit}
#
# Publish this file in a tap repo named `homebrew-tap`; users then run:
#   brew install jagenaujagenau/tap/capslkagent
class Capslkagent < Formula
  desc "Claude Code agent status indicator using keyboard LEDs"
  homepage "https://github.com/jagenaujagenau/capslkagent"
  url "https://github.com/jagenaujagenau/capslkagent.git",
      tag:      "v0.1.0",
      revision: "caca35024a1ae5f28862642ce0e26672f23267f8"
  version "0.1.0"
  license "MIT"
  head "https://github.com/jagenaujagenau/capslkagent.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  # Homebrew has no uninstall hook, so it can't remove the Claude Code hooks on
  # `brew uninstall`. Remind the user to do it themselves. (Leftover hooks are
  # harmless anyway — they self-guard and no-op once the binary is gone.)
  def caveats
    <<~EOS
      To use as a Claude Code status light, wire up the hooks:
        capslkagent install-hooks

      Before `brew uninstall`, remove them with:
        capslkagent uninstall-hooks
    EOS
  end

  test do
    assert_match "capslkagent", shell_output("#{bin}/capslkagent --help")
    assert_predicate bin/"capslkagent", :exist?
  end
end
