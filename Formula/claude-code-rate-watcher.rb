class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code and Codex rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.13.6/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "aa8672349bfb34577a2e14c3a1ec4838f69db6c5d36b8bafb11dc519e996fbd9"
  license "MIT"

  depends_on :macos

  def install
    bin.install "ccrw"
  end

  def caveats
    <<~EOS
      To start, run:
        ccrw

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -f ~/Library/LaunchAgents/com.claude-code-rate-watcher.plist
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccrw --version")
  end
end
