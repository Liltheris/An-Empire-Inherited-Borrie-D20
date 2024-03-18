BorRpShip = {

	beacons = {
		--Zone, X, Z, Y, Cell
		["1337"] = {"rp_tatooine", 0,0,0,0},
		["777"] = {"rp_dantooine", 0,0,0,0},
		["8763"] = {"rp_sulon", 1357,10,-6290,0},
		["7474"] = {"rp_tatooine", 4600,97,5545,0},
		["5112"] = {"rp_yavin4", -3150,0,-3050,0},
		["4862"] = {"rp_yavin4", 5000,0,5500,0},
		["547745"] = {"rp_sulon",2976.56, 10, 1377.47, 0},
		["3692"] = {"rp_truska", -1663, 15, -2923, 0},
	},

}

--Land the ship at an empty landing spot, or alternatively notify that the ship cannot land.
function BorRpShip:landAtEmptyLandingSpot(pPlayer, pShip, planetTag, landingSite)
	local siteTag = landingSite.tag
	local checkString = planetTag..":"..siteTag..":"
	local key

	for i = 1, #landingSite.landing_spots, 1 do
		key = checkString .. i
		if (readData(key) ~= 1) then
			writeData(key, 1)
			SceneObject(pShip):setStoredString("landing_spot_key", key)
			BorRpShip:landShip(pShip, pPlayer, landingSite.landing_spots[i])
			return nil
		end
	end

	--fall back to the public arrivals, if it exists.
	if (landingSite.public_arrival ~= nil) then
		return landingSite.public_arrival
	else
		return landingSite.landing_spots[1]
	end
end

function BorRpShip:exitShip(pPlayer)
	--Get Ship
	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local shipID = SceneObject(pShip):getObjectID()
	local currentLandingSpot = getStoredObject(pShip, "landing_point_object")
	local eventID = readData(shipID .. ":landShip:shipStatus")
	
	if(currentLandingSpot ~= nil and eventID == 3) then
		local lPosX = SceneObject(currentLandingSpot):getWorldPositionX()
		local lPosY = SceneObject(currentLandingSpot):getWorldPositionY()
		local lPosZ = SceneObject(currentLandingSpot):getWorldPositionZ()
		local lCell = SceneObject(currentLandingSpot):getParentID()
		local lZone = SceneObject(currentLandingSpot):getZoneName()
				
		SceneObject(pPlayer):switchZone(lZone, lPosX, lPosZ, lPosY, lCell) 
		return 0
	end	

	if (SceneObject(pShip):getStoredString("allow_exit")) then
		local planetTag = SceneObject(pShip):getStoredString("current_planet")
		local siteTag = SceneObject(pShip):getStoredString("landing_point")
		local planet = travelSystem:getPlanetFromTag(planetTag)

		if (planet == nil) then
			return 0
		end
		
		local site = travelSystem:getLandingSiteFromTag(planet, siteTag)

		if (site.public_arrival ~= nil) then
			SceneObject(pPlayer):switchZone(site.public_arrival[1], site.public_arrival[2], site.public_arrival[3], site.public_arrival[4], site.public_arrival[6]) 
			return 0
		else
			SceneObject(pPlayer):switchZone(site.landing_spots[1][1], site.landing_spots[1][2], site.landing_spots[1][3], site.landing_spots[1][4], site.landing_spots[1][6]) 
			return 0
		end

	else
		CreatureObject(pPlayer):sendSystemMessage("You cannot exit the ship as it is currently not landed.")
	end

end

function BorRpShip:broadcastToPassengers(pShip, message)
	--If it is not a building ship, no one to alert.
	if(SceneObject(pShip):isBuildingObject() == false) then
		return 0
	end
	
	local totalCells = BuildingObject(pShip):getTotalCellNumber()
	for i = 1, totalCells, 1 do
		local pCell = BuildingObject(pShip):getCell(i)
		if (pCell ~= nil) then
			for j = 1, SceneObject(pCell):getContainerObjectsSize(), 1 do
				local pObject = SceneObject(pCell):getContainerObject(j - 1)
				if SceneObject(pObject):isPlayerCreature() then
					CreatureObject(pObject):sendSystemMessage(message)
				end
			end
		end
	end
end

