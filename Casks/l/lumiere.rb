cask "lumiere" do
  version "1.0.1"
  sha256 "ded8daef6b94048685dc648c5dea891b06b360d4802945b149fc71e939b68eaf"

  url "https://lumiere.pinig.in/files/lumiere-#{version}.dmg"
  name "lumiere"
  desc "Free cinema app designed with Electron"
  homepage "https://lumiere.pinig.in"

  livecheck do
    url "https://lumiere.pinig.in/files/latest-mac.yml"
    strategy :electron_builder
  end

  depends_on macos: ">= :catalina"

  app "Lumiere.app"

  zap trash: [
    "~/Library/Caches/com.lumiere.app",
    "~/Library/Caches/com.lumiere.app.ShipIt",
    "~/Library/Caches/lumiere-updater",
    "~/Library/HTTPStorages/com.lumiere.app",
    "~/Library/Preferences/com.lumiere.app.plist",
    "~/Library/Saved Application State/com.lumiere.app.savedState"
  ]
end
