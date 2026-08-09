class Sage < Formula
  desc "Local-only LLM usage tracker (API keys + subscriptions)"
  homepage "https://github.com/thedevdavid/sage"
  url "https://github.com/thedevdavid/sage/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "42b95019d22ba41283ec731f02cf59cb955b522865a6d6ac1af27e8a1f7ac7f8"
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
