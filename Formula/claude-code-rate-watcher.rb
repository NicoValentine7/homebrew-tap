class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code and Codex rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.13.3/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "42e3ddfd77835417e3018ad06e15e7ab95ee5a479208da5ca1102850e78723ff"
  version "0.13.3"
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
