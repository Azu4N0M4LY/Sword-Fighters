local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("ExeHub", 5013109572)

getgenv().AutoFarm = False
getgenv().EquipBest = False
getgenv().BestPet = False

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait("0."..math.random(1,9))
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "This script have antiafk executing!";
    Font = Enum.Font.Cartoon;
    Color = BrickColor.new("Bright blue").Color;
    FontSize = Enum.FontSize.Size96;    
})

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}


-- local players = {
--     "by_shadon",
--     "lBlackD",
--     "Naiara0615",
--     "Seakui",
--     "XxNotStar_x0",
--     "Elmanuelsupremo20",
--     "TULOVITO7W7BB",
--     "JustAlexNoBody"
-- }

-- if players then
--     for i = 1, #players do
--         local player = game.Players:FindFirstChild(players[i])
--         if player then
--             game.StarterGui:SetCore("ChatMakeSystemMessage", {
--                 Text = "Banned";
--                 Font = Enum.Font.Cartoon;
--                 Color = BrickColor.new("Bright blue").Color;
--                 FontSize = Enum.FontSize.Size96;    
--             })
--             game.StarterGui:SetCore("ChatMakeSystemMessage", {
--                 Text = "Gay";
--                 Font = Enum.Font.Cartoon;
--                 Color = BrickColor.new("Bright blue").Color;
--                 FontSize = Enum.FontSize.Size96;    
--             })
--             game.StarterGui:SetCore("ChatMakeSystemMessage", {
--                 Text = "Go play adopt me newbie";
--                 Font = Enum.Font.Cartoon;
--                 Color = BrickColor.new("Bright blue").Color;
--                 FontSize = Enum.FontSize.Size96;    
--             })
--             wait(5)
--             game:GetService("TeleportService"):Teleport(920587237)
--         end
--     end
-- end






local page = venyx:addPage("Main", 5012544693)
local section1 = page:addSection("Credits")
section1:addButton("Discord", function()
    print("Discord Copied")
    setclipboard("Invite Soon")
end)

local page = venyx:addPage("Farm")
local section2 = page:addSection("Farm")
section2:addToggle("AutoFarm", nil, function(bool)
    getgenv().AutoFarm = bool
    if bool then
        AutoFarm()
    end
end)


local page = venyx:addPage("Misc")
local section3 = page:addSection("Misc")
section3:addToggle("Equip Best Sword", nil, function(bool)
    getgenv().EquipBest = bool
    if bool then
        EquipBest()
    end
end)

section3:addToggle("Equip Best Pet", nil, function(bool)
    getgenv().BestPet = bool
    if bool then
        BestPet()
    end
end)

section3:addButton("Server Hop", function()
    ServerHop()
end)

local page = venyx:addPage("Teleports")
local section4 = page:addSection("Teleports")
section4:addButton("Teleport Dungeon", function()
    TeleportDungeon()
end)

function AutoFarm() 
    spawn(function()
        while getgenv().AutoFarm == true do
            local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click
            Event:InvokeServer()
        end
    end)
end

function EquipBest()
    spawn(function()
        while getgenv().AutoFarm == true do
            local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.WeaponInvService.RF.EquipBest
            Event:InvokeServer()
        end
    end)
end

function BestPet()
    spawn(function()
        while getgenv().BestPet == true do
            local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.PetInvService.RF.EquipBest
            Event:InvokeServer()
        end
    end)
end

function Egg1()
    spawn(function()
        while getgenv().Egg1Hatch == true do
            local A_1 = 
            {
                ["eggName"] = "Egg 1", 
                ["auto"] = false, 
                ["amount"] = 1
            }
            local Event = game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.BuyEgg
            Event:InvokeServer(A_1)
        end
    end)
end


function TeleportDungeon()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2837.72314453125, -2.1029701232910156, -130.1952667236328)
end

function ServerHop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport()
