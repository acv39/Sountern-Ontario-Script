local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/acv39/RobloxHax/refs/heads/main/UI.lua"))()

local Player = game:GetService("Players").LocalPlayer

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

local Button1 = Sec1:Button({
    Name = "Find Car",
    callback = function(arg)
        print("Finding Vehichle")
        for i, cars in ipairs(workspace.Vehicles.LandVehicles:GetChildren()) do
            print(cars.Name)
		end
    end
})
Window:Initialize() -- DO NOT REMOVE
