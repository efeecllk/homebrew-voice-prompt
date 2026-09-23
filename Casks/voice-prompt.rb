cask "voice-prompt" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "62de3d773d09af4e7f68207f49ab9e1aa124dcec4befca0e77cc902847657d35",
         intel: "a2bf459572a8998c2d7d46fe6fa0978977742bef3218c6bf8952dfc55e3a95b3"

  url "https://github.com/efeecllk/voice-prompt/releases/download/v#{version}/Voice.Prompt_#{version}_#{arch}.dmg"
  name "Voice Prompt"
  desc "Cross-platform speech-to-text app with English translation"
  homepage "https://github.com/efeecllk/voice-prompt"

  app "Voice Prompt.app"

  caveats <<~EOS
    Voice Prompt requires an OpenAI API key to function.
    Get your API key from: https://platform.openai.com/api-keys

    After installation, click the menu bar icon and go to Settings to enter your API key.
  EOS

  zap trash: [
    "~/Library/Application Support/com.voiceprompt.app",
    "~/Library/Caches/com.voiceprompt.app",
    "~/Library/Preferences/com.voiceprompt.app.plist",
    "~/Library/Saved Application State/com.voiceprompt.app.savedState",
  ]
end
