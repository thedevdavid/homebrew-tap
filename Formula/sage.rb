class Sage < Formula
  desc "Local-only LLM usage tracker (API keys + subscriptions)"
  homepage "https://github.com/thedevdavid/sage"
  url "https://github.com/thedevdavid/sage/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "a4605e6b9b9384940bc6ae8004222670331367766b147c007564d0cf2c9f864d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "cli/bin", "cli/src", "cli/skill", "cli/package.json"
    (bin/"sage").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/bin/sage.js" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sage version")
    assert_match "reset day", shell_output("#{bin}/sage cycle")
  end
end
