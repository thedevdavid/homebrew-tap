class TypesenseServerAT0231 < Formula
  desc "Search Engine; Open Source, Lightning fast, In-Memory, Typo Tolerant"
  homepage "https://typesense.org"
  url "https://dl.typesense.org/releases/0.23.1/typesense-server-0.23.1-darwin-amd64.tar.gz"
  version "0.23.1"
  sha256 "1ef1e55a317a7f157f30bbdba8b52c44b46919d40eb53af22b579bc90d3586ef"
  license "GPL-3.0"

  def install
    bin.install "typesense-server"

    # Create directories
    [data_dir, config_dir, log_dir].each(&:mkpath)

    # Create default config file
    config_file_contents = <<~EOF
      [server]
      api-address = 0.0.0.0
      api-port = 8108
      api-key = xyz
      data-dir = #{data_dir}
      log-dir = #{log_dir}
      enable-cors = true
    EOF
    system "echo '#{config_file_contents}' > #{buildpath/"typesense.ini"}"
    config_dir.install "typesense.ini"
  end

  def caveats
    <<~EOS
      * The default admin API key is xyz
        The default API port is 8108
            You can change these and other configuration by editing #{config_dir/"typesense.ini"}
      * Logs are under: #{log_dir}
      * Data dir is under: #{data_dir}
      * To test that Typesense is running, try
            curl http://localhost:8108/health
    EOS
  end

  service do
    run [bin/"typesense-server", "--config=#{etc/"typesense/typesense.ini"}"]
    keep_alive true
    error_log_path var/"log/typesense.log"
    log_path var/"log/typesense.log"
    working_dir var/"lib/typesense"
  end

  def config_dir
    etc/"typesense"
  end

  def data_dir
    var/"lib/typesense"
  end

  def log_dir
    var/"log/typesense"
  end

  test do
    output = shell_output("#{bin}/typesense-server 2>&1", 1)
    assert_match "Command line usage: ./typesense-server", output
  end
end