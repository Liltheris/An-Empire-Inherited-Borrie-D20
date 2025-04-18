#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/ai/Creature.h"

#include "server/zone/objects/tangible/threat/ThreatMap.h"
#include "server/zone/objects/tangible/threat/ThreatStates.h"

#include "server/zone/objects/guild/GuildObject.h"

#include "server/zone/objects/region/CityRegion.h"

#include "server/zone/objects/player/sessions/crafting/CraftingSession.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"

#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/resource/ResourceManager.h"
#include "server/zone/managers/creature/PetManager.h"
#include "server/zone/managers/structure/StructureManager.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/skill/PerformanceManager.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/managers/group/GroupManager.h"

#include "server/zone/managers/collision/CollisionManager.h"
#include "server/zone/managers/combat/CombatManager.h"
#include "server/zone/managers/creature/CreatureManager.h"

#include "server/zone/ZoneProcessServer.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/Zone.h"

#include "server/chat/ChatManager.h"

#include "server/zone/packets/object/CombatSpam.h"
#include "server/zone/packets/object/CombatAction.h"

#include "server/zone/objects/group/GroupObject.h"

#include "server/login/account/Account.h"

#include "server/zone/objects/group/GroupObject.h"
#include "server/zone/objects/tangible/Instrument.h"
#include "server/zone/objects/building/BuildingObject.h"

#include "CommandConfigManager.h"

