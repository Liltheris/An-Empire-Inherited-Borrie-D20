const Discord = require('discord.js');
const Intents = require('discord.js');
const SWG = require('./swgclient');
const config = require('./config');
SWG.login(config.SWG);

var client, server, notif, chat, spatial, dmchat, notifRole;
function discordBot() {
    //client = new Discord.Client();
	client = new Discord.Client({ws:{intents:Intents.ALL}});

    client.on('message', message => {
        if (message.content.startsWith('!server')) {
            message.reply(SWG.isConnected ? "The server is UP!" : "The server is DOWN :(");
        }
        if (message.content.startsWith('!fixchat')) {
            message.reply("rebooting chat bot");
            process.exit(0);
        }
        if (message.content.startsWith('!pausechat')) {
            message.reply(SWG.paused ? "unpausing" : "pausing");
            SWG.paused = !SWG.paused;
        }
        if (message.channel.name != config.Discord.ChatChannel) return;
        if (message.author.username == config.Discord.BotName) return;
        SWG.sendChat(message.cleanContent, server.members.get(message.author.id).displayName);
    });

    client.on('disconnect', event => {
        try {notif.send("AEI-Bot disconnected");}catch(ex){}
        client = server = notif = chat = spatial = notifRole = dmchat = null;
        console.log("Discord disconnect: " + JSON.stringify(event,null,2));
        setTimeout(discordBot, 1000);
    });

    client.login(config.Discord.BotToken)
        .then(t => {
            client.user.setPresence({ status: "online", game: {name: "Facilitating OOC Chat"}});
            server = client.guilds.find("name", config.Discord.ServerName);
            notif = server.channels.find("name", config.Discord.NotificationChannel);
            chat = server.channels.find("name", config.Discord.ChatChannel);
			spatial = server.channels.find("name", config.Discord.SpatialChannel);
            dmchat = server.channels.find("name", config.Discord.DMChannel)
            notifRole = server.roles.find("name", config.Discord.NotificationMentionRole);
        })
        .catch(reason => {
            console.log(reason);
            setTimeout(discordBot, 1000);
        });
}
discordBot();

SWG.serverDown = function() {
    if (notif) notif.send(notifRole + " server DOWN");
}

SWG.serverUp = function() {
    if (notif) notif.send(notifRole + " server UP!");
}

SWG.reconnected = function() {
    if (chat) notif.send("chat bot reconnected"); //Change notif to chat to switch it back to speaking in chat.
}

SWG.recvChat = function(message, player) {
    console.log("sending chat to discord " + player + ": " + message);
    if (chat) chat.send("**" + player + ":**  " + message);
    else console.log("discord disconnected");
}

SWG.recvSpatialChat = function(message, player) {
    console.log("sending chat to discord " + player + ": " + message);
	var dataArray = message.split("::");

    // Chat type
	if(dataArray[0] == "") 
		dataArray[0] = "say";

    var languageID = Number(dataArray[1]);
    var mood = dataArray[2];
	var messageContent = dataArray[3];
	var spatialMsg = "msg.";
	
	if(dataArray[0] == "DM") {
		spatialMsg = "**-"+player+"-**\n```ini\n[" + messageContent + "]\n```";
	} else if(dataArray[0] == "emote") {
		spatialMsg = "**" + player + " " + messageContent + "**";
	} else if(dataArray[0] == "whisper") {
		spatialMsg = "**" + player + " whispers something unintelligible.**";
	} else if(messageContent[0] !== '(') {
		spatialMsg = "**" + player + " " + dataArray[0] + "s"+parseMood(mood)+",** \"" + messageContent + "\"" + parseLanguage(languageID); 
	} else {
		return;
	}
	
    if (spatial) spatial.send(spatialMsg);
    else console.log("discord disconnected");
}

SWG.recvTell = function(from, message) {
    console.log("received tell from: " + from + ": " + message);
    if (from != config.SWG.Character) SWG.sendTell(from, "OwO");
}

