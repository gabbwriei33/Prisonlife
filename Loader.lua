local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function executeScript(scriptUrl)
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
    if not success then
        warn("Error executing script: " .. tostring(err))
    end
end

if game.PlaceId == 1254185591 then
    executeScript("https://githubusercontent.com")
elseif game.PlaceId == 155615604 then
    executeScript("https://githubusercontent.com")
else
    -- Creating the GUI
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local Frame = Instance.new("Frame", ScreenGui)
    local TextBox = Instance.new("TextBox", Frame)
    local UICorner = Instance.new("UICorner", Frame)

    Frame.Size = UDim2.new(0, 300, 0, 100)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Active = true
    Frame.Draggable = true

    TextBox.Size = UDim2.new(0, 240, 0, 50)
    TextBox.Position = UDim2.new(0.5, -120, 0.5, -25)
    TextBox.PlaceholderText = "Type 'pl' for Prison Life"
    TextBox.TextScaled = true
    TextBox.Parent = Frame

    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local input = TextBox.Text:lower()
            if input == "pl" or input == "prison" then
                ScreenGui:Destroy()
                TeleportService:Teleport(155615604, LocalPlayer)
            end
        end
    end)
end
