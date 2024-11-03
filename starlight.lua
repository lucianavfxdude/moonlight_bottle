loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local TweenService = game:GetService("TweenService")
local Wc = game:GetService("Workspace")
local StarJug = LoadCustomInstance("https://github.com/lucianavfxdude/moonlight_bottle/blob/main/star.rbxm?raw=true")
StarJug.ToolModule:Destroy()

local speedTweenValue = Instance.new("NumberValue", StarJug)

local durability = 4
local debounce = false
StarJug:SetAttribute("Durability", durability)

StarJug.Parent = game.Players.LocalPlayer.Backpack

local character = game.Players.LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")

function vignet()
local MainUI_upvr = game.Players.LocalPlayer.PlayerGui.MainUI
local TweenService_upvr = game:GetService("TweenService")
local clone = MainUI_upvr.MainFrame.WhiteVignette:Clone()
if clone then
	local clone_2 = clone:Clone()
	clone_2.Name ..= "Live"
	clone_2.ImageColor3 = Color3.fromRGB(255, 232, 117)
	clone_2.ImageTransparency = 1
	clone_2.Parent = MainUI_upvr.MainFrame
	clone_2.Visible = true
	TweenService_upvr:Create(clone_2, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		ImageTransparency = 0;
	}):Play()
	wait(5)
	TweenService_upvr:Create(clone_2, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Size = UDim2.new(1.5, 0, 1.5, 0);
	}):Play()
	wait(0.5)
	TweenService_upvr:Create(clone_2, TweenInfo.new(4.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut), {
		ImageTransparency = 1;
	}):Play()
	wait(4.5)
	clone_2:Destroy()
end
end

local Animations = StarJug:WaitForChild("Animations")
local LoadedAnims = {}

for _, anim in pairs(Animations:GetChildren()) do
    LoadedAnims[anim.Name] = humanoid:LoadAnimation(anim)
    
    if anim.Name == "idle" then
        LoadedAnims[anim.Name].Priority = Enum.AnimationPriority.Idle
        LoadedAnims[anim.Name].Looped = true
    end
end

StarJug.Equipped:Connect(function()
    LoadedAnims["equip"]:Play()
    
    task.wait(LoadedAnims["equip"].Length)
    
    if StarJug:IsDescendantOf(character) then
        LoadedAnims["idle"]:Play()
    end
end)

StarJug.Unequipped:Connect(function()
    if LoadedAnims["idle"].IsPlaying then
        LoadedAnims["idle"]:Stop()
    end
end)

local collisionClone
StarJug.Activated:Connect(function()
    if debounce then return end
    debounce = true
    
    LoadedAnims["open"]:Play()
    
    if durability - 1 ~= 0 then
        durability = durability - 1
        StarJug:SetAttribute("Durability", durability)
        StarJug.Handle.sound_drink.PlayOnRemove = false
        StarJug.Handle.sound_drink:Play()
    else
        StarJug.Handle.sound_drink.PlayOnRemove = true
        StarJug:Destroy()
        drink:Destroy()
    end

    vignet()
        
    local speedBoost, speedBoostFinished, mspaint_speed = 30, false, false
    if getgenv().mspaint_loaded then
        if collisionClone then collisionClone:Destroy() end
        mspaint_speed = true
        
        local originalSpeed = getgenv().Linoria.Toggles.SpeedBypass.Value
        repeat task.wait()
            if not getgenv().Linoria.Toggles.SpeedBypass.Value then
                getgenv().Linoria.Toggles.SpeedBypass:SetValue(true)
            end
        until speedBoostFinished
        getgenv().Linoria.Toggles.SpeedBypass:SetValue(originalSpeed)
    else
        if not collisionClone then
            collisionClone = character.Collision:Clone() do
                collisionClone.CanCollide = false
                collisionClone.Massless = true
                collisionClone.Name = "CollisionClone"
                if collisionClone:FindFirstChild("CollisionCrouch") then
                    collisionClone.CollisionCrouch:Destroy()
                end
        
                collisionClone.Parent = character    
            end
        end
        
        task.spawn(function()
            while not speedBoostFinished do
                collisionClone.Massless = not collisionClone.Massless
                task.wait(0.21)
            end
            
            collisionClone.Massless = true
        end)
    end
    
    speedTweenValue.Value = 35
    TweenService:Create(speedTweenValue, TweenInfo.new(70, Enum.EasingStyle.Linear), {
        Value = 0
    }):Play()

    local conn; conn = speedTweenValue:GetPropertyChangedSignal("Value"):Connect(function()
        character:SetAttribute("SpeedBoost", speedTweenValue.Value)
    end)
    
    task.wait(35)
    
    speedBoostFinished = true
    conn:Disconnect()
    collisionClone:Destroy()
    
    character:SetAttribute("SpeedBoost", 0)
    debounce = false
end)