#include "server/zone/objects/creature/commands/SuppressionFire1Command.h"
#include "server/zone/objects/creature/commands/SuppressionFire2Command.h"
#include "server/zone/objects/creature/commands/SurpriseShotCommand.h"
#include "server/zone/objects/creature/commands/SurrenderSkillCommand.h"
#include "server/zone/objects/creature/commands/SurveyCommand.h"
#include "server/zone/objects/creature/commands/SynchronizedUiListenCommand.h"
#include "server/zone/objects/creature/commands/SynchronizedUiStopListeningCommand.h"
#include "server/zone/objects/creature/commands/SystemMessageCommand.h"
#include "server/zone/objects/creature/commands/TakeCoverCommand.h"
#include "server/zone/objects/creature/commands/TameCommand.h"
#include "server/zone/objects/creature/commands/TargetCommand.h"
#include "server/zone/objects/creature/commands/TauntCommand.h"
#include "server/zone/objects/creature/commands/TeachCommand.h"
#include "server/zone/objects/creature/commands/TeleportCommand.h"
#include "server/zone/objects/creature/commands/TeleportTargetCommand.h"
#include "server/zone/objects/creature/commands/TeleportToCommand.h"
#include "server/zone/objects/creature/commands/TellpetCommand.h"
#include "server/zone/objects/creature/commands/TendDamageCommand.h"
#include "server/zone/objects/creature/commands/TendDamageToolCommand.h"
#include "server/zone/objects/creature/commands/TendWoundCommand.h"
#include "server/zone/objects/creature/commands/TendWoundsToolCommand.h"
#include "server/zone/objects/creature/commands/ThreatenShotCommand.h"
#include "server/zone/objects/creature/commands/ThrowGrenadeCommand.h"
#include "server/zone/objects/creature/commands/ThrowTrapCommand.h"
#include "server/zone/objects/creature/commands/TipCommand.h"
#include "server/zone/objects/creature/commands/ToggleAwayFromKeyBoardCommand.h"
#include "server/zone/objects/creature/commands/ToggleDisplayingFactionRankCommand.h"
#include "server/zone/objects/creature/commands/TorsoShotCommand.h"
#include "server/zone/objects/creature/commands/TotalHealOtherCommand.h"
#include "server/zone/objects/creature/commands/TotalHealSelfCommand.h"
#include "server/zone/objects/creature/commands/TransferForceCommand.h"
#include "server/zone/objects/creature/commands/TransferItemCommand.h"
#include "server/zone/objects/creature/commands/TransferItemArmorCommand.h"
#include "server/zone/objects/creature/commands/TransferItemMiscCommand.h"
#include "server/zone/objects/creature/commands/TransferItemWeaponCommand.h"
#include "server/zone/objects/creature/commands/TransferstructureCommand.h"
#include "server/zone/objects/creature/commands/TumbleToKneelingCommand.h"
#include "server/zone/objects/creature/commands/TumbleToProneCommand.h"
#include "server/zone/objects/creature/commands/TumbleToStandingCommand.h"
#include "server/zone/objects/creature/commands/TurretFireCommand.h"
#include "server/zone/objects/creature/commands/UnarmedBlind1Command.h"
#include "server/zone/objects/creature/commands/UnarmedBodyHit1Command.h"
#include "server/zone/objects/creature/commands/UnarmedCombo1Command.h"
#include "server/zone/objects/creature/commands/UnarmedCombo2Command.h"
#include "server/zone/objects/creature/commands/UnarmedDizzy1Command.h"
#include "server/zone/objects/creature/commands/UnarmedHeadHit1Command.h"
#include "server/zone/objects/creature/commands/UnarmedHit1Command.h"
#include "server/zone/objects/creature/commands/UnarmedHit2Command.h"
#include "server/zone/objects/creature/commands/UnarmedHit3Command.h"
#include "server/zone/objects/creature/commands/UnarmedKnockdown1Command.h"
#include "server/zone/objects/creature/commands/UnarmedKnockdown2Command.h"
#include "server/zone/objects/creature/commands/UnarmedLegHit1Command.h"
#include "server/zone/objects/creature/commands/UnarmedLunge1Command.h"
#include "server/zone/objects/creature/commands/UnarmedLunge2Command.h"
#include "server/zone/objects/creature/commands/UnarmedSpinAttack1Command.h"
#include "server/zone/objects/creature/commands/UnarmedSpinAttack2Command.h"
#include "server/zone/objects/creature/commands/UnarmedStun1Command.h"
#include "server/zone/objects/creature/commands/UnassociateDroidControlDeviceWithShipCommand.h"
#include "server/zone/objects/creature/commands/UnCityBanCommand.h"
#include "server/zone/objects/creature/commands/UnconsentCommand.h"
#include "server/zone/objects/creature/commands/UnderHandShotCommand.h"
#include "server/zone/objects/creature/commands/UnfreezePlayerCommand.h"
#include "server/zone/objects/creature/commands/UninstallShipComponentCommand.h"
#include "server/zone/objects/creature/commands/UninviteCommand.h"
#include "server/zone/objects/creature/commands/UnsnoopCommand.h"
#include "server/zone/objects/creature/commands/UseReconDroneCommand.h"
#include "server/zone/objects/creature/commands/UseSkillBuffCommand.h"
#include "server/zone/objects/creature/commands/VentriloquismCommand.h"
#include "server/zone/objects/creature/commands/ToggleCombatTauntsCommand.h"
#include "server/zone/objects/creature/commands/VertFurnitureCommand.h"
#include "server/zone/objects/creature/commands/VitalizeCommand.h"
#include "server/zone/objects/creature/commands/VolleyFireCommand.h"
#include "server/zone/objects/creature/commands/VolleyFireAttackCommand.h"
#include "server/zone/objects/creature/commands/Warcry1Command.h"
#include "server/zone/objects/creature/commands/Warcry2Command.h"
#include "server/zone/objects/creature/commands/WarningShotCommand.h"
#include "server/zone/objects/creature/commands/WatchCommand.h"
#include "server/zone/objects/creature/commands/WildShot1Command.h"
#include "server/zone/objects/creature/commands/WildShot2Command.h"
#include "server/zone/objects/creature/commands/WipeItemsCommand.h"
#include "server/zone/objects/creature/commands/WookieeRoarCommand.h"
#include "server/zone/objects/creature/commands/CityInfoCommand.h"
#include "server/zone/objects/creature/commands/GroupLootCommand.h"
#include "server/zone/objects/creature/commands/OpenLotteryContainerCommand.h"
#include "server/zone/objects/creature/commands/CloseLotteryContainerCommand.h"
#include "server/zone/objects/creature/commands/EjectCommand.h"
#include "server/zone/objects/creature/commands/LaunchIntoSpaceCommand.h"
#include "server/zone/objects/creature/commands/UnstickCommand.h"
#include "server/zone/objects/creature/commands/WaypointCommand.h"
#include "server/zone/objects/creature/commands/CreateVendorCommand.h"
#include "server/zone/objects/creature/commands/RequestQuestTimersAndCountersCommand.h"
#include "server/zone/objects/creature/commands/PilotShipCommand.h"
#include "server/zone/objects/creature/commands/UnpilotShipCommand.h"
#include "server/zone/objects/creature/commands/LeaveStationCommand.h"
#include "server/zone/objects/creature/commands/OpenWingsCommand.h"
#include "server/zone/objects/creature/commands/CloseWingsCommand.h"
#include "server/zone/objects/creature/commands/LaunchMissileCommand.h"
#include "server/zone/objects/creature/commands/LaunchCountermeasureCommand.h"
#include "server/zone/objects/creature/commands/BoosterOnCommand.h"
#include "server/zone/objects/creature/commands/BoosterOffCommand.h"
#include "server/zone/objects/creature/commands/InspectCommand.h"
#include "server/zone/objects/creature/commands/DockCommand.h"
#include "server/zone/objects/creature/commands/PumpreactorCommand.h"
#include "server/zone/objects/creature/commands/IffscrambleCommand.h"
#include "server/zone/objects/creature/commands/DroidCommand.h"
#include "server/zone/objects/creature/commands/LootAllCommand.h"
#include "server/zone/objects/creature/commands/ServerAsteroidDataListenCommand.h"
#include "server/zone/objects/creature/commands/ServerAsteroidDataStopListeningCommand.h"
#include "server/zone/objects/creature/commands/DisableTargetCommand.h"
#include "server/zone/objects/creature/commands/DestroyTargetCommand.h"
#include "server/zone/objects/creature/commands/SendFormObjectDataCommand.h"
#include "server/zone/objects/creature/commands/InspacerepairCommand.h"
#include "server/zone/objects/creature/commands/LightEngineScrambleCommand.h"
#include "server/zone/objects/creature/commands/HyperspaceCommand.h"
#include "server/zone/objects/creature/commands/AborthyperspaceCommand.h"
#include "server/zone/objects/creature/commands/EweaponsCommand.h"
#include "server/zone/objects/creature/commands/EshieldsCommand.h"
#include "server/zone/objects/creature/commands/EthrustCommand.h"
#include "server/zone/objects/creature/commands/VrepairCommand.h"
#include "server/zone/objects/creature/commands/Bstrike1Command.h"
#include "server/zone/objects/creature/commands/Bstrike2Command.h"
#include "server/zone/objects/creature/commands/Bstrike3Command.h"
#include "server/zone/objects/creature/commands/Ptrap1Command.h"
#include "server/zone/objects/creature/commands/Ptrap2Command.h"
#include "server/zone/objects/creature/commands/Epulse1Command.h"
#include "server/zone/objects/creature/commands/Epulse2Command.h"
#include "server/zone/objects/creature/commands/Epulse3Command.h"
#include "server/zone/objects/creature/commands/NblastCommand.h"
#include "server/zone/objects/creature/commands/VrepairotherCommand.h"
#include "server/zone/objects/creature/commands/UndockCommand.h"
#include "server/zone/objects/creature/commands/Jstart1Command.h"
#include "server/zone/objects/creature/commands/Jstart2Command.h"
#include "server/zone/objects/creature/commands/Jstart3Command.h"
#include "server/zone/objects/creature/commands/EscapePodCommand.h"
#include "server/zone/objects/creature/commands/InspacereloadCommand.h"
#include "server/zone/objects/creature/commands/InspacerrCommand.h"
#include "server/zone/objects/creature/commands/RequestSpaceTrainerCommand.h"



