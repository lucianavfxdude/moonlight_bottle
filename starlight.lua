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

    character:SetAttribute("StarlightHuge", true)
        
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
    character:SetAttribute("StarlightHuge", false)
    debounce = false
end)
