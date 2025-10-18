local Players = game:GetService("Players")
local plr = Players.LocalPlayer

print(plr.Name .. " is running 3x Speed Auto Farm Script")

local rs = game:GetService("ReplicatedStorage")
local remotes = rs:WaitForChild("RemoteFunctions")

task.delay(2, function()
    pcall(function()
        remotes.ToggleAutoSkip:InvokeServer(true)
        warn("[System] Auto Skip Enabled")
    end)
end)

warn("[System] Loaded 3x Speed Script")
remotes.ChangeTickSpeed:InvokeServer(3)

local difficulty = "dif_impossible"
local placements = {
    {
        time = 27, unit = "unit_lawnmower", slot = "1",
        data = {Valid=true,PathIndex=1,Position=Vector3.new(-335.41595458984375,61.93030548095703,-840.2484130859375),
            DistanceAlongPath=235.51700472831726,
            CF=CFrame.new(-335.41595458984375, 61.93030548095703, -840.2484130859375, -1, 0, -0, -0, 1, -0, -0, 0, -1),
            Rotation=180}
    },
    {
        time = 49, unit = "unit_lawnmower", slot = "1",
        data = {
            Valid = true,
            PathIndex = 1,
            Position = Vector3.new(-335.41595458984375, 61.93030548095703, -840.038330078125),
            DistanceAlongPath = 235.30692172050476,
            Rotation = 180,
            CF = CFrame.new(-335.41595458984375, 61.93030548095703, -840.038330078125, -1, 0, -0, -0, 1, -0, -0, 0, -1)
        }
    },
    {
        time = 68, unit = "unit_lawnmower", slot = "1",
        data = {
            Valid = true,
            PathIndex = 1,
            Position = Vector3.new(-335.41595458984375, 61.93030548095703, -840.1287841796875),
            DistanceAlongPath = 235.39737582206726,
            Rotation = 180,
            CF = CFrame.new(-335.41595458984375, 61.93030548095703, -840.1287841796875, -1, 0, -0, -0, 1, -0, -0, 0, -1)
        }
    },
    {
        time = 89, unit = "unit_lawnmower", slot = "1",
        data = {
            Valid = true,
            PathIndex = 1,
            Position = Vector3.new(-842.3812866210938, 62.18030548095703, -165.13092041015625),
            DistanceAlongPath = 177.42080688476562,
            Rotation = 180,
            CF = CFrame.new(-842.3812866210938, 62.18030548095703, -165.13092041015625, 1, 0, -0, -0, 1, -0, -0, 0, 1)
        }
    },
    {
        time = , unit = "unit_rafflesia", slot = "1",
        data = {
            Valid = true,
            PathIndex = 1,
            Position = Vector3.new(-335.41595458984375, 61.93030548095703, -840.4844360351562),
            DistanceAlongPath = 235.753027677536,
            Rotation = 180,
            CF = CFrame.new(-335.41595458984375, 61.93030548095703, -840.4844360351562, -1, 0, -0, -0, 1, -0, -0, 0, -1)
        }
    }
}

local function placeUnit(unitName, slot, data)
    remotes.PlaceUnit:InvokeServer(unitName, data)
    warn("[Placing] "..unitName.." at "..os.clock())
end

local function startGame()
    remotes.PlaceDifficultyVote:InvokeServer(difficulty)
    for _, p in ipairs(placements) do
        task.delay(p.time, function()
            placeUnit(p.unit, p.slot, p.data)
        end)
    end
end

while true do
    startGame()
    task.wait(128)
    remotes.RestartGame:InvokeServer()
end

loadstring(game:HttpGet("https://pastebin.com/raw/HkAmPckQ"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()





