class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.3.2/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "f52c17667043d61879e6846ee79f82de54008990ba52380a3f31ec0be1ed68ca"
  version "0.3.2"
  license "MIT"

  depends_on :macos

  def install
    bin.install "claude-code-rate-watcher"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-code-rate-watcher --version 2>&1", 1)
  end
end
