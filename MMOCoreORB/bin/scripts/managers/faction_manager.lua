--Factional Relationships determine enemies and allies of factions.
--If you kill a factional NPC, and it is allied with another faction, then you also lose faction with the ally.
--If you kill a factional NPC, and it is enemies with another faction, then you gain faction with the enemy.

-- { faction,playerAllowed,enemies,allies,adjustFactor },
--	faction       - This is the string key faction that the relationship describes.
-- playerAllowed - Player's are able to earn or lose points with this faction.
-- enemies       - This is a comma delimited list of string key factions that this faction is enemies with.
-- allies        - This is a comma delimited list of string key factions that this faction is allies with.
-- adjustFactor  - This factor affects the amount of faction gained/lost when killing a mobile

factionList = {
	--Internally used for moral reputation.
	{ "rebel", true, "imperial", "", 1.0 },
	{ "imperial", true, "rebel", "", 1.0 },
	------------------------------------------------
	--Major factions
	------------------------------------------------
	--Republic factions
	{ "newrepublic", true, "", "", 1.0 },
	--Imperial factions
	{ "imp_thrawn", true, "", "", 1.0 },
	{ "imp_alynn", true, "", "", 1.0 },
	{ "imp_pentastar", true, "", "", 1.0 },
	{ "inquisitor", true, "", "", 1.0 },
	{ "bounty", true, "", "", 1.0 },
	--Other factions
	{ "csa", true, "", "", 1.0 },
	{ "hutt", true, "", "", 1.0 },
	{ "mando", true, "", "", 1.0 },
	------------------------------------------------
	--Minor factions
	------------------------------------------------
	{ "smugglers_alliance", true, "", "", 1.0 },
	{ "blacksun", true, "", "", 1.0 },
	{ "crimson_maw", true, "", "", 1.0 },
	------------------------------------------------
	--Local factions
	------------------------------------------------
	--Tatooine locals
	{ "tatooine", true, "", "", 1.0 },
	{ "tatooine_security", true, "", "", 1.0 },
	--Naboo and Rori locals
	{ "naboo", true, "", "", 1.0 },
	{ "rori", true, "", "", 1.0 },
	{ "naboo_security", true, "", "", 1.0 },
	--Dantooine locals
	{ "dantooine", true, "", "", 1.0 },
	{ "dantooine_militia", true, "", "", 1.0 },
	--Sullust and sulon locals
	{ "sullust", true, "", "", 1.0 },
	{ "sulon", true, "", "", 1.0 },
	{ "sulon_militia", true, "", "", 1.0 },
	--Ord Mantell locals
	{ "ord_mantell", true, "", "", 1.0 },
	{ "tansarii_security", true, "", "", 1.0 },
	--Dathomir locals
	{ "dathomir_witches", true, "", "", 1.0 },
	{ "nightsisters", true, "", "", 1.0 },
	--Mandalore locals
	{ "mandalore", true, "", "", 1.0 },
	{ "mando_protectors", true, "", "", 1.0 },
}
