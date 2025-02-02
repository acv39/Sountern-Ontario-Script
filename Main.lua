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

local button1 = Sec1:Button{
    Name = "Find Car",
    Callback = function()
        print("Finding Vehichle")
        FindCarIdx()
    end
}
local Slider1 = Sec1:Slider({
    Text = "Horsepower",
    Min = 1,
    Max = 9999,
    Default = 300,
    Callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Horsepower.Value = val
    end
})

local Slider2 = Sec1:Slider({
    Text = "Max RPM",
    Min = 1500,
    Max = 40000,
    Default = 6000,
    Callback = function(val)
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Redline.Value = val
        workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].PeakRPM.Value = val
    end
})

local Toggle1 = Sec1:Toggle({
    Name = "Turbo?",
    callback = function(val)
        print(val)
        if val then
            print("Turbo Magic 1")
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Turbochargers.Value = 1
        else
            print("Turbo Magic 2")
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Turbochargers.Value = 0
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
        print(val)
        if val then
            print("super Magic 1")
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Superchargers.Value = 1
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].S_Sensitivity.Value = 1
        else
            print("super Magic 2")
            workspace.Vehicles.LandVehicles:GetChildren()[car]["A-Chassis Tune"].Superchargers.Value = 0
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

Window:Initialize() -- DO NOT REMOVE
