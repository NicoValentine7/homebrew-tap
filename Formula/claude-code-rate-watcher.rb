class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.13.1/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "5f224b4a3cc79d93c09399eeff1be65f71b7909f323310ccaa62fee0dd8338ca"
  version "0.13.1"
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
