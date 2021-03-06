


net.Receive("spectating_status", function (length)
	GAMEMODE.SpectateMode = net.ReadInt(8)
	GAMEMODE.Spectating = false
	GAMEMODE.Spectatee = nil
	if GAMEMODE.SpectateMode >= 0 then
		GAMEMODE.Spectating = true
		GAMEMODE.Spectatee = net.ReadEntity()
	end

end)

function GM:IsCSpectating() 
	return self.Spectating
end

function GM:GetCSpectatee() 
	return self.Spectatee
end

function GM:GetCSpectateMode() 
	return self.SpectateMode
end


local function drawTextShadow(t,f,x,y,c,px,py)
	color_black.a = c.a
	draw.SimpleText(t,f,x + 1,y + 1,color_black,px,py)
	draw.SimpleText(t,f,x,y,c,px,py)
	color_black.a = 255
end

function GM:RenderSpectate()
	if self:IsCSpectating() then
		drawTextShadow(translate.spectating, "MersRadial", ScrW() / 2, ScrH() / 1.13, Color(20,120,255), 1)

		if IsValid(self:GetCSpectatee()) && self:GetCSpectatee():IsPlayer() then
			local h = draw.GetFontHeight("MersRadial")
			drawTextShadow(self:GetCSpectatee():GetBystanderName().." ("..self:GetCSpectatee():Nick()..")", "MersRadial", ScrW() / 2, ScrH() / 1.07, Color(190, 190, 190), 1)
		end
	end
end