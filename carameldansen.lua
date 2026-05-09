local dfpwm = require("cc.audio.dfpwm")

local speaker = peripheral.find("speaker")
local volume = 0.7


local decoder = dfpwm.make_decoder()
for chunk in io.lines(arg[1], 1 * 1024 / 2) do
    local buffer = decoder(chunk)
    if (redstone.getInput("bottom")) then
        volume = 2.6
    else
        volume = 0.7
    end
    while not spk.playAudio(buffer, volume) do
        os.pullEvent("speaker_audio_empty")
    end
end
