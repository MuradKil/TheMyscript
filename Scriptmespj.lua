-- Создаем GUI для менюшки
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true -- Обрезаем потомков рамки
Frame.Parent = ScreenGui

-- Добавляем скругленные края
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = Frame

local SpeedButton = Instance.new("TextButton")
SpeedButton.Size = UDim2.new(0, 180, 0, 40)
SpeedButton.Position = UDim2.new(0.5, -90, 0.3, -20)
SpeedButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedButton.BorderSizePixel = 2
SpeedButton.Text = "Установить скорость на 100"
SpeedButton.Parent = Frame

local JumpButton = Instance.new("TextButton")
JumpButton.Size = UDim2.new(0, 180, 0, 40)
JumpButton.Position = UDim2.new(0.5, -90, 0.6, -20)
JumpButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
JumpButton.BorderSizePixel = 2
JumpButton.Text = "Установить прыжок на 100"
JumpButton.Parent = Frame

-- Добавляем кнопку "C" для скрытия и отображения основного меню
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 20, 0, 20)
ToggleButton.Position = UDim2.new(0.95, -25, 0.95, -25)
ToggleButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "C"
ToggleButton.Parent = ScreenGui

local speedEnabled = false
local jumpEnabled = false
local menuVisible = true

-- Функция для скрытия и отображения меню
local function toggleMenuVisibility()
    menuVisible = not menuVisible
    Frame.Visible = menuVisible
end

-- Обработчик события нажатия кнопки "Установить скорость на 100"
SpeedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    if speedEnabled then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
        SpeedButton.Text = "Отключить скорость 100"
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Возвращаем обычную скорость
        SpeedButton.Text = "Установить скорость на 100"
    end
end)

-- Обработчик события нажатия кнопки "Установить прыжок на 100"
JumpButton.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    if jumpEnabled then
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = 100
        JumpButton.Text = "Отключить прыжок 100"
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = 7 -- Возвращаем обычную высоту прыжка
        JumpButton.Text = "Установить прыжок на 100"
    end
end)

-- Обработчик события нажатия кнопки "C" для скрытия и отображения основного меню
ToggleButton.MouseButton1Click:Connect(toggleMenuVisibility)
