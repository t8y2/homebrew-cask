cask "dbx" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.10"
  sha256 arm:   "9aecc1f25c8b480346ae5eec37a891608ae1ac5364643140e3a714a228c404b3",
         intel: "a5e1e0aecd3472ad19e3e947516bdd004dfcf7aff8cd484efd28589c6d336f27"

  url "https://github.com/t8y2/dbx/releases/download/v#{version}/DBX_#{arch}.app.tar.gz",
      verified: "github.com/t8y2/dbx/"
  name "DBX"
  desc "Lightweight cross-platform database client"
  homepage "https://dbxio.com/"

  livecheck do
    url "https://api.github.com/repos/t8y2/dbx/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  depends_on :macos

  app "DBX.app"

  zap trash: [
    "~/Library/Application Support/com.dbx.app",
    "~/Library/Caches/com.dbx.app",
    "~/Library/HTTPStorages/com.dbx.app",
    "~/Library/Preferences/com.dbx.app.plist",
    "~/Library/Saved Application State/com.dbx.app.savedState",
    "~/Library/WebKit/com.dbx.app",
  ]
end
