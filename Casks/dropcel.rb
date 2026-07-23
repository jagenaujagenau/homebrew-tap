cask "dropcel" do
  version "0.1.0"
  sha256 "47e1f5c5234753b4fccfdd2c7103cf8c69e4b803f13bdc951731f938581fce3e"

  url "https://github.com/jagenaujagenau/dropcel/releases/download/v#{version}/Dropcel_#{version}_universal.dmg"
  name "Dropcel"
  desc "Drop a project into a folder. Seconds later, it's live on Vercel."
  homepage "https://github.com/jagenaujagenau/dropcel"

  depends_on macos: ">= :monterey"

  app "Dropcel.app"

  zap trash: [
    "~/Library/Application Support/app.vercelfolder.desktop",
  ]
end
