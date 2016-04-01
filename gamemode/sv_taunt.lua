local taunts = {}

function addTaunt(cat, soundFile, sex)
	if !taunts[cat] then
		taunts[cat] = {}
	end
	if !taunts[cat][sex] then
		taunts[cat][sex] = {}
	end
	local t = {}
	t.sound = soundFile
	t.sex = sex
	t.category = cat
	table.insert(taunts[cat][sex], t)
end

-- male
addTaunt("help", "murder/taunts/help/hlp1.mp3", "male")
addTaunt("help", "murder/taunts/help/hlp2.mp3", "male")
addTaunt("help", "murder/taunts/help/hlp3.mp3", "male")
addTaunt("help", "murder/taunts/help/hlp4.mp3", "male")
addTaunt("help", "murder/taunts/help/hlp5.mp3", "male")
addTaunt("help", "murder/taunts/help/hlp6.mp3", "male")

addTaunt("scream", "murder/taunts/scary/scr1.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr2.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr3.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr4.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr5.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr6.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr7.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr8.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr9.mp3", "male")
addTaunt("scream", "murder/taunts/scary/scr10.mp3", "male")

addTaunt("morose", "murder/taunts/bad/bd1.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd2.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd3.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd4.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd5.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd6.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd7.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd8.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd9.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd10.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd11.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd12.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd13.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd14.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd15.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd16.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd17.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd18.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd19.mp3", "male")
addTaunt("morose", "murder/taunts/bad/bd20.mp3", "male")

addTaunt("funny", "murder/taunts/good/gd1.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd2.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd3.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd4.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd5.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd6.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd7.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd8.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd9.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd10.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd11.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd12.mp3", "male")
addTaunt("funny", "murder/taunts/good/gd13.mp3", "male")

-- female
addTaunt("help", "vo/npc/female01/help01.wav", "female")

addTaunt("scream", "vo/npc/female01/runforyourlife01.wav", "female")
addTaunt("scream", "vo/npc/female01/runforyourlife02.wav", "female")
addTaunt("scream", "vo/npc/female01/watchout.wav", "female")
addTaunt("scream", "vo/npc/female01/gethellout.wav", "female")

addTaunt("morose", "vo/npc/female01/question30.wav", "female")
addTaunt("morose", "vo/npc/female01/question25.wav", "female")
addTaunt("morose", "vo/npc/female01/question20.wav", "female")
addTaunt("morose", "vo/npc/female01/question15.wav", "female")

addTaunt("funny", "vo/npc/female01/doingsomething.wav", "female")
addTaunt("funny", "vo/npc/female01/busy02.wav", "female")
addTaunt("funny", "vo/npc/female01/gordead_ques07.wav", "female")
addTaunt("funny", "vo/npc/female01/notthemanithought01.wav", "female")
addTaunt("funny", "vo/npc/female01/notthemanithought02.wav", "female")
addTaunt("funny", "vo/npc/female01/question06.wav", "female")
addTaunt("funny", "vo/npc/female01/question09.wav", "female")

concommand.Add("mu_taunt", function (ply, com, args, full)
	if ply.LastTaunt && ply.LastTaunt > CurTime() then return end
	if !ply:Alive() then return end
	if ply:Team() != 2 then return end

	if #args < 1 then return end
	local cat = args[1]:lower()
	if !taunts[cat] then return end

	local sex = string.lower(ply.ModelSex or "male")
	if !taunts[cat][sex] then return end

	local taunt = table.Random(taunts[cat][sex])
	ply:EmitSound(taunt.sound)

	ply.LastTaunt = CurTime() + SoundDuration(taunt.sound) + 0.3
end)