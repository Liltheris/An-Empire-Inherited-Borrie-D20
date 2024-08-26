character_creation = ConvoTemplate:new {
  initialScreen = "greeting",
  templateType = "Lua",
  luaClassHandler = "character_creation_convo_handler",
  screens = {}
}

local screen = ConvoScreen:new {
  id = "greeting",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "return_menu",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "leave",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "invalid",
  customDialogText = "It appears that your character is invalid. Please contact Adminstration if you believe this is in error.",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

--Starting planets
screen = ConvoScreen:new {
  id = "start_carida",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_tatooine",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_rori",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_ord_mantell",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_sulon",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_dantooine",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_naboo",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "start_mandalore",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

--Mando helmet stuff

screen = ConvoScreen:new {
  id = "mando",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "mando_helmet_s01",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "mando_helmet_s02",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "mando_helmet_beta",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "mando_helmet_imp",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "mando_helmet_reb",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)



screen = ConvoScreen:new {
  id = "next_step",
  customDialogText = "ERROR",
  stopConversation = "false",
  options = {}
}
character_creation:addScreen(screen)

screen = ConvoScreen:new {
  id = "abort",
  customDialogText = "Return when you are ready, my friend.",
  stopConversation = "true",
  options = {}
}
character_creation:addScreen(screen)



addConversationTemplate("character_creation", character_creation);