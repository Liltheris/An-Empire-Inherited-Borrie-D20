--Computer Spike
BorRpItemComputerSpikeMenuComponent = {}

function BorRpItemComputerSpikeMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Roll Computer Skill")
end

function BorRpItemComputerSpikeMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then
		-- Calculate the roll result first.
		local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_computers"))
		local roll = math.floor(math.random(1,20))
		local itemMod = 3
		local result = skillValue + roll + itemMod
 
		local rollString = ""

		-- Critical highlighting on the roll
		if(roll == 20) then
			rollString = "\\#00FF00"..roll.."\\#FFFFFF"
		elseif (roll == 1) then
			rollString = "\\#FF0000"..roll.."\\#FFFFFF"
		else
			rollString = rollString..roll
		end

		-- Message output
		local msg = CreatureObject(pPlayer):getFirstName().." uses a computer spike! Computers check: 1d20: "..rollString.." + Modifier: "..skillValue
		msg = msg.." + Item: \\#59FFCD"..itemMod.."\\#FFFFFF"
		msg = msg.." Result: "..result

		broadcastMessageWithName(pPlayer, msg)

		-- Delete the spike!
		SceneObject(pObject):destroyObjectFromWorld()
		SceneObject(pObject):destroyObjectFromDatabase()
	end
	
	return 0
end