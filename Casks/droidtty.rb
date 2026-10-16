cask "droidtty" do
  version "0.5.1"
  sha256 "64b9863bf058be4b6a77d2993f541c425c6abe9f02803fde69b65a6fffedbf16"

  url "https://hzbekorpbjfrpw9z.public.blob.vercel-storage.com/desktop/64b9863bf058/Droidtty-Bridge-#{version}-arm64.dmg"
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
