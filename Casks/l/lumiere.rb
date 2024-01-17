cask "lumiere" do
  version "0.5.1"
  sha256 "0daf1006b218cdf1390b02247e4b8ee01b9f3455e97210ec565c510202c48f48"

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
