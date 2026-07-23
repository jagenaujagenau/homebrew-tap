# Homebrew formula for gf-tui.
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
#   brew install jagenaujagenau/tap/gf-tui
class GfTui < Formula
  desc "Terminal UI for searching Google Flights"
  homepage "https://github.com/jagenaujagenau/gf-tui"
  url "https://github.com/jagenaujagenau/gf-tui.git",
      tag:      "v1.0.0",
      revision: "cedebf2e9821cc6ddb844426d5c2bd55e3fb3eda"
  version "1.0.0"
  license "MIT"
  head "https://github.com/jagenaujagenau/gf-tui.git", branch: "main"

  depends_on "bun"

  def install
    libexec.install Dir["*"]
    cd libexec do
      system "bun", "install", "--production"
    end

    (bin/"gf-tui").write <<~EOS
      #!/bin/bash
      exec "#{formula_opt_bin("bun")}/bun" run "#{libexec}/src/index.ts" "$@"
    EOS
    chmod 0755, bin/"gf-tui"
  end

  test do
    assert_path_exists bin/"gf-tui"
    assert_predicate bin/"gf-tui", :executable?
  end
end
