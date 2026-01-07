cask "voice-prompt" do
  version "0.1.1"
  sha256 "97c2462930b8488600ea41ed914b50b0e0190ec561e64e56053a2de779e6c862"

  url "https://github.com/efeecllk/voice-prompt/releases/download/v#{version}/Voice.Prompt_#{version}_aarch64.dmg"
  name "Voice Prompt"
  desc "Lightweight macOS menu bar app for speech-to-text translation"
  homepage "https://github.com/efeecllk/voice-prompt"

  depends_on macos: ">= :catalina"
  depends_on arch: :arm64

  app "Voice Prompt.app"

  postflight do
    # Remove quarantine attribute to allow running unsigned app
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Voice Prompt.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.voiceprompt.app",
    "~/Library/Caches/com.voiceprompt.app",
    "~/Library/Preferences/com.voiceprompt.app.plist",
    "~/Library/Saved Application State/com.voiceprompt.app.savedState",
  ]

  caveats <<~EOS
    Voice Prompt requires an OpenAI API key to function.
    Get your API key from: https://platform.openai.com/api-keys
    
    After installation, click the menu bar icon and go to Settings to enter your API key.
  EOS
end
