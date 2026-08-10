cask "sage" do
  version "0.1.6"
  sha256 "d1150d1852ee76345caac2f20b493218ec17090f0dd4f54cce2a888cabaec6d1"

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