#include "server/zone/objects/creature/commands/AnimCommand.h"
#include "server/zone/objects/creature/commands/AttackNpcCommand.h"
#include "server/zone/objects/creature/commands/AttackRpCommand.h"
#include "server/zone/objects/creature/commands/RpreloadCommand.h"
#include "server/zone/objects/creature/commands/RpRepairCommand.h"
#include "server/zone/objects/creature/commands/D20Command.h"
#include "server/zone/objects/creature/commands/DmCommand.h"
#include "server/zone/objects/creature/commands/EndTurnCommand.h"
#include "server/zone/objects/creature/commands/HpCommand.h"
#include "server/zone/objects/creature/commands/MsgDmCommand.h"
#include "server/zone/objects/creature/commands/NFaceCommand.h"
#include "server/zone/objects/creature/commands/NFollowCommand.h"
#include "server/zone/objects/creature/commands/NStayCommand.h"
#include "server/zone/objects/creature/commands/NTargetCommand.h"
#include "server/zone/objects/creature/commands/RDebugCommand.h"
#include "server/zone/objects/creature/commands/RestRpCommand.h"
#include "server/zone/objects/creature/commands/RpCommand.h"
#include "server/zone/objects/creature/commands/SetCombatCommand.h"
#include "server/zone/objects/creature/commands/SkillRpCommand.h"
#include "server/zone/objects/creature/commands/ToolCommand.h"
#include "server/zone/objects/creature/commands/TrainCommand.h"
#include "server/zone/objects/creature/commands/VoxCommand.h"
#include "server/zone/objects/creature/commands/RpForceCommand.h"
#include "server/zone/objects/creature/commands/PingCommand.h"
#include "server/zone/objects/creature/commands/ToggleBioCommand.h"
#include "server/zone/objects/creature/commands/RSCommand.h"
#include "server/zone/objects/creature/commands/DSCommand.h"
#include "server/zone/objects/creature/commands/ToggleOocCommand.h"
#include "server/zone/objects/creature/commands/ToggleGripCommand.h"

