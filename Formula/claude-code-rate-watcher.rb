class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.4.0/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "059feb5bf2d5c34e5aaccc20f5a3ecca345141d124b001301ab4725178803fe8"
  version "0.4.0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "ccrw"
    bin.install_symlink "ccrw" => "claude-code-rate-watcher"
  end

  def caveats
    <<~EOS
      To start Claude Code Rate Watcher, run:

        ccrw

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccrw --version 2>&1", 1)
  end
end
