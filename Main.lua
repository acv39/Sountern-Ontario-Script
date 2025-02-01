local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/acv39/RobloxHax/refs/heads/main/UI.lua"))()
local Player = game:GetService("Players").LocalPlayer
local car = 1
FindCarIdx()
local Window = UILibrary:New({
    Name = "Southern Ontario Car Hax", -- name, Name, title, Title
})
local Page1 = Window:Page({
    Name = "Car Hacks",
})
local Sec1 = Page1:Section({
    Name = "Car Hax",
    Fill = true,
    Side = "Left"
})

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
Window:Initialize() -- DO NOT REMOVE
