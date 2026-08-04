cask "sage" do
  version "0.1.1"
  sha256 "4956787a469d46c8f549756f6e97bc4a4068d4b09c1a5fe9b5c61fe03359a711"

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
