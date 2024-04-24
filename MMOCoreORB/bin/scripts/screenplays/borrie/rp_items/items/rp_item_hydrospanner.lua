--Hydrospanner
BorRpItemHydrospannerMenuComponent = {}

function BorRpItemHydrospannerMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Roll Mechanics Skill")
end

function BorRpItemHydrospannerMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	if (pPlayer == nil or pObject == nil) then
		return 0
	end
	
	if (selectedID == 20) then
		-- Calculate the roll result first.
		local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_mechanics"))
		local roll = math.floor(math.random(1,20))
		local itemMod = 2
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
		local msg = CreatureObject(pPlayer):getFirstName().." uses a hydrospanner! Mechanics: 1d20: "..rollString.." + "..skillValue.." + \\#6666FF"..itemMod.."\\#FFFFFF"
		msg = msg.." = "..result

		broadcastMessageWithName(pPlayer, msg)
	end
	
	return 0
end