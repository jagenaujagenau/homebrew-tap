# Homebrew formula for netwatch.
#
# Builds from a pinned git revision rather than GitHub's auto-generated source
# tarball: those tarballs are not byte-stable (their sha256 drifts across CDN
# nodes), which would make `brew install` fail intermittently. A git tag +
# revision is immutable and needs no sha256.
#
# To cut a new version: push a tag, then update `tag` and `revision` below.
#   git rev-parse vX.Y.Z^{commit}
#
# Users install with:
#   brew install jagenaujagenau/tap/netwatch
class Netwatch < Formula
  desc "Terminal explorer for the devices on your local network"
  homepage "https://github.com/jagenaujagenau/netwatch"
  url "https://github.com/jagenaujagenau/netwatch.git",
      tag:      "v0.1.0",
      revision: "28b883e37904fea8022d09f70242295058c68bca"
  version "0.1.0"
  license "MIT"
  head "https://github.com/jagenaujagenau/netwatch.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      netwatch needs no root. If only a few devices show up and none answer
      ping, mDNS or SSDP, allow netwatch to reach your local network in your
      firewall (e.g. Little Snitch) or under System Settings › Privacy &
      Security › Local Network.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/netwatch --version")
    assert_match "--no-active-scan", shell_output("#{bin}/netwatch --help")
  end
end
