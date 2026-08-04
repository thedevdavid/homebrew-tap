class Sage < Formula
  desc "Local-only LLM usage tracker (API keys + subscriptions)"
  homepage "https://github.com/thedevdavid/sage"
  url "https://github.com/thedevdavid/sage/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "a7dbb04bf2b95aec17ff4179d8b0c379d3bcae112427c5f8c3bd0d0a52e18e41"
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
