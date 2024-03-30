BorForce_Deflect = BorForce_BasePower:new({
	name = "Force Deflect",

    targetSelf = true,

    helpString = "This ability is a combat reaction stance. Use it by setting your reaction stance in the /rpsetstance menu.\n At the cost of 11 - your telekinesis skill, deflect an attack by successfully rolling telekinesis to beat the attacker's roll."
})

function BorForce_Deflect:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Deflect:execute(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end