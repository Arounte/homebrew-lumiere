cask "lumiere-virgin" do
  version "1.0.0"
  sha256 "906fb465e6719b5ba43f1aee6fc916bf4e57489eb1677b4897cc90fac65cb913"

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