#include "server/zone/objects/creature/commands/AimedattackCommand.h"
#include "server/zone/objects/creature/commands/PowerattackCommand.h"
#include "server/zone/objects/creature/commands/FlurryattackCommand.h"
#include "server/zone/objects/creature/commands/TurnhelpCommand.h"
#include "server/zone/objects/creature/commands/RpimphealCommand.h"
#include "server/zone/objects/creature/commands/RpsliceCommand.h"
#include "server/zone/objects/creature/commands/RpfmanipulateCommand.h"
#include "server/zone/objects/creature/commands/RpfpushCommand.h"
#include "server/zone/objects/creature/commands/RpfpullCommand.h"
#include "server/zone/objects/creature/commands/RpfgripCommand.h"
#include "server/zone/objects/creature/commands/RpfcrushCommand.h"
#include "server/zone/objects/creature/commands/RpfspeedCommand.h"
#include "server/zone/objects/creature/commands/RpfjumpCommand.h"
#include "server/zone/objects/creature/commands/RpfabsorbCommand.h"
#include "server/zone/objects/creature/commands/RpfdefenseCommand.h"
#include "server/zone/objects/creature/commands/RpfpersuadeCommand.h"
#include "server/zone/objects/creature/commands/RpfreadCommand.h"
#include "server/zone/objects/creature/commands/RpftrickCommand.h"
#include "server/zone/objects/creature/commands/RpfdominateCommand.h"
#include "server/zone/objects/creature/commands/RpfshockCommand.h"
#include "server/zone/objects/creature/commands/RpflightningCommand.h"
#include "server/zone/objects/creature/commands/RpfchainCommand.h"
#include "server/zone/objects/creature/commands/RpfstormCommand.h"
#include "server/zone/objects/creature/commands/RpfstealthCommand.h"
#include "server/zone/objects/creature/commands/RpfflashCommand.h"
#include "server/zone/objects/creature/commands/RpftwistCommand.h"
#include "server/zone/objects/creature/commands/RpfprojectCommand.h"
#include "server/zone/objects/creature/commands/RpfsthrowCommand.h"
#include "server/zone/objects/creature/commands/RpaddstateCommand.h"
#include "server/zone/objects/creature/commands/RpstimpackCommand.h"

#include "server/zone/objects/creature/commands/RpfbodyCommand.h"
#include "server/zone/objects/creature/commands/RpfmeditateCommand.h"
#include "server/zone/objects/creature/commands/RpfdeflectCommand.h"
#include "server/zone/objects/creature/commands/RpgfocusCommand.h"
#include "server/zone/objects/creature/commands/RpfrageCommand.h"
#include "server/zone/objects/creature/commands/RpfhealCommand.h"
#include "server/zone/objects/creature/commands/RpftargethealCommand.h"
#include "server/zone/objects/creature/commands/RpfsightCommand.h"
#include "server/zone/objects/creature/commands/RpfprecogCommand.h"

#include "server/zone/objects/creature/commands/CommCommand.h"

#include "server/zone/objects/creature/commands/RpsetstanceCommand.h"
#include "server/zone/objects/creature/commands/RpmoveCommand.h"

//EIF Holstering
#include "server/zone/objects/creature/commands/HolsterCommand.h"
#include "server/zone/objects/creature/commands/StowCommand.h"

using namespace server::zone::managers::objectcontroller::command;