function BorRpShip:promptCourseChangeMenu(pPlayer, pObject)
	--Get Ship
	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local currentPlanetTag = SceneObject(pShip):getStoredString("current_planet")
	local currentPlanet = travelSystem:getPlanetFromTag(currentPlanetTag)
	
	--Fallback to first planet
	if(currentPlanet == nil) then
		currentPlanet = travel_destinations[1]
	end
	
	local options = {}
	local planets = travelSystem:populatePlanetList(pPlayer, false)

	if(planets == nil) then
		return
	end

	for i = 1, #planets, 1 do
		table.insert(options, {planets[i].name, 0})
	end
	
	local suiManager = LuaSuiManager()
	suiManager:sendListBox(pObject, pPlayer, "Navicomputer", "Select a destination to make the jump to lightspeed.\n\nCurrent Planet: " .. currentPlanet.name, 1, "@cancel", "", "", "BorRpShip", "plotCourseCallback", 10, options)
end

function BorRpShip:plotCourseCallback(pPlayer, pSui, eventIndex, rowIndex) 
	--Get Ship
	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local planets = travelSystem:populatePlanetList(pPlayer, false)

	if(planets == nil) then
		return 0
	end

	local newPlanet = planets[rowIndex + 1]
	
	SceneObject(pShip):setStoredString("current_planet", newPlanet.tag)
	
	local shipName = SceneObject(pShip):getCustomObjectName()
	if(shipName == "") then
		shipName = "The Ship"
	end
	
	local message = shipName .. " jumps to lightspeed, arriving shortly in orbit above " .. newPlanet.name .. "."
	
	self:broadcastToPassengers(pShip, message)
end

