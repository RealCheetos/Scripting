--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local UserInputService = game:GetService("UserInputService")
local localPlayer = game:GetService("Players").LocalPlayer
local character = localPlayer.Character
local spinabuse = false
local choice = 1
local infmoney = false
local treasure = false
local finalpet
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/dementiaenjoyer/UI-LIBRARIES/refs/heads/main/wally-modified/source.lua')))()
local window = library:CreateWindow('Dig To Earth Core')
window:Section('Stuff')
window:Toggle("Spin Abuse",{},function(value)
spinabuse = value
end)
window:Dropdown("Reward", {
   location = _G;
   flag = "Rewards";
   list = {
       "1";
       "2";
       '3';
       '4';
       '5';
       '6';
       '7';
       '8';
       '9';
       '10';
   }
}, function(new)
   choice = new
end)
window:Toggle("Infinite Money",{},function(value)
infmoney = value
end)

window:Button('Infinite Gems', function()
   game:GetService("ReplicatedStorage").Remotes.UpgradeEvent:FireServer("Strength",-math.huge)
end)
window:Toggle("Best Pet",{},function(value)
finalpet = value
end)

game:GetService("RunService").RenderStepped:Connect(function()
    character = localPlayer.Character
    if spinabuse and choice then
        print(choice)
        game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(tonumber(choice))
    end
    if infmoney then
        game:GetService("ReplicatedStorage").Remotes.DigEvent:FireServer("hello")
    end
    if finalpet then
        game:GetService("ReplicatedStorage").Remotes.PetCageEvent:FireServer("Glimmerfly")
        game:GetService("ReplicatedStorage").PetRemotes.GoldPetCraftEvent:FireServer("Glimmerfly",100)
        game:GetService("ReplicatedStorage").PetRemotes.DiamondPetCraftEvent:FireServer("Gold Glimmerfly",100)
    end
end)
