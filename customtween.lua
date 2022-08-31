local twn = {};
function twn:customtwn(input, studspersecond, offset)
   local char = game:GetService("Players").LocalPlayer.Character;
   local input = input or error("input is nil");
   local studspersecond = studspersecond or 1000;
   local offset = offset or CFrame.new(0,0,0);
   local vec3, cframe;

   if typeof(input) == "table" then
       vec3 = Vector3.new(unpack(input)); cframe = CFrame.new(unpack(input));
   elseif typeof(input) ~= "Instance" then
       return error("wrong format used");
   end;
   
   Time = (char.HumanoidRootPart.Position - (vec3 or input.Position)).magnitude/studspersecond;
   local twn = game.TweenService:Create(char.HumanoidRootPart, TweenInfo.new(Time,Enum.EasingStyle.Linear), {CFrame = (cframe or input.CFrame) * offset});
   twn:Play();
   twn.Completed:Wait();
end;
return twn;
