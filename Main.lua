local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/acv39/RobloxHax/refs/heads/main/UI.lua"))()
local Player = game:GetService("Players").LocalPlayer
local car = 1
function FindCarIdx()
    for i, cars in ipairs(workspace.Vehicles.LandVehicles:GetChildren()) do
        print(cars.Name)
        if cars.FundamentalInfo.FormalOwner.Value == Player.Name then
            print("Found It")
            car = i
            break
        else
            print("Not Found, Continuing")
        end
    end
end


local Window = UILibrary:New({
    Name = "Southern Ontario Car Hax", -- name, Name, title, Title
})
local Page1 = Window:Page({
    Name = "Car Hacks",
})

--Section 1
local Sec1 = Page1:Section({
    Name = "Car Hax",
    Fill = true,
    Side = "Left"
})

local Button1 = Sec1:Button({
    Name = "Find Car",
    callback = function(arg)
        print("Finding Vehichle")
        FindCarIdx()
    end
})
local Slider1 = Sec1:Slider({
    Name = "Horsepower",
    Min = 1,
    Max = 9999,
    Default = 300,
    Suffix = "HP",
    callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Horsepower.Value = val
    end
})

local Slider2 = Sec1:Slider({
    Name = "Max RPM",
    Min = 1500,
    Max = 25000,
    Default = 6000,
    Suffix = "RPM",
    callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Redline.Value = val
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].PeakRPM.Value = val
    end
})

local Toggle1 = Sec1:Toggle({
    Name = "Turbo?",
    callback = function(val)
        if val == true then
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].TurboChargers = 1
        else
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].TurboChargers = 0
        end
    end
})
local Slider3 = Sec1:Slider({
    Name = "Turbo Boost",
    decimals = 0.1,
    Min = 1,
    Max = 420,
    Default = 6,
    Suffix = "PSI",
    callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].T_Boost.Value = val
    end
})

local Toggle2 = Sec1:Toggle({
    Name = "SuperCharger?",
    callback = function(val)
        if val == true then
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Superchargers = 1
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].S_Sensitivity = 1
        else
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Superchargers = 0
        end
    end
})
local Slider4 = Sec1:Slider({
    Name = "Supercharger Boost",
    decimals = 0.1,
    Min = 1,
    Max = 420,
    Default = 6,
    Suffix = "PSI",
    callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].S_Boost.Value = val
    end
})

--Section 2
local LiveRPMs = false

local Sec2 = Page1:Section({
    Name = "Live RPM",
    Fill = true,
    Side = "Right"
})

local Toggle3 = Sec2:Toggle({
    Name = "LiveRPM Roggle",
    callback = function(val)
        LiveRPMs = val
    end
})

local Label1 = Sec2:Label({
    Name = "RPM =",
    Center = true
})
local RunService = game:GetService("RunService")

RunService.Heartbeat:Connect(function()
    if LiveRPMs then
        Label1.Name = "RPM = " .. workspace.Vehicles.LandVehicles:GetChildren()[car].LiveRPM.Value
    end
end)
Window:Initialize() -- DO NOT REMOVE
