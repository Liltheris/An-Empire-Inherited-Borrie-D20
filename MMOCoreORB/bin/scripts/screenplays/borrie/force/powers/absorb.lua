BorForce_Absorb = BorForce_BasePower:new({
	name = "Force Absorb",

    targetSelf = true,

    helpString = "This ability is a combat reaction stance. Use it by setting your reaction stance in the /rpsetstance menu.\n At the cost of 12 - your Inward skill, absorb half of the FPI directed against you by an attack. Additionally, absorb any incoming blaster bolts."
})

function BorForce_Absorb:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Absorb:execute(pPlayer)
    BorForceUtility:displayHelp(self, pPlayer)
end