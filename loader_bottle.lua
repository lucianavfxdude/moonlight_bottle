loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local TweenService_upvr = game:GetService("TweenService")
local MainUI_upvr = nil
if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") end
MainUI_upvr = game.Players.LocalPlayer.PlayerGui.MainUI
local toolNew
if game.GameId == 6627207668 then
	toolNew = game.ReplicatedStorage["SpiralJug"]:Clone()
else
	toolNew = LoadCustomInstance("https://github.com/lucianavfxdude/moonlight_bottle/blob/main/barrelspirallight.rbxm?raw=true")
	toolNew.Name = "SpiralJug"
end
local newCloneEffect = MainUI_upvr.MainFrame.Healthbar.Effects.HerbGreenEffect:Clone()
local drinked = false
local rared = false
local ended = false
local durability = 4
newCloneEffect.Name = "GuidingLightPotion"
newCloneEffect.ImageColor3 = Color3.fromRGB(219, 29, 48)
if math.random(1,50) == 1 then
	newCloneEffect.Image = "rbxassetid://14380950090"
	rared = true
else
	newCloneEffect.Image = "rbxassetid://14380950090"
	newCloneEffect.ImageColor3 = Color3.fromRGB(219, 29, 48)
end
newCloneEffect.Visible = false
newCloneEffect.Parent = MainUI_upvr.MainFrame.Healthbar.Effects

local ohhmydayz = game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(toolNew.Animations.idle)
local ohhmydayz2 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(toolNew.Animations.open)
local ohhmydayz3 = game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(toolNew.Animations.open)

spawn(function()
	while wait() do
		if drinked == true and ended == false then
			if rared == true then
				game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
			else
				ended = true
				if game.GameId == 6627207668 then
					local newTool = script.flyTest:Clone()
					newTool.Parent = game.Players.LocalPlayer.Backpack
					newTool.Enabled = true
				else
					local Players = game.Players
local MainUI_upvr = nil
local TweenService_upvr = game:GetService("TweenService")
local soundNew = Instance.new("Sound",workspace)
soundNew.Name = "_ThunderStrikeGD"
soundNew.SoundId = "rbxassetid://1079408535"
local soundNew2 = Instance.new("Sound",workspace)
soundNew2.Name = "_ThunderStrikeGD2"
soundNew2.SoundId = "rbxassetid://9114622334"
soundNew2.PlaybackSpeed = 0.6
soundNew2.Volume = 0.9
local gdPossess = nil
if game.GameId == 6627207668 then
	gdPossess = script.GuidingLightStuff:Clone()
else
	gdPossess = LoadCustomInstance("https://github.com/lucianavfxdude/moonlight_bottle/blob/main/redlightstuff.rbxm?raw=true")
end
gdPossess.LockedToPart = true
if not game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") then repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("MainUI") end
MainUI_upvr = game.Players.LocalPlayer.PlayerGui.MainUI
function getRoot(PlayerChar)
	if PlayerChar == nil then
		PlayerChar = game.Players.LocalPlayer.Character
	end
	if not PlayerChar:FindFirstChild("HumanoidRootPart") then
		return PlayerChar.PrimaryPart
	else
		return PlayerChar.HumanoidRootPart
	end
end
local IYMouse = game.Players.LocalPlayer:GetMouse()

spawn(function()
	wait(3)
	soundNew2:Play()
	local newColorEcction = Instance.new("ColorCorrectionEffect",game.Lighting)
	TweenService_upvr:Create(newColorEcction, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Brightness = 1.5,
		TintColor = Color3.fromRGB(255, 96, 84)
	}):Play()
	wait(6)
	newColorEcction:Destroy()
	soundNew2:Destroy()
	soundNew:Play()
	spawn(function()
		wait(6)
		soundNew:Destroy()
	end)
	game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 0)
	game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 7)
	gdPossess.Parent = getRoot()
	game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health - 12
	wait(0.2)
	game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health - 12
	wait(35)
	game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 7)
	game.Players.LocalPlayer.Character:SetAttribute("SpeedBoost", 0)
	newCloneEffect:Destroy()
end)
				end
			end
		end
	end
end)

local function EffectOnScreen()
	drinkSoundPlay()
	newCloneEffect.Visible = true
	spawn(function()
		local clone = MainUI_upvr.MainFrame.WhiteVignette:Clone()
		if clone then
			local clone_2 = clone:Clone()
			clone_2.Name ..= "Live"
			clone_2.ImageColor3 = Color3.fromRGB(255, 0, 38)
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
	end)
end

function drinkSoundPlay()
	local newSound = nil
	if not workspace:FindFirstChild("DrinkPotionAddonSound") then
		newSound = Instance.new("Sound",workspace)
		newSound.Name = "DrinkPotionAddonSound"
		if game.GameId == 6627207668 then
			newSound.SoundId = "rbxassetid://103799151859408"
		else
			newSound.SoundId = "rbxassetid://18869124055"
		end
	else
		newSound = workspace:WaitForChild("DrinkPotionAddonSound")
	end
	newSound:Play()
end

toolNew.Parent = game.Players.LocalPlayer.Backpack
toolNew:SetAttribute("Durability", durability)

toolNew.Equipped:Connect(function()
	if game.GameId == 6627207668 then
		ohhmydayz:Play()
	end
end)
toolNew.Unequipped:Connect(function()
	if game.GameId == 6627207668 then
		ohhmydayz:Stop()
	end
end)

toolNew.Activated:Connect(function()
	if drinked == false then
		drinked = true
		EffectOnScreen()
		if game.GameId == 6627207668 then
			ohhmydayz2:Play()
			ohhmydayz2.Ended:Wait()
		else
			ohhmydayz3:Play()
			ohhmydayz3.Ended:Wait()
		end
		drinked = false
		ended = false
        if durability - 1 ~= 0 then
            durability = durability - 1
            toolNew:SetAttribute("Durability", durability)
        else
			drinked = true
			ended = true
            toolNew:Destroy()
			wait(7)
			workspace:FindFirstChild("DrinkPotionAddonSound"):Destroy()
        end
	end
end)
