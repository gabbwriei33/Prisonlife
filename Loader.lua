local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function executeScript(scriptUrl)
    local success, err = pcall(function()
        local code = game:HttpGet(scriptUrl)
        loadstring(code)()
    end)
    if not success then
        warn("Error: " .. tostring(err))
    end
end

if game.PlaceId == 155615604 then
    -- If already in Prison Life, load the main script
    executeScript("https://githubusercontent.com")
else
    -- If not in Prison Life, show the Teleport GUI
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Frame = Instance.new("Frame", ScreenGui)
    local TextBox = Instance.new("TextBox", Frame)
    
    Frame.Size = UDim2.new(0, 250, 0, 100)
    Frame.Position = UDim2.new(0.5, -125, 0.5, -50)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.Active = true
    Frame.Draggable = true

    TextBox.Size = UDim2.new(0, 200, 0, 40)
    TextBox.Position = UDim2.new(0.5, -100, 0.5, -20)
    TextBox.PlaceholderText = "Type 'pl' and press Enter"
    TextBox.Parent = Frame

    TextBox.FocusLost:Connect(function(enter)
        if enter and TextBox.Text:lower() == "pl" then
            TeleportService:Teleport(155615604, LocalPlayer)
        end
    end)
end
