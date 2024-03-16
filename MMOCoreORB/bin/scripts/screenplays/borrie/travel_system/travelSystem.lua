local ObjectManager = require("managers.object.object_manager")

travelSystem = {}

-- Takes a string "tag" and returns the index of the planet it refers to.
function travelSystem:getPlanetFromTag(tag)
	-- Loop over the planet list until we find the planet index that matches our tag.
	for i = 1, #travel_destinations, 1 do
		if(travel_destinations[i].tag == tag) then
			return travel_destinations[i]
		end
	end
end

-- Returns the first free landing spot, or a default fallback if no site is available.
function travelSystem:getFreeLandingSite(landing_spots, land_ship)
	-- Pick the first (and probably only) landing site.
	if (land_ship == false) then
		return {landing_spots[1], false}
	end

	-- TODO: Implement a check for the landing spot availability.
	for i = 1, #landing_spots, 1 do
		return {landing_spots[1], true}
	end

	-- Return the first landing spot coordinate as fallback.
	return {landing_spots[1], false}
end

-- Return a set of landing coordinates (x, z, y, facing, cell) for a landing site tag.
function travelSystem:getLandingSiteFromTag(planet, tag)
	-- Loop over the spaceport and landing sites until we find one matching the tag.
	for i = 1, #planet.spaceports, 1 do
		if (planet.spaceports[i].tag == tag) then
			return travelSystem.getFreeLandingSite(planet.spaceports[i].landing_spots, planet.spaceports[i].land_ship)
		end
	end

	for i = 1, #planet.Landing_sites, 1 do
		if (planet.landing_sites[i].tag == tag) then
			return travelSystem.getFreeLandingSite(planet.landing_sites[i].landing_spots, planet.landing_sites[i].land_ship)
		end
	end
end

-- returns an array of planets
function travelSystem:populatePlanetList(pPlayer, isPublic)
	if (pPlayer == nil) then
		return
	end

	local options = {}
	local planet_available = false
	local player_faction = SceneObject(pPlayer):getStoredString("faction_current")
	local player_zone = SceneObject(pPlayer):getZoneName()

	-- List available spaceports.
	for i = 1, #travel_destinations, 1 do
		planet_available = false
		-- Make sure that the planet is enabled
		if(isZoneEnabled(travel_destinations[i].zone)) then
			-- Check spaceport availability
			for j = 1, #travel_destinations[i].spaceports, 1 do
				-- Check if the planet has public spaceports.
				if(travel_destinations[i].spaceports[j].access == "public") then
					planet_available = true
				end

				-- Check if we have an authorized spaceport
				if(travel_destinations[i].spaceports[j].access == player_faction) then
					planet_available = true
				end
			end
			-- Check landing site availability
			if (isPublic == false) then
				for j = 1, #travel_destinations[i].landing_sites, 1 do
					-- Check if the landing site doesn't need a skill to be available.
					if (travel_destinations[i].landing_sites[j].skill == "") then
						planet_available = true
					end

					-- Check if we have the matching skill for the landing site.
					if (CreatureObject(pPlayer):hasSkill(travel_destinations[i].landing_sites[j].skill)) then
						planet_available = true
					end
				end
			end
			
			-- Finally, add the planet to the list if it is available.
			if(planet_available) then
				table.insert(options, travel_destinations[i])
			end
		end
	end
	-- Return our options!
	return options
end

-- Returns a list of the landing sites available to pPlayer
function travelSystem:populateLandingSiteList(pPlayer, planet, isPublic)
	if (pPlayer == nil) then
		return
	end

	local sites = {}
	local site_available = false
	local player_faction = SceneObject(pPlayer):getStoredString("faction_current")

	for i = 1, #planet.spaceports, 1 do
		site_available = false
		-- Check if the spaceport is public, or the player is of the same faction.
		if (planet.spaceports[i].access == "public" or planet.spaceports[i].access == player_faction) then
			site_available = true
		end
		-- Add the spaceport if it is available.
		if(site_available) then
			table.insert(sites, {planet.spaceports[i], 0})
		end
	end

	if (isPublic == false) then
		for i = 1, #planet.landing_sites, 1 do
			site_available = false
			-- Check if the site doesn't need a skill to be available
			if(planet.landing_sites[i].skill == "") then
				site_available = true
			end

			-- Check if we have the matching skill for the landing site.
			if (CreatureObject(pPlayer):hasSkill(planet.landing_sites[i].skill)) then
				site_available = true
			end

			-- Add the site if it is available.
			if(site_available) then
				table.insert(sites, planet.landing_sites[i])
			end
		end
	end

	-- Return our landing sites!
	return sites
end

-----------------------------------------------
-- Start Travel ScreenPlay
-----------------------------------------------

travelSystemScreenplay = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("travelSystemScreenplay", true)

function travelSystemScreenplay:handleSuiSelectPlanet(pPlayer, pSui, eventIndex, arg0)
	local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local isDM = false;
	
	if (pGhost == nil) then
		return
	end
	
	if(PlayerObject(pGhost):isPrivileged()) then
		isDm = true;
	end
	
	if (cancelPressed) then
		return
	end
	local planets = travelSystem:populatePlanetList(pPlayer, true)

	if (planets == nil) then
		return
	end

	local planet = planets[arg0 + 1]
	
	SceneObject(pPlayer):setStoredString("travel_planet", planet.tag)
	
	local suiManager = LuaSuiManager()
	
	if(planet == nil) then
		return
	end
	
	local options = {}
	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, true)

	if(sites == nil) then
		CreatureObject(pPlayer):sendSystemMessage("ERROR: travelSystem:populateLandingSiteList() returned nil!")
		return
	end

	for i = 1, #sites, 1 do
		table.insert(options, {sites[i].name, 0})
	end

	local listBox = LuaSuiListBox(pSui)
	local pNpc = listBox:getUsingObject()

	if (#options > 0) then
		suiManager:sendListBox(pNpc, pPlayer, "Instant Travel System", "Select a location you'd like to land at.", 2, "@cancel", "", "@ok", "travelSystemScreenplay", "travelToPoint", 32, options)
	else
		CreatureObject(pPlayer):sendSystemMessage("Unfortunately, no travel destinations could be found for this planet. Please inform administration.")
	end

end

function travelSystemScreenplay:travelToPoint(pPlayer, pSui, eventIndex, arg0) 
	local cancelPressed = (eventIndex == 1)

	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local isDM = false;
	
	if (pGhost == nil) then
		return
	end
	
	if(PlayerObject(pGhost):isPrivileged()) then
		isDm = true;
	end
	
	if (cancelPressed) then
		return
	end
	
	local planet = travelSystem:getPlanetFromTag(SceneObject(pPlayer):getStoredString("travel_planet")) 

	local sites = travelSystem:populateLandingSiteList(pPlayer, planet, true)

	if(sites == nil) then
		CreatureObject(pPlayer):sendSystemMessage("ERROR: travelSystem:populateLandingSiteList() returned nil!")
		return
	end

	local dest = sites[arg0 + 1].public_arrival

	if(dest == nil) then
		return
	end

	--------------------------------ZONE--------X------Z------Y-------CELL---
	SceneObject(pPlayer):switchZone(dest[1], dest[2],dest[3],dest[4], dest[6]) 
end
