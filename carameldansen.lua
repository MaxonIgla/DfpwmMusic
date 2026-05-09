local dfpwm = require("cc.audio.dfpwm")

local speaker = peripheral.find("speaker")
local volume = 0.5


local decoder = dfpwm.make_decoder()
for chunk in io.lines(arg[1], 16 * 1024) do
    local buffer = decoder(chunk)
    if (redstone.getInput("bottom")) then
        volume = 1.5
    end
    while not spk.playAudio(buffer, volume) do
        os.pullEvent("speaker_audio_empty")
    end
end