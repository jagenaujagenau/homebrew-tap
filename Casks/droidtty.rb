cask "droidtty" do
  version "0.6.0"
  sha256 "6b0c2e967ff79e127d4b2776ee77a876dfa5c9384f559f62a594ff0adfb31276"

  url "https://hzbekorpbjfrpw9z.public.blob.vercel-storage.com/desktop/6b0c2e967ff7/Droidtty-Bridge-#{version}-arm64.dmg"
  name "Droidtty Bridge"
  desc "Pair your phone with Herdr to approve, answer and steer coding agents"
  homepage "https://droidtty.com"

  livecheck do
    url "https://hzbekorpbjfrpw9z.public.blob.vercel-storage.com/desktop/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Droidtty Bridge.app"

  uninstall quit: "dev.droidtty.bridge"

  # Pairings and settings live in ~/.config/droidtty, shared with droidtty-cli: kept on purpose.
  zap trash: [
    "~/Library/LaunchAgents/Droidtty Bridge.plist",
    "~/Library/Caches/dev.droidtty.bridge",
    "~/Library/Preferences/dev.droidtty.bridge.plist",
    "~/Library/WebKit/dev.droidtty.bridge",
  ]
end
