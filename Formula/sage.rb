class Sage < Formula
  desc "Local-only LLM usage tracker (API keys + subscriptions)"
  homepage "https://github.com/thedevdavid/sage"
  url "https://github.com/thedevdavid/sage/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "480b04d38e0a13a96d90747bffe3c05f7e5dc3ca504c8824a2b45812eda8d849"
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
