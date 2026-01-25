cask "voice-prompt" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "e9761133ea8e46a562b14efe33f04bd1af5797d1690d3aee16f1145c975280e2",
         intel: "5139cfda788e3c69fa2e31a293117b3ccc6b966313d786af8a9f976c817ca642"

  url "https://github.com/efeecllk/voice-prompt/releases/download/v#{version}/Voice.Prompt_#{version}_#{arch}.dmg"
  name "Voice Prompt"
  desc "Lightweight macOS menu bar app for speech-to-text translation"
  homepage "https://github.com/efeecllk/voice-prompt"

  depends_on macos: ">= :catalina"

  app "Voice Prompt.app"

  postflight do
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