function BorRpShip:promptLandShipMenu(pPlayer, pObject)
	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local currentPlanetTag = SceneObject(pShip):getStoredString("current_planet")
	local currentLandingTag = SceneObject(pShip):getStoredString("landing_point")
	
	local options = {}
	local planet = travelSystem:getPlanetFromTag(currentPlanetTag)
	
	if(planet == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find planet with tag: " .. currentPlanetTag)
		return 0
	end
	
	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, false)

	if(sites == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find landing sites for planet ["..currentPlanetTag.."]")
		return 0
	end

	for i = 1, #sites, 1 do
		table.insert(options, {sites[i].name, 0})
	end
	
	-- Insert extra option for manual coordinates entering if we're not in deep space.
	if (planet.zone ~= "rp_space") then
		table.insert(options, {"Enter Coordinates", 0})
	end

	local suiManager = LuaSuiManager()
	suiManager:sendListBox(pObject, pPlayer, "Navicomputer", "Select a landing point.\n\nCurrent Location: " .. planet.name, 1, "@cancel", "", "", "BorRpShip", "landShipCallback", 10, options)
end

function BorRpShip:landShipCallback(pPlayer, pSui, eventIndex, rowIndex) 
	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local currentPlanetTag = SceneObject(pShip):getStoredString("current_planet")
	local planet = travelSystem:getPlanetFromTag(currentPlanetTag)
	
	if(planet == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find planet with tag: " .. currentPlanetTag)
		return 0
	end

	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, false)

	if(sites == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find landing sites for planet ["..currentPlanetTag.."]")
		return 0
	end
	
	--Prompt the coordinates input, or land normally if we do have a landing site.
	if(rowIndex + 1 > #sites) then
		local suiManager = LuaSuiManager()
		suiManager:sendInputBox(pShip, pPlayer, "BorRpShip", "landCoordsCallback", "Enter the coordinates you wish to land at.", "@ok")
	else
		local newLanding = sites[rowIndex + 1]

		SceneObject(pShip):setStoredString("landing_point", newLanding.tag)
	
		local shipName = SceneObject(pShip):getCustomObjectName()
		if(shipName == "") then
			shipName = "The Ship"
		end

		local exitPoint
		--Try to land the ship at that location if possible.
		if(newLanding.land_ship == true or newLanding.land_ship == nil) then
			exitPoint = BorRpShip:landAtEmptyLandingSpot(pPlayer, pShip, currentPlanetTag, newLanding)
		end

		--Manual landing is required.
		if(exitPoint ~= nil) then

			SceneObject(pShip):setStoredInt("allow_exit", 1)
			local message = shipName .. " has now landed at " .. newLanding.name .. "."
		
			self:broadcastToPassengers(pShip, message)	
		end
	end
end

function BorRpShip:landCoordsCallback(pPlayer, pSui, eventIndex, coords)
	if(eventIndex == 1) then
		return 0
	end
	
	if(coords == "") then
		CreatureObject(pPlayer):sendSystemMessage("You need to enter coordinates. Format: X, Y, heading (degrees)")
		return 0
	end

	local pCell = SceneObject(pPlayer):getParent()
	
	if(pCell == nil) then
		return 0
	end
	
	local pShip = SceneObject(pCell):getParent()
	
	if(pShip == nil) then
		return 0
	end	
	
	local currentPlanetTag = SceneObject(pShip):getStoredString("current_planet")
	local planet = travelSystem:getPlanetFromTag(currentPlanetTag)
	
	if(planet == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find planet with tag: " .. currentPlanetTag)
		return 0
	end

	local landingCoordinates = {}

	--Split the string into parts.
	for str in string.gmatch(coords, "([^%s]+)") do
		table.insert(landingCoordinates, str)
	end

	--Remove characters and convert to numerical values.
	for i = 1, #landingCoordinates, 1 do
		local str = string.gsub(landingCoordinates[i], ",", "")
		landingCoordinates[i] = tonumber(str)
	end

	--land the ship at the coordinates!
	SceneObject(pShip):setStoredString("landing_point", "custom")

	BorRpShip:landShip(pShip, pPlayer, {planet.zone, landingCoordinates[1], 0, landingCoordinates[2], landingCoordinates[3], 0})

end

function BorRpShip:renameShip(pObject, pPlayer)
	if(pObject == nil) then
		return 0
	end
	
	if(pPlayer == nil) then
		return 0
	end
	
	local suiManager = LuaSuiManager()
	suiManager:sendInputBox(pObject, pPlayer, "BorRpShip", "renameShipCallback", "Enter a new name for your ship:", "@ok")
end

function BorRpShip:renameShipCallback(pPlayer, pSui, eventIndex, newName)
	if(eventIndex == 1) then
		return 0
	end
	
	if(newName == "") then
		CreatureObject(pPlayer):sendSystemMessage("You need to enter a new name.")
		return 0
	end
	
	local inputBox = LuaSuiBox(pSui)
	local pObject = inputBox:getUsingObject()
	
	if(pObject == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error finding ship control device.")
		return 0
	end
	
	--local shipObjID = SceneObject(pObject):getStoredLong("structure")
	--local rawShip = getSceneObject(shipObjID)
	local rawShip = getShipFromControlDevice(pObject)
	
	--We only need to name the object building of a ship if there is a building object for this ship.
	if(rawShip ~= nil) then
		SceneObject(rawShip):setCustomObjectName(newName)
	end
	
	SceneObject(pObject):setCustomObjectName(newName)
	CreatureObject(pPlayer):sendSystemMessage("You ship is now called \"" .. newName .. ".\"")
end

--Attempt to land the ship 
function BorRpShip:landShip(pObject, pPlayer, landingSpot)

	local pShip = getShipFromControlDevice(pObject)
	
	if(pShip == nil) then
		pShip = pObject
	end

	-- If we weren't provided with a landing spot, land at the player's location!
	if(landingSpot == nil) then
		local posX = SceneObject(pPlayer):getWorldPositionX()
		local posY = SceneObject(pPlayer):getWorldPositionY()
		local posZ = SceneObject(pPlayer):getWorldPositionZ()
		local angle = SceneObject(pPlayer):getDirectionAngle()
		local zoneName = SceneObject(pPlayer):getZoneName()
		--local cellid = SceneObject(pPlayer):getParent()

		local planetTag = travelSystem:getPlanetTagForZone(zoneName)

		SceneObject(pShip):setStoredString("current_planet", planetTag)
		SceneObject(pShip):setStoredString("landing_point", "")

		if(SceneObject(pPlayer):getParent() ~= nil) then
			CreatureObject(pPlayer):sendSystemMessage("You cannot do this inside a structure.")
			return 0
		end

		--TO DO: Allow landing within in hangars maybe.
		landingSpot = {zoneName, posX, posZ, posY, angle, 0}
	end
	
	local shipID = SceneObject(pShip):getObjectID()
	local currentLandingSpot = getStoredObject(pShip, "landing_point_object")
	
	local eventID = readData(shipID .. ":landShip:shipStatus")
	
	if(eventID ~= 0) then
		CreatureObject(pPlayer):sendSystemMessage("This ship is currently landed elsewhere. Take off to land somewhere else.")
		return 0
	end
	
	-- Should probably not be handled this way, but it worksTM for now.
	local flatTemplate = SceneObject(pShip):getStoredString("flatteningTemplate")
	local shipNpcTemplate = SceneObject(pShip):getStoredString("appearanceMobile")

	--Spawn Ship
	local pNpc = spawnRoleplayMobile(landingSpot[1], "rp_base_npc", 1, landingSpot[2], landingSpot[3], landingSpot[4], landingSpot[5], landingSpot[6], shipNpcTemplate, "default", "default", "default")
	
	if(pNpc == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Could not find the ship object for landing animation. Aborting landing sequence...")
		return 0
	end

	local pPoint
	-- Spawn the terrain flatener if we're not inside a cell.
	if(landingSpot[6] == 0) then
		pPoint = spawnBuilding(pNpc, flatTemplate, landingSpot[2], landingSpot[4], 0)
		
		if(pPoint == nil) then
			CreatureObject(pPlayer):sendSystemMessage("Could not find the landing point object. Aborting landing sequence...")
			return 0
		end
		
		
	end
	
	setStoredObject(pShip, pNpc, "landing_point_object")
	
	setStoredObject(pNpc, pPoint, "terrain")
	setStoredObject(pNpc, pShip, "connected_ship")
	
	local shipName = SceneObject(pShip):getCustomObjectName()
	
	if(shipName == "" or shipName == nil) then
		shipName = "ship"
	end
	
	SceneObject(pNpc):setCustomObjectName(shipName)
	CreatureObject(pNpc):setPosture(PRONE)
	createEvent(2 * 1000, "BorRpShip", "startLandAnimation", pNpc, "")
	writeData(shipID .. ":landShip:shipStatus", 2) -- Landing
	CreatureObject(pPlayer):sendSystemMessage("The " .. shipName .. " is now landing...")
	createEvent(29 * 1000, "BorRpShip", "notifyShipLanded", pShip, "") --Time it takes for the player transport to land.
	createEvent(29 * 1000, "BorRpShip", "notifyPointLanded", pNpc, "")
	createEvent(29 * 1000, "BorRpShip", "shipLandedEmote", pNpc, "")
end

function BorRpShip:startLandAnimation(pShip)
	CreatureObject(pShip):setPosture(UPRIGHT)
end

function BorRpShip:shipLandedEmote(pShip)
	if(SceneObject(pShip):isBuildingObject() == false) then
		spatialMoodChat(pShip, "completes its landing sequence.", 0, 38)
	else
		spatialMoodChat(pShip, "completes its landing sequence, and drops down its boarding ramp.", 0, 38)
	end
end

function BorRpShip:notifyShipLanded(pShip)
	local shipID = SceneObject(pShip):getObjectID()
	writeData(shipID .. ":landShip:shipStatus", 3) -- Landed	
	--Alert the Crew
	local shipName = SceneObject(pShip):getCustomObjectName()
	
	if(shipName == "" or shipName == nil) then
		shipName = "ship"
	end
	
	local pNpc = getStoredObject(pShip, "landing_point_object")
	local posX = SceneObject(pNpc):getWorldPositionX()
	local posY = SceneObject(pNpc):getWorldPositionY()
	local zoneName = SceneObject(pNpc):getZoneName()
	local planetName = BorPlanetManager.planets[zoneName].name
	self:broadcastToPassengers(pShip, "The " .. shipName .. " has landed at " .. math.floor(posX+0.5) .. ", " .. math.floor(posY+0.5) .. ", " .. planetName .. ".")	
end

function BorRpShip:notifyPointLanded(pNpc)
	SceneObject(pNpc):setStoredInt("acceptingPassengers", 1)
end

function BorRpShip:takeOffShip(pObject, pPlayer, isFromShip)
	local pShip
	
	if(isFromShip == true) then
		local pCell = SceneObject(pObject):getParent()
	
		if(pCell == nil) then
			CreatureObject(pPlayer):sendSystemMessage("This Navicomputer is not currently installed on a ship.")
			return 0
		end
	
		pShip = SceneObject(pCell):getParent()
	else
		pShip = getShipFromControlDevice(pObject)
	end
	
	if(pShip == nil) then
		--CreatureObject(pPlayer):sendSystemMessage("Could not find the ship! Aborting launch sequence...")
		--return 0
		pShip = pObject		
	end
	
	local shipID = SceneObject(pShip):getObjectID()
	local pNpc = getStoredObject(pShip, "landing_point_object")
	
	local eventID = readData(shipID .. ":landShip:shipStatus")
	
	if(pNpc == nil or eventID == 0) then
		CreatureObject(pPlayer):sendSystemMessage("Your ship is not currently landed anywhere.")
		deleteData(shipID .. ":landShip:shipStatus")
		return 0
	end
	
	if(eventID ~= 3 and eventID ~= 0) then
		CreatureObject(pPlayer):sendSystemMessage("Your ship is too busy to accept a command right now.")
		return 0
	end
	
	local key = SceneObject(pShip):getStoredString("landing_spot_key")
	writeData(key, 0)

	SceneObject(pShip):setStoredString("landing_spot_key", "")
	SceneObject(pShip):setStoredString("landing_point", "")
	SceneObject(pShip):setStoredInt("allow_exit", 0)

	local pPoint = getStoredObject(pNpc, "terrain")
	if(pNpc ~= nil) then
		CreatureObject(pNpc):setPosture(PRONE)
		createEvent(29 * 1000, "BorRpShip", "clearAppearance", pNpc, "")
	end
	
	writeData(shipID .. ":landShip:shipStatus", 2) -- Landing
	SceneObject(pNpc):setStoredInt("acceptingPassengers", 0)
	createEvent(29 * 1000, "BorRpShip", "clearLandingPoint", pPoint, "")
	createEvent(29 * 1000, "BorRpShip", "clearShipData", pShip, "")
	
	local shipName = SceneObject(pShip):getCustomObjectName()
	
	if(shipName == "" or shipName == nil) then
		shipName = "ship"
	end
	
	self:broadcastToPassengers(pShip, "The " .. shipName .. " is taking off!")	
	CreatureObject(pPlayer):sendSystemMessage("The " .. shipName .. " is departing...")
	return 1
end

function BorRpShip:clearAppearance(pNpc)
	SceneObject(pNpc):destroyObjectFromWorld()
	SceneObject(pNpc):destroyObjectFromDatabase()
end

function BorRpShip:clearLandingPoint(pPoint)
	SceneObject(pPoint):destroyObjectFromWorld()
	SceneObject(pPoint):destroyObjectFromDatabase()
end

function BorRpShip:clearShipData(pShip)
	local shipID = SceneObject(pShip):getObjectID()
	deleteData(shipID .. ":landShip:shipStatus")
	
	local shipName = SceneObject(pShip):getCustomObjectName()
	
	if(shipName == "" or shipName == nil) then
		shipName = "ship"
	end
	
	self:broadcastToPassengers(pShip, "The " .. shipName .. " has entered orbit.")	
end

function BorRpShip:promptInstantTravelMenu(pPlayer)
	local suiManager = LuaSuiManager()
	local options = { }
	
	local planets = travelSystem:populatePlanetList(pPlayer, false)

	if (planets == nil) then
		return
	end

	for i = 1, #planets, 1 do
		if(isZoneEnabled(planets[i].zone)) then
			table.insert(options, {planets[i].name, 0})
		end
	end
	
	if(#options > 0) then
		suiManager:sendListBox(pPlayer, pPlayer, "Personal Ship Travel", "Select a planet you'd like to go to.", 2, "@cancel", "", "@ok", "BorRpShip", "handleInstantTravelSelectPlanet", 32, options)
	else
		CreatureObject(pPlayer):sendSystemMessage("There are no planets currently available to travel to.")
	end
end

function BorRpShip:handleInstantTravelSelectPlanet(pPlayer, pSui, eventIndex, arg0)
	local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil) then
		return 0
	end

	if (cancelPressed) then
		return 0
	end

	local planets = travelSystem:populatePlanetList(pPlayer, false)

	if (planets == nil) then
		return 0
	end

	local planetTag = planets[arg0 + 1].tag
	
	local suiManager = LuaSuiManager()
		
	SceneObject(pPlayer):setStoredString("travel_planet", planetTag)
	
	local options = {}
	local planet = travelSystem:getPlanetFromTag(planetTag)
	
	if(planet == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find planet: " .. planetTag)
		return 0
	end
	
	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, false)

	if (sites == nil) then
		return 0
	end

	for i = 1, #sites, 1 do
		table.insert(options, {sites[i].name, 0})
	end

	--Coordinates
	table.insert(options, {"Enter Coordinates", 0})
	
	suiManager:sendListBox(pPlayer, pPlayer, "Navicomputer", "Select a landing point.", 1, "@cancel", "", "", "BorRpShip", "personalShipTravel", 10, options)
end

function BorRpShip:personalShipTravel(pPlayer, pSui, eventIndex, arg0) 
	local cancelPressed = (eventIndex == 1)
	if (cancelPressed) then
		return
	end
	local planetTag = SceneObject(pPlayer):getStoredString("travel_planet")
	local planet = travelSystem:getPlanetFromTag(planetTag)
	
	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, false)

	if (sites == nil) then
		return 0
	end

	if (arg0 + 1 > #sites) then
		local suiManager = LuaSuiManager()
		suiManager:sendInputBox(pPlayer, pPlayer, "BorRpShip", "FighterlandCoordsCallback", "Enter the coordinates you wish to land at.", "@ok")
	else
		-- Just set to the first site in the list for now.
		local dest = sites[arg0 + 1].landing_spots[1]
		if(dest == nil) then
			CreatureObject(pPlayer):sendSystemMessage("Error finding destination:  " .. (arg0 + 1))
			return
		end

		--------------------------------ZONE--------X------Z------Y-------CELL---
		SceneObject(pPlayer):switchZone(dest[1], dest[2],dest[3],dest[4], dest[6]) 

		--WIP: Make Ship Take Off
	end
end

function BorRpShip:FighterLandCoordsCallback(pPlayer, pSui, eventIndex, coords)
	if(eventIndex == 1) then
		return 0
	end
	
	if(coords == "") then
		CreatureObject(pPlayer):sendSystemMessage("You need to enter coordinates. Format: X, Y, heading (degrees)")
		return 0
	end
	
	local currentPlanetTag = SceneObject(pPlayer):getStoredString("travel_planet")
	local planet = travelSystem:getPlanetFromTag(currentPlanetTag)
	
	if(planet == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Error occured. Could not find planet with tag: " .. currentPlanetTag)
		return 0
	end

	local landingCoordinates = {}

	--Split the string into parts.
	for str in string.gmatch(coords, "([^%s]+)") do
		table.insert(landingCoordinates, str)
	end

	--Remove characters and convert to numerical values.
	for i = 1, #landingCoordinates, 1 do
		local str = string.gsub(landingCoordinates[i], ",", "")
		landingCoordinates[i] = tonumber(str)
	end

	--land the ship at the coordinates!
	SceneObject(pPlayer):switchZone(planet.zone, landingCoordinates[1], 0, landingCoordinates[2], 0)

	--BorRpShip:landShip(pShip, pPlayer, {planet.zone, landingCoordinates[1], 0, landingCoordinates[2], landingCoordinates[3], 0})

end

--Generates a ship caller item for the pObject ship.
function BorRpShip:generateCaller(pObject, pPlayer)
	--TO DO: Actually write this
	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return
	end

	local pItem = giveItem(pInventory, "object/tangible/borrp/utility/ship_caller.iff", -1)	

	if(pItem == nil) then
		CreatureObject(pPlayer):sendSystemMessage("Failed to spawn ship caller.")
		return
	end

	local shipID = SceneObject(pObject):getStoredLong("structure")

	SceneObject(pItem):setStoredLong("structure", shipID)

	local customName = SceneObject(pObject):getCustomObjectName()

	SceneObject(pItem):setCustomObjectName("Caller ("..customName..")")

	local newSerial = generateSerial()
	TangibleObject(pItem):setSerialNumber(newSerial)
end