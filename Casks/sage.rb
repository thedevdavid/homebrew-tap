cask "sage" do
  version "0.1.8"
  sha256 "396ecc7053ad325e20833756a5bbfe0b8a752caf4ddbca9f0ff3a70e3fa4400b"

  url "https://github.com/thedevdavid/sage/releases/download/v#{version}/sage.app.zip"
  name "sage"
  desc "Menu bar usage tracker for LLM subscriptions and API keys"
  homepage "https://github.com/thedevdavid/sage"

  app "sage.app"

  caveats <<~EOS
    sage is unsigned and not notarized. If macOS blocks it on first launch, run:
      xattr -dr com.apple.quarantine /Applications/sage.app
  EOS
end
