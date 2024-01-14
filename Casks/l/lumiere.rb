cask "lumiere" do
  version "1.0.1"
  sha256 "d5209a814e542ad409e54b135f13c930eb4f091e1ad5bc83574edd09a3efaeb3"

  url "https://lumiere.pinig.in/files/lumiere-#{version}.dmg"
  name "lumiere"
  desc "Free cinema app designed with Electron"
  homepage "https://lumiere.pinig.in"

  livecheck do
    url "https://lumiere.pinig.in/files/latest-mac.yml"
    strategy :electron_builder
  end

  postflight do
    system_command "codesign",
                    args: ["--force", "--deep", "--sign", "-", File.join(ENV["HOME"], "../../Applications/Lumiere.app")],
                    sudo: false
    system_command "xattr",
                    args: ["-d", "com.apple.quarantine", File.join(ENV["HOME"], "../../Applications/Lumiere.app")],
                    sudo: false
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