void CommandConfigManager::registerCommands4() {
	commandFactory.registerCommand<SuppressionFire1Command>(String("suppressionFire1").toLowerCase());
	commandFactory.registerCommand<SuppressionFire2Command>(String("suppressionFire2").toLowerCase());
	commandFactory.registerCommand<SurpriseShotCommand>(String("surpriseShot").toLowerCase());
	commandFactory.registerCommand<SurrenderSkillCommand>(String("surrenderSkill").toLowerCase());
	commandFactory.registerCommand<SurveyCommand>(String("survey").toLowerCase());
	commandFactory.registerCommand<SynchronizedUiListenCommand>(String("synchronizedUiListen").toLowerCase());
	commandFactory.registerCommand<SynchronizedUiStopListeningCommand>(String("synchronizedUiStopListening").toLowerCase());
	commandFactory.registerCommand<SystemMessageCommand>(String("systemMessage").toLowerCase());
	commandFactory.registerCommand<TakeCoverCommand>(String("takeCover").toLowerCase());
	commandFactory.registerCommand<TameCommand>(String("tame").toLowerCase());
	commandFactory.registerCommand<TargetCommand>(String("target").toLowerCase());
	commandFactory.registerCommand<TauntCommand>(String("taunt").toLowerCase());
	commandFactory.registerCommand<TeachCommand>(String("teach").toLowerCase());
	commandFactory.registerCommand<TeleportCommand>(String("teleport").toLowerCase());
	commandFactory.registerCommand<TeleportTargetCommand>(String("teleportTarget").toLowerCase());
	commandFactory.registerCommand<TeleportToCommand>(String("teleportTo").toLowerCase());
	commandFactory.registerCommand<TellpetCommand>(String("tellpet").toLowerCase());
	commandFactory.registerCommand<TendDamageCommand>(String("tendDamage").toLowerCase());
	commandFactory.registerCommand<TendDamageToolCommand>(String("tendDamageTool").toLowerCase());
	commandFactory.registerCommand<TendWoundCommand>(String("tendWound").toLowerCase());
	commandFactory.registerCommand<TendWoundsToolCommand>(String("tendWoundsTool").toLowerCase());
	commandFactory.registerCommand<ThreatenShotCommand>(String("threatenShot").toLowerCase());
	commandFactory.registerCommand<ThrowGrenadeCommand>(String("throwGrenade").toLowerCase());
	commandFactory.registerCommand<ThrowTrapCommand>(String("throwTrap").toLowerCase());
	commandFactory.registerCommand<TipCommand>(String("tip").toLowerCase());
	commandFactory.registerCommand<ToggleAwayFromKeyBoardCommand>(String("toggleAwayFromKeyBoard").toLowerCase());
	commandFactory.registerCommand<ToggleDisplayingFactionRankCommand>(String("toggleDisplayingFactionRank").toLowerCase());
	commandFactory.registerCommand<TorsoShotCommand>(String("torsoShot").toLowerCase());
	commandFactory.registerCommand<TotalHealOtherCommand>(String("totalHealOther").toLowerCase());
	commandFactory.registerCommand<TotalHealSelfCommand>(String("totalHealSelf").toLowerCase());
	commandFactory.registerCommand<TransferForceCommand>(String("transferForce").toLowerCase());
	commandFactory.registerCommand<TransferItemCommand>(String("transferItem").toLowerCase());
	commandFactory.registerCommand<TransferItemArmorCommand>(String("transferItemArmor").toLowerCase());
	commandFactory.registerCommand<TransferItemMiscCommand>(String("transferItemMisc").toLowerCase());
	commandFactory.registerCommand<TransferItemWeaponCommand>(String("transferItemWeapon").toLowerCase());
	commandFactory.registerCommand<TransferstructureCommand>(String("transferstructure").toLowerCase());
	commandFactory.registerCommand<TumbleToKneelingCommand>(String("tumbleToKneeling").toLowerCase());
	commandFactory.registerCommand<TumbleToProneCommand>(String("tumbleToProne").toLowerCase());
	commandFactory.registerCommand<TumbleToStandingCommand>(String("tumbleToStanding").toLowerCase());
	commandFactory.registerCommand<TurretFireCommand>(String("turretFire").toLowerCase());
	commandFactory.registerCommand<UnarmedBlind1Command>(String("unarmedBlind1").toLowerCase());
	commandFactory.registerCommand<UnarmedBodyHit1Command>(String("unarmedBodyHit1").toLowerCase());
	commandFactory.registerCommand<UnarmedCombo1Command>(String("unarmedCombo1").toLowerCase());
	commandFactory.registerCommand<UnarmedCombo2Command>(String("unarmedCombo2").toLowerCase());
	commandFactory.registerCommand<UnarmedDizzy1Command>(String("unarmedDizzy1").toLowerCase());
	commandFactory.registerCommand<UnarmedHeadHit1Command>(String("unarmedHeadHit1").toLowerCase());
	commandFactory.registerCommand<UnarmedHit1Command>(String("unarmedHit1").toLowerCase());
	commandFactory.registerCommand<UnarmedHit2Command>(String("unarmedHit2").toLowerCase());
	commandFactory.registerCommand<UnarmedHit3Command>(String("unarmedHit3").toLowerCase());
	commandFactory.registerCommand<UnarmedKnockdown1Command>(String("unarmedKnockdown1").toLowerCase());
	commandFactory.registerCommand<UnarmedKnockdown2Command>(String("unarmedKnockdown2").toLowerCase());
	commandFactory.registerCommand<UnarmedLegHit1Command>(String("unarmedLegHit1").toLowerCase());
	commandFactory.registerCommand<UnarmedLunge1Command>(String("unarmedLunge1").toLowerCase());
	commandFactory.registerCommand<UnarmedLunge2Command>(String("unarmedLunge2").toLowerCase());
	commandFactory.registerCommand<UnarmedSpinAttack1Command>(String("unarmedSpinAttack1").toLowerCase());
	commandFactory.registerCommand<UnarmedSpinAttack2Command>(String("unarmedSpinAttack2").toLowerCase());
	commandFactory.registerCommand<UnarmedStun1Command>(String("unarmedStun1").toLowerCase());
	commandFactory.registerCommand<UnassociateDroidControlDeviceWithShipCommand>(String("unassociateDroidControlDeviceWithShip").toLowerCase());
	commandFactory.registerCommand<UnCityBanCommand>(String("unCityBan").toLowerCase());
	commandFactory.registerCommand<UnconsentCommand>(String("unconsent").toLowerCase());
	commandFactory.registerCommand<UnderHandShotCommand>(String("underHandShot").toLowerCase());
	commandFactory.registerCommand<UnfreezePlayerCommand>(String("unfreezePlayer").toLowerCase());
	commandFactory.registerCommand<UninstallShipComponentCommand>(String("uninstallShipComponent").toLowerCase());
	commandFactory.registerCommand<UninviteCommand>(String("uninvite").toLowerCase());
	commandFactory.registerCommand<UnsnoopCommand>(String("unsnoop").toLowerCase());
	commandFactory.registerCommand<UseReconDroneCommand>(String("useReconDrone").toLowerCase());
	commandFactory.registerCommand<UseSkillBuffCommand>(String("useSkillBuff").toLowerCase());
	commandFactory.registerCommand<VentriloquismCommand>(String("ventriloquism").toLowerCase());
	commandFactory.registerCommand<ToggleCombatTauntsCommand>(String("toggleCombatTaunts").toLowerCase());
	commandFactory.registerCommand<VertFurnitureCommand>(String("vertFurniture").toLowerCase());
	commandFactory.registerCommand<VitalizeCommand>(String("vitalize").toLowerCase());
	commandFactory.registerCommand<VolleyFireCommand>(String("volleyFire").toLowerCase());
	commandFactory.registerCommand<VolleyFireAttackCommand>(String("volleyFireAttack").toLowerCase());
	commandFactory.registerCommand<Warcry1Command>(String("warcry1").toLowerCase());
	commandFactory.registerCommand<Warcry2Command>(String("warcry2").toLowerCase());
	commandFactory.registerCommand<WarningShotCommand>(String("warningShot").toLowerCase());
	commandFactory.registerCommand<WatchCommand>(String("watch").toLowerCase());
	commandFactory.registerCommand<WildShot1Command>(String("wildShot1").toLowerCase());
	commandFactory.registerCommand<WildShot2Command>(String("wildShot2").toLowerCase());
	commandFactory.registerCommand<WipeItemsCommand>(String("wipeItems").toLowerCase());
	commandFactory.registerCommand<WookieeRoarCommand>(String("wookieeRoar").toLowerCase());

	commandFactory.registerCommand<CityInfoCommand>(String("cityInfo").toLowerCase());
	commandFactory.registerCommand<GroupLootCommand>(String("groupLoot").toLowerCase());
	commandFactory.registerCommand<OpenLotteryContainerCommand>(String("openLotteryContainer").toLowerCase());
	commandFactory.registerCommand<CloseLotteryContainerCommand>(String("closeLotteryContainer").toLowerCase());
	commandFactory.registerCommand<RequestQuestTimersAndCountersCommand>(String("requestQuestTimersAndCounters").toLowerCase());
	commandFactory.registerCommand<EjectCommand>(String("eject").toLowerCase());
	commandFactory.registerCommand<LaunchIntoSpaceCommand>(String("launchIntoSpace").toLowerCase());
	commandFactory.registerCommand<UnstickCommand>(String("unstick").toLowerCase());
	commandFactory.registerCommand<WaypointCommand>(String("waypoint").toLowerCase());
	commandFactory.registerCommand<CreateVendorCommand>(String("createVendor").toLowerCase());
	commandFactory.registerCommand<PilotShipCommand>(String("pilotShip").toLowerCase());
	commandFactory.registerCommand<UnpilotShipCommand>(String("unpilotShip").toLowerCase());
	commandFactory.registerCommand<LeaveStationCommand>(String("leaveStation").toLowerCase());
	commandFactory.registerCommand<OpenWingsCommand>(String("openWings").toLowerCase());
	commandFactory.registerCommand<CloseWingsCommand>(String("closeWings").toLowerCase());
	commandFactory.registerCommand<LaunchMissileCommand>(String("launchMissile").toLowerCase());
	commandFactory.registerCommand<LaunchCountermeasureCommand>(String("launchCountermeasure").toLowerCase());
	commandFactory.registerCommand<BoosterOnCommand>(String("boosterOn").toLowerCase());
	commandFactory.registerCommand<BoosterOffCommand>(String("boosterOff").toLowerCase());
	commandFactory.registerCommand<InspectCommand>(String("inspect").toLowerCase());
	commandFactory.registerCommand<DockCommand>(String("dock").toLowerCase());
	commandFactory.registerCommand<PumpreactorCommand>(String("pumpreactor").toLowerCase());
	commandFactory.registerCommand<IffscrambleCommand>(String("iffscramble").toLowerCase());
	commandFactory.registerCommand<DroidCommand>(String("droid").toLowerCase());
	commandFactory.registerCommand<LootAllCommand>(String("lootAll").toLowerCase());
	commandFactory.registerCommand<ServerAsteroidDataListenCommand>(String("serverAsteroidDataListen").toLowerCase());
	commandFactory.registerCommand<ServerAsteroidDataStopListeningCommand>(String("serverAsteroidDataStopListening").toLowerCase());
	commandFactory.registerCommand<DisableTargetCommand>(String("disableTarget").toLowerCase());
	commandFactory.registerCommand<DestroyTargetCommand>(String("destroyTarget").toLowerCase());
	commandFactory.registerCommand<SendFormObjectDataCommand>(String("sendFormObjectData").toLowerCase());
	commandFactory.registerCommand<WaypointCommand>(String("waypoint").toLowerCase());
	commandFactory.registerCommand<InspacerepairCommand>(String("inspacerepair").toLowerCase());
	commandFactory.registerCommand<LightEngineScrambleCommand>(String("lightEngineScramble").toLowerCase());
	commandFactory.registerCommand<HyperspaceCommand>(String("hyperspace").toLowerCase());
	commandFactory.registerCommand<AborthyperspaceCommand>(String("aborthyperspace").toLowerCase());
	commandFactory.registerCommand<EweaponsCommand>(String("eweapons").toLowerCase());
	commandFactory.registerCommand<EshieldsCommand>(String("eshields").toLowerCase());
	commandFactory.registerCommand<EthrustCommand>(String("ethrust").toLowerCase());
	commandFactory.registerCommand<VrepairCommand>(String("vrepair").toLowerCase());
	commandFactory.registerCommand<Bstrike1Command>(String("bstrike1").toLowerCase());
	commandFactory.registerCommand<Bstrike2Command>(String("bstrike2").toLowerCase());
	commandFactory.registerCommand<Bstrike3Command>(String("bstrike3").toLowerCase());
	commandFactory.registerCommand<Ptrap1Command>(String("ptrap1").toLowerCase());
	commandFactory.registerCommand<Ptrap2Command>(String("ptrap2").toLowerCase());
	commandFactory.registerCommand<Epulse1Command>(String("epulse1").toLowerCase());
	commandFactory.registerCommand<Epulse2Command>(String("epulse2").toLowerCase());
	commandFactory.registerCommand<Epulse3Command>(String("epulse3").toLowerCase());
	commandFactory.registerCommand<NblastCommand>(String("nblast").toLowerCase());
	commandFactory.registerCommand<VrepairotherCommand>(String("vrepairother").toLowerCase());
	commandFactory.registerCommand<UndockCommand>(String("undock").toLowerCase());
	commandFactory.registerCommand<Jstart1Command>(String("jstart1").toLowerCase());
	commandFactory.registerCommand<Jstart2Command>(String("jstart2").toLowerCase());
	commandFactory.registerCommand<Jstart3Command>(String("jstart3").toLowerCase());
	commandFactory.registerCommand<EscapePodCommand>(String("escapePod").toLowerCase());
	commandFactory.registerCommand<InspacereloadCommand>(String("inspacereload").toLowerCase());
	commandFactory.registerCommand<InspacerrCommand>(String("inspacerr").toLowerCase());
	commandFactory.registerCommand<RequestSpaceTrainerCommand>(String("requestSpaceTrainer").toLowerCase());

	commandFactory.registerCommand<AnimCommand>(String("anim").toLowerCase());
	commandFactory.registerCommand<AttackNpcCommand>(String("attacknpc").toLowerCase());
	commandFactory.registerCommand<AttackRpCommand>(String("attackrp").toLowerCase());
	commandFactory.registerCommand<RpreloadCommand>(String("rpreload").toLowerCase());
	commandFactory.registerCommand<RpRepairCommand>(String("rprepair").toLowerCase());
	commandFactory.registerCommand<D20Command>(String("d20").toLowerCase());
	commandFactory.registerCommand<DmCommand>(String("dm").toLowerCase());
	commandFactory.registerCommand<EndTurnCommand>(String("endturn").toLowerCase());
	commandFactory.registerCommand<HpCommand>(String("hp").toLowerCase());
	commandFactory.registerCommand<MsgDmCommand>(String("msgdm").toLowerCase());
	commandFactory.registerCommand<NFaceCommand>(String("nface").toLowerCase());
	commandFactory.registerCommand<NFollowCommand>(String("nfollow").toLowerCase());
	commandFactory.registerCommand<NStayCommand>(String("nstay").toLowerCase());
	commandFactory.registerCommand<NTargetCommand>(String("ntarget").toLowerCase());
	commandFactory.registerCommand<RDebugCommand>(String("rdebug").toLowerCase());
	commandFactory.registerCommand<RestRpCommand>(String("restrp").toLowerCase());
	commandFactory.registerCommand<RpCommand>(String("rp").toLowerCase());
	commandFactory.registerCommand<SetCombatCommand>(String("setcombat").toLowerCase());
	commandFactory.registerCommand<SkillRpCommand>(String("skillrp").toLowerCase());
	commandFactory.registerCommand<ToolCommand>(String("tool").toLowerCase());
	commandFactory.registerCommand<TrainCommand>(String("train").toLowerCase());
	commandFactory.registerCommand<VoxCommand>(String("vox").toLowerCase());
	commandFactory.registerCommand<RpForceCommand>(String("rpforce").toLowerCase());
	commandFactory.registerCommand<PingCommand>(String("ping").toLowerCase());
	commandFactory.registerCommand<ToggleBioCommand>(String("togglebio").toLowerCase());
	commandFactory.registerCommand<RSCommand>(String("rs").toLowerCase());
	commandFactory.registerCommand<DSCommand>(String("ds").toLowerCase());
	commandFactory.registerCommand<CommCommand>(String("comm").toLowerCase());

	commandFactory.registerCommand<AimedattackCommand>(String("aimedattack").toLowerCase());
	commandFactory.registerCommand<PowerattackCommand>(String("powerattack").toLowerCase());
	commandFactory.registerCommand<FlurryattackCommand>(String("flurryattack").toLowerCase());
	commandFactory.registerCommand<TurnhelpCommand>(String("turnhelp").toLowerCase());
	commandFactory.registerCommand<RpimphealCommand>(String("rpimpheal").toLowerCase());
	commandFactory.registerCommand<RpsliceCommand>(String("rpslice").toLowerCase());
	commandFactory.registerCommand<RpfmanipulateCommand>(String("rpfmanipulate").toLowerCase());
	commandFactory.registerCommand<RpfpushCommand>(String("rpfpush").toLowerCase());
	commandFactory.registerCommand<RpfpullCommand>(String("rpfpull").toLowerCase());
	commandFactory.registerCommand<RpfgripCommand>(String("rpfgrip").toLowerCase());
	commandFactory.registerCommand<RpfcrushCommand>(String("rpfcrush").toLowerCase());
	commandFactory.registerCommand<RpfspeedCommand>(String("rpfspeed").toLowerCase());
	commandFactory.registerCommand<RpfjumpCommand>(String("rpfjump").toLowerCase());
	commandFactory.registerCommand<RpfabsorbCommand>(String("rpfabsorb").toLowerCase());
	commandFactory.registerCommand<RpfdefenseCommand>(String("rpfdefense").toLowerCase());
	commandFactory.registerCommand<RpfpersuadeCommand>(String("rpfpersuade").toLowerCase());
	commandFactory.registerCommand<RpfreadCommand>(String("rpfread").toLowerCase());
	commandFactory.registerCommand<RpftrickCommand>(String("rpftrick").toLowerCase());
	commandFactory.registerCommand<RpfdominateCommand>(String("rpfdominate").toLowerCase());
	commandFactory.registerCommand<RpfshockCommand>(String("rpfshock").toLowerCase());
	commandFactory.registerCommand<RpflightningCommand>(String("rpflightning").toLowerCase());
	commandFactory.registerCommand<RpfchainCommand>(String("rpfchain").toLowerCase());
	commandFactory.registerCommand<RpfstormCommand>(String("rpfstorm").toLowerCase());
	commandFactory.registerCommand<RpfstealthCommand>(String("rpfstealth").toLowerCase());
	commandFactory.registerCommand<RpfflashCommand>(String("rpfflash").toLowerCase());
	commandFactory.registerCommand<RpftwistCommand>(String("rpftwist").toLowerCase());
	commandFactory.registerCommand<RpfprojectCommand>(String("rpfproject").toLowerCase());
	commandFactory.registerCommand<RpfsthrowCommand>(String("rpfsthrow").toLowerCase());
	commandFactory.registerCommand<RpaddstateCommand>(String("rpaddstate").toLowerCase());
	commandFactory.registerCommand<RpstimpackCommand>(String("rpstimpack").toLowerCase());

	commandFactory.registerCommand<RpfbodyCommand>(String("rpfbody").toLowerCase());
	commandFactory.registerCommand<RpfmeditateCommand>(String("rpfmeditate").toLowerCase());
	commandFactory.registerCommand<RpfdeflectCommand>(String("rpfdeflect").toLowerCase());
	commandFactory.registerCommand<RpgfocusCommand>(String("rpgfocus").toLowerCase());
	commandFactory.registerCommand<RpfrageCommand>(String("rpfrage").toLowerCase());
	commandFactory.registerCommand<RpfhealCommand>(String("rpfheal").toLowerCase());
	commandFactory.registerCommand<RpftargethealCommand>(String("rpftargetheal").toLowerCase());
	commandFactory.registerCommand<RpfsightCommand>(String("rpfsight").toLowerCase());
	commandFactory.registerCommand<RpfprecogCommand>(String("rpfprecog").toLowerCase());

	commandFactory.registerCommand<RpsetstanceCommand>(String("rpsetstance").toLowerCase());
	commandFactory.registerCommand<RpmoveCommand>(String("rpmove").toLowerCase());

	commandFactory.registerCommand<HolsterCommand>(String("holster").toLowerCase());
	commandFactory.registerCommand<StowCommand>(String("stow").toLowerCase());
	commandFactory.registerCommand<ToggleOocCommand>(String("toggleooc").toLowerCase());
	commandFactory.registerCommand<ToggleGripCommand>(String("togglegrip").toLowerCase());

}
