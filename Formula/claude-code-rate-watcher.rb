class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.11.1/claude-code-rate-watcher-macos-app.tar.gz"
  sha256 "e6782ba42f4dae16a4d141cdef40523225a23bc1e25f30c74bb9d36ac7a60238"
  version "0.11.1"
  license "MIT"

  depends_on :macos

  def install
    prefix.install "Claude Code Rate Watcher.app"
    bin.write_exec_script prefix/"Claude Code Rate Watcher.app/Contents/MacOS/ccrw"
  end

  def caveats
    <<~EOS
      Claude Code Rate Watcher has been installed as an app bundle.

      To start, run:
        ccrw

      Or open from:
        #{prefix}/Claude Code Rate Watcher.app

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -f ~/Library/LaunchAgents/com.claude-code-rate-watcher.plist
    EOS
  end

  test do
    assert_predicate prefix/"Claude Code Rate Watcher.app", :exist?
  end
end
