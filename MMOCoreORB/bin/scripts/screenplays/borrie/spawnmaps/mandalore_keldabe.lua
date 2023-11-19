local Logger = require("utils.logger")

RpMandaloreKeldabeScreenPlay = CityScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "RpMandaloreKeldabeScreenPlay",

	planet = "rp_mandalore",	
	
	walkpointList = {
		market_shopper1 = {

		},
	}
	
	
}

registerScreenPlay("RpMandaloreKeldabeScreenPlay",  true)

function RpMandaloreKeldabeScreenPlay:start()
	if (isZoneEnabled(self.planet)) then
		self:spawnMobiles()
		self:spawnSceneObjects()
		self:spawnCivilians()
		self:spawnJunkPiles()
	end
end

function RpMandaloreKeldabeScreenPlay:spawnJunkPiles() 
	local spawnPoints = {

	}
	RpJunkPile:spawnJunkPiles(self.planet, spawnPoints, true)
end

function RpMandaloreKeldabeScreenPlay:spawnCivilians() 
	local waypointList = {
		--TO DO: Add NPCs
	}
	
	CivillianGenerator:spawnCivillians(self.screenplayName, "rp_mandalore", waypointList, self.walkpointList, "mandalore", "mandalore")
end

function RpMandaloreKeldabeScreenPlay:spawnSceneObjects() 
	--Travel Terminals
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 50515, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 50515, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 50515, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 50515, 0.909306, 0, -0.416129, 0)

	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -13.0021, 0.639421, 51.1865, 50535, 1, 0, 0.332372, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", -2.7419, 0.639421, 48.1677, 50535, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 2.54505, 0.639421, 48.1693, 50535, 1, 0, 0, 0)
	spawnSceneObject("rp_mandalore", "object/tangible/terminal/terminal_travel_rp.iff", 12.6536, 0.639421, 51.1838, 50535, 0.909306, 0, -0.416129, 0)

end

function RpMandaloreKeldabeScreenPlay:spawnMobiles()
	--Species, Equipment, Skills, Customization

end