SWG.recvSystemMsg = function(message) {
    // Split the string into the data elements. Format should be [0]=Type, [1]=Sender, [n]=Data. Who differs.
    const dataArray = message.split("::");

    // Handle online player/DM output.
	if(dataArray[0] == "who") {
		var dataString = "AEI: Players: " + dataArray[1] + " DMs: " + dataArray[2];
		client.user.setPresence({ status: "online", game: {name: dataString}});

    // Handle in-game DM chat.
	} else if(dataArray[0] == "lw") {
        var dmName = dataArray[1].substring(17, dataArray[1].length - 8);
        var chatString = "**" + dmName + ":** " + dataArray[2];

        if (notif) notif.send(chatString);
        else console.log("discord disconnected");

    // Handle DM calls going to the DM channel.
    } else if(dataArray[0] == "dmcall") {
        var dmCall = "**--DM CALL: "+dataArray[1]+"--**"+"\n"+dataArray[2];

        if (dmchat) dmchat.send(dmCall);
        else console.log("discord disconnected");

    // Long rest reporting.
    } else if(dataArray[0] == "rest") {
        var rest = "**"+dataArray[1]+":** "+dataArray[2];

        if (notif) notif.send(rest);
        else console.log("discord disconnected");

    // Force reporting.
    } else if(dataArray[0] == "force") {
        var force = "**"+dataArray[1]+":** "+dataArray[2];

        if (notif) notif.send(force);
        else console.log("discord disconnected");
    }
}

setInterval(() => SWG.sendTell(config.SWG.Character, "ping"), 30000);

setInterval(() => SWG.sendTell(config.SWG.Character, "getwho"), 3000);

function parseMood(moodString){
    switch (moodString){
        case "default": return "";
        case "angry": return " angrily";
        case "bloodthirsty": return " bloodthirstily";
        case "cocky": return " cockily";
        case "courtly": return " courtily";
        case "dreamy": return " dreamily";
        case "drunk": return " drunkedly";
        case "emphatic": return " emphatically";
        case "evil": return " evily";
        case "forgive": return " forgivingly";
        case "guilty": return " guiltily";
        case "happy": return " happily";
        case "lofty": return " loftily";
        case "sleepy": return " sleepily";
        case "snobby": return " snobbily";
        case "sorry": return " with regret";
        case "whiny": return " whinily";
        case "friendly": return " friendlily";
        case "lazy": return " lazily";
        case "hungry": return " hungrily";
        case "thirsty": return " thirstily";
        case "shifty": return " shiftily";
        case "crotchety": return " crotchetily";
        case "surly": return " surlily";
        case "bubbly": return " bubblily";
        case "grumpy": return " grumpily";
        case "gloomy": return " gloomily";
        case "dainty": return " daintily";
        case "haughty": return " haughtily";
        case "goofy": return " goofily";
        case "silly": return " sillily";
        case "wary": return " warily";
        // Most mood strings work this way, thankfully.
        default: return " "+moodString+"ly";
    }
}

function parseLanguage(LanguageID){
    switch (LanguageID){
        // No need to show the language string for Basic.
        case 0: return "";
        case 1: return " in Rodian";
        case 2: return " in Doshan";
        case 3: return " in Moncalamarian";
        case 4: return " in Shyriiwook";
        case 5: return " in Bothese";
        case 6: return " in Ryl";
        case 7: return " in Zabrakii";
        case 8: return " in Lekku";
        case 9: return " in Ithorian";
        case 10: return " in Sullustan";
        case 11: return " in Cheunh";
        case 12: return " in Mando'a";
        case 13: return " in Miralukese";
        case 14: return " in Huttese";
        case 15: return " in Mirialan";
        case 16: return " in Jawaese";
        case 17: return " in Jawa Trade";
        case 18: return " in Sith";
        default: return "";
    }
}