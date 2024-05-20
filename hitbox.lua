_G.PART = HumanoidRootPart
_G.PRED = 0.13960
_G.T = 0.7

local lp = gameGetService(Players).LocalPlayer
local mouse = lpGetMouse()
local enabled = false
local Target
local mt = getrawmetatable(game)
local old = mt.namecall
setreadonly(mt, false)
mt.namecall =
newcclosure(
function(...)
local args = {...}
if enabled and getnamecallmethod() == FireServer and args[2] == UpdateMousePos then
args[3] = Target[_G.PART].Position + (Target[_G.PART].Velocity  _G.PRED)
return old(unpack(args))
end
return old(...)
end)


gameGetService(RunService).RenderSteppedConnect(function() 

for i,v in pairs (gameGetService(Players)GetPlayers()) do
if v ~= gameGetService(Players).LocalPlayer and v.Character.BodyEffectsFindFirstChild(K.O).Value == false then 
if mouse.Target == v.Character.HumanoidRootPart then
    Target = v.Character
    enabled = true
end
end
if v ~= gameGetService(Players).LocalPlayer then
if v.Character.BodyEffectsFindFirstChild(K.O).Value == false then 
v.Character.HumanoidRootPart.Size = Vector3.new(20, 20, 20)
v.Character.HumanoidRootPart.Transparency = _G.T
v.Character.HumanoidRootPart.CanCollide = false
else
v.Character.HumanoidRootPart.Size = Vector3.new(0.1, 0.1, 0.1)
v.Character.HumanoidRootPart.Transparency = 1
v.Character.HumanoidRootPart.CanCollide = false
end
if v.CharacterFindFirstChild(GRABBING_CONSTRAINT) then
    v.Character.HumanoidRootPart.Size = Vector3.new(0.1, 0.1, 0.1)
    v.Character.HumanoidRootPart.Transparency = 1
    v.Character.HumanoidRootPart.CanCollide = false
end
end
end
if mouse.Target.Name == HumanoidRootPart then
enabled = true
else
enabled = false
end

end)
