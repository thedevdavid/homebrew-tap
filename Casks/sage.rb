cask "sage" do
  version "0.1.7"
  sha256 "0f629c95528a934fdf3fa104047367f7dc8b9c2214b67a16faf1f1c0ab037a49"

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
