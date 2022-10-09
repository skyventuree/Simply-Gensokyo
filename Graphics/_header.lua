-- tables of rgba values
local dark  = {0,0,0,0.9}
local light = {0.65,0.65,0.65,1}

return Def.ActorFrame{
	Name="Header",

	Def.Quad{
		ScreenChangedMessageCommand=function(self)
			local topscreen = SCREENMAN:GetTopScreen():GetName()
			if topscreen == "ScreenSelectMusic" then
				self:zoomto(_screen.w, 32):vertalign(top):x(_screen.cx)
				if DarkUI() then
					self:diffuse(dark)
				else
					self:diffuse(light)
				end
			end
			if SL.Global.GameMode == "Casual" and (topscreen == "ScreenEvaluationStage" or topscreen == "ScreenEvaluationSummary") then
				self:diffuse(dark)
			end
			self:visible(topscreen ~= "ScreenCRTTestPatterns")
		end,
	},

	LoadFont("Common Header")..{
		Name="HeaderText",
		Text=ScreenString("HeaderText"),
		InitCommand=function(self) self:diffusealpha(0):horizalign(left):xy(10, 15):zoom( SL_WideScale(0.5,0.6) ) end,
		OnCommand=function(self) self:sleep(0.1):decelerate(0.33):diffusealpha(1) end,
		OffCommand=function(self) self:accelerate(0.33):diffusealpha(0) end
	}
}
