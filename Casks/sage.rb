cask "sage" do
  version "0.1.4"
  sha256 "8aa48d837a36950acc14b0a75c85db24601a55e3a4431233faa66383baf9908c"

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
