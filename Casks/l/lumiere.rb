cask "lumiere" do
  version "0.6.1"
  sha256 "ded2010183a9bf3c7b3fcd3fb564ad580df4787d54ef1277798e0b10c887cdad"

  url "https://github.com/Arounte/lumiere-releases/releases/download/v#{version}/lumiere-#{version}.dmg"
  name "lumiere"
  desc "Free cinema app designed with Electron"
  homepage "https://github.com/Arounte/lumiere-releases"

  livecheck do
    url "https://github.com/Arounte/lumiere-releases/releases/download/v#{version}/latest-mac.yml"
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
