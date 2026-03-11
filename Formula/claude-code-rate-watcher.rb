class ClaudeCodeRateWatcher < Formula
  desc "macOS menu bar app to monitor Claude Code API rate limits"
  homepage "https://nicovalentine7.github.io/claude-code-rate-watcher/"
  url "https://github.com/NicoValentine7/claude-code-rate-watcher/releases/download/v0.5.0/claude-code-rate-watcher-macos-universal.tar.gz"
  sha256 "90fa35b1d69a4e40c5c560f810053e899c8d14444e1590e763ca2f9acd5e6ffa"
  version "0.5.0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "ccrw"
    bin.install_symlink "ccrw" => "claude-code-rate-watcher"
  end

  def post_install
    app_path = Pathname.new("/Applications/Claude Code Rate Watcher.app")
    app_path.rmtree if app_path.exist?

    macos_dir = app_path/"Contents/MacOS"
    macos_dir.mkpath

    # Info.plist — LSUIElement hides from Dock
    (app_path/"Contents/Info.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleName</key>
        <string>Claude Code Rate Watcher</string>
        <key>CFBundleDisplayName</key>
        <string>Claude Code Rate Watcher</string>
        <key>CFBundleIdentifier</key>
        <string>com.claude-code-rate-watcher</string>
        <key>CFBundleVersion</key>
        <string>#{version}</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
        <key>CFBundleExecutable</key>
        <string>launcher</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>LSUIElement</key>
        <true/>
      </dict>
      </plist>
    PLIST

    # Launcher script — execs the Homebrew-installed binary
    launcher = macos_dir/"launcher"
    launcher.write <<~SCRIPT
      #!/bin/bash
      exec "#{opt_bin}/ccrw" "$@"
    SCRIPT
    launcher.chmod 0755
  end

  def caveats
    <<~EOS
      To start Claude Code Rate Watcher, run:

        ccrw

      Or launch "Claude Code Rate Watcher" from Applications / Spotlight.

      Launch at Login is enabled automatically on first run.
      You can toggle it off in the popover menu.

      To uninstall completely:
        brew uninstall claude-code-rate-watcher
        rm -rf "/Applications/Claude Code Rate Watcher.app"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccrw --version 2>&1", 1)
  end
end
