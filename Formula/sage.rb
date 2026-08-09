class Sage < Formula
  desc "Local-only LLM usage tracker (API keys + subscriptions)"
  homepage "https://github.com/thedevdavid/sage"
  url "https://github.com/thedevdavid/sage/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "548709365a6865de3a2d5362ff78d6f6962c700c5d9e19a98f9af8c1d702d362"
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
