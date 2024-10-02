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
	local options = { }

	-- Hack for local-only travel terminals.
	if (SceneObject(pObject):getStoredString("local_planet") ~= "") then
		local planet = travelSystem:getPlanetFromTag(SceneObject(pObject):getStoredString("local_planet"))

		if (planet ~= nil) then
			local sites = travelSystem:populateLandingSiteList(pPlayer, planet, true)

			SceneObject(pPlayer):setStoredString("travel_planet", planet.tag)

			if(sites == nil) then
				CreatureObject(pPlayer):sendSystemMessage("ERROR: travelSystem:populateLandingSiteList() returned nil!")
				return
			end
		
			for i = 1, #sites, 1 do
				table.insert(options, {sites[i].name, 0})
			end
		
			if (#options > 0) then
				suiManager:sendListBox(pObject, pPlayer, "Instant Travel System", "Select a location you'd like to land at.", 2, "@cancel", "", "@ok", "travelSystemScreenplay", "travelToPoint", 32, options)
			else
				CreatureObject(pPlayer):sendSystemMessage("Unfortunately, no travel destinations could be found for this planet. Please inform administration.")
			end

			return 0
		end
	end

	local planets = travelSystem:populatePlanetList(pPlayer, true)
	
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
