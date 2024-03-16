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

-- Return a landing site table for a landing site tag.
function travelSystem:getLandingSiteFromTag(planet, tag)
	-- Loop over the spaceport and landing sites until we find one matching the tag.
	if (planet.spaceports ~= nil) then
		for i = 1, #planet.spaceports, 1 do
			if (planet.spaceports[i].tag == tag) then
				return planet.spaceports[i]
			end
		end
	end

	if (planet.landing_sites ~= nil) then
		for i = 1, #planet.Landing_sites, 1 do
			if (planet.landing_sites[i].tag == tag) then
				return planet.landing_sites[i]
			end
		end
	end
end

-- returns a table of all planets that the player is able to travel to.
function travelSystem:populatePlanetList(pPlayer, isPublic)
	if (pPlayer == nil) then
		return
	end

	local options = {}
	local planet_available = false
	local player_faction = SceneObject(pPlayer):getStoredString("faction_current")
	local player_zone = SceneObject(pPlayer):getZoneName()
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local isDM = false
	
	if (pGhost == nil) then
		return
	end
	
	if(PlayerObject(pGhost):isPrivileged()) then
		isDm = true
	end

	local dest = {}

	-- List available spaceports.
	for i = 1, #travel_destinations, 1 do
		planet_available = false
		-- Make sure that the planet is enabled
		if(isZoneEnabled(travel_destinations[i].zone)) then
			-- Check spaceport availability
			if (travel_destinations[i].spaceports ~= nil) then
				for j = 1, #travel_destinations[i].spaceports, 1 do
					dest = travel_destinations[i].spaceports[j]
					-- Check if the planet has public spaceports.
					if(dest.access == "public" or dest.access == nil) then
						planet_available = true
					end

					-- Check if we have an authorized spaceport
					if(dest.access == player_faction) then
						planet_available = true
					end
				end
			end
			-- Check landing site availability
			if (travel_destinations[i].landing_sites ~= nil) then
				if (isPublic == false or isDM) then
					for j = 1, #travel_destinations[i].landing_sites, 1 do
						dest = travel_destinations[i].landing_sites[j]
						-- Check if the landing site doesn't need a skill to be available.
						if (dest.skill == "" or dest.skill == nil) then
							planet_available = true

						-- Check if we have the matching skill for the landing site.
						elseif (CreatureObject(pPlayer):hasSkill(dest.skill)) then
							planet_available = true
						end
					end
				end
			end
			
			-- Finally, add the planet to the list if it is available.
			if(planet_available or isDM) then
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
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	local isDM = false
	local site = {}
	
	if (pGhost == nil) then
		return
	end
	
	if(PlayerObject(pGhost):isPrivileged()) then
		isDm = true
	end
	if (planet.spaceports ~= nil) then
			for i = 1, #planet.spaceports, 1 do
			site_available = false
			site = planet.spaceports[i]
			-- Check if the spaceport is public, or the player is of the same faction.
			if (site.access == "public" or site.access == player_faction or site.access == nil) then
				site_available = true
			end
			-- Add the spaceport if it is available.
			if(site_available or isDM) then
				table.insert(sites, site)
			end
		end
	end
	if (planet.landing_sites ~= nil) then
		if (isPublic == false or isDM) then
			for i = 1, #planet.landing_sites, 1 do
				site_available = false
				site = planet.landing_sites[i]
				-- Check if the site doesn't need a skill to be available
				if(site.skill == "" or site.skill == nil) then
					site_available = true

				-- Check if we have the matching skill for the landing site.
				elseif (CreatureObject(pPlayer):hasSkill(site.skill)) then
					site_available = true
				end

				-- Add the site if it is available.
				if(site_available or isDM) then
					table.insert(sites, site)
				end
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
	
	if (cancelPressed) then
		return
	end
	local planets = travelSystem:populatePlanetList(pPlayer, true)

	if (planets == nil) then
		CreatureObject(pPlayer):sendSystemMessage("ERROR: travelSystem:populatePlanetList() returned nil!")
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

	-- If no public arrival spot is defined, fall back to the first landing spot.
	if (dest == nil) then
		dest = sites[arg0 + 1].landing_spots[1]
	end

	-- Somehow, we're still nil, so just return.
	if(dest == nil) then
		return
	end

	--------------------------------ZONE--------X------Z------Y-------CELL---
	SceneObject(pPlayer):switchZone(dest[1], dest[2],dest[3],dest[4], dest[6]) 
end
