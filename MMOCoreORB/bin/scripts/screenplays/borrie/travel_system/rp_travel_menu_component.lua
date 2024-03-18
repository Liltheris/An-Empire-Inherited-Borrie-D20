local ObjectManager = require("managers.object.object_manager")

RpTravelTerminalMenuComponent = { }

function RpTravelTerminalMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Arrange Travel") -- Travel!
end

function RpTravelTerminalMenuComponent:handleObjectMenuSelect(pObject, pPlayer, selectedID)
	
	if (pPlayer == nil or pObject == nil) then
		return 0
	end

	if (selectedID ~= 20) then
		return 0
	end

	local suiManager = LuaSuiManager()
	local planets = travelSystem:populatePlanetList(pPlayer, true)
	local options = { }
	
	if (planets == nil) then
		CreatureObject(pPlayer):sendSystemMessage("ERROR: travelSystem:populatePlanetList() returned nil!")
		return 0
	end

	-- get the names from our planets
	for i = 1, #planets, 1 do
		table.insert(options, {planets[i].name, 0})
	end
	
	if(#options > 0) then
		suiManager:sendListBox(pObject, pPlayer, "Instant Travel System", "Select a planet you'd like to go to.", 2, "@cancel", "", "@ok", "travelSystemScreenplay", "handleSuiSelectPlanet", 32, options)
	else
		CreatureObject(pPlayer):sendSystemMessage("There are no planets currently available to travel to.")
	end
	
end
