/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RACES_H_
#define RACES_H_

#include "system/lang.h"

const static char* Species[] = {

	//Vanilla Species
	"human", 			// human male
	"trandoshan", 		// trandoshan male
	"twilek", 			// twilek male
	"bothan", 			// bothan male
	"zabrak", 			// zabrak male
	"rodian", 			// rodian male
 	"moncal", 			// moncal male
	"wookiee", 			// wookiee male
	"sullustan", 		// sullustan male
	"ithorian",			// ithorian male
	"human", 			// human female
	"trandoshan", 		// trandoshan female
	"twilek", 			// twilek female
	"bothan", 			// bothan female
	"zabrak", 			// zabrak female
	"rodian", 			// rodian female
	"moncal", 			// moncal female
	"wookiee", 			// wookiee female
	"sullustan", 		// sullustan female
	"ithorian",  		// ithorian female

	//DR Species
	"aqualish",			// female aqualish
	"aqualish",			// male aqualish
    "arcona", 			// male arcona
	"bith",				// female bith
	"bith",				// male bith
	"chadra_fan", 		// female chadra fan
	"chadra_fan", 		// male chadra fan
	"chiss", 			// female chiss
	"chiss", 			// male chiss
	"devaronian", 		// female devaronian
	"devaronian", 		// male devaronian
	"dug",				// male dug
	"geonosian", 		// male geonosian
	"gotal",			// male gotal
	"gran", 			// male gran
	"hutt", 			// female hutt
	"hutt", 			// male hutt
	"iktotchi", 		// male iktotchi
	"ishi_tib", 		// male ishi tib
    "kel_dor", 			// male kel dor
	"kubaz", 			// male kubaz
	"nautolan", 		// female Nautolan
	"nautolan", 		// male Nautolan
	"nightsister", 		// female nightsister
	"nikto", 			// male nikto
	"quarren", 			// male quarren
	"smc", 				// female singing mountain clan witch
	"talz",				// male talz
	"toydarian",		// male toydarian
	"weequay" ,			// male weequay

	// AEI species
	"jawa",				// male jawa
	"miraluka", 		// female miraluka
	"miraluka", 		// male miraluka
	"mirialan",			// female mirialan
	"mirialan",			// male mirialan
    "zeltron", 			// female zeltron
    "zeltron", 			// male zeltron
	"togruta", 			// female Togruta
	"togruta", 			// male Togruta
	"rattataki", 		// female rattataki
	"rattataki", 		// male rattataki
};

const static int TemplateSpecies[] = { //hex code for species number

	//Vanilla species
		0,		// male human
		2,		// male trandoshan
		6,		// male twilek
		5,		// male bothan
		7,		// male zabrak
		1,		// male rodian
		3,		// male moncal
		4,		// male wookiee
		0x31,	// male sullustan
		0x21,	// male ithorian
		0,		// female human
		2,		// female trandoshan
		6,		// female twilek
		5,		// female bothan
		7,		// female zabrak
		1,		// female rodian
		3,		// female moncal
		4,		// female wookiee
		0x31,	// female sullustan
		0x21,	// female ithorian

	//DR species
		9, 		// female aqualish
		9, 		// male aqualish
        0x0a, 	// male arcona
		0x0c, 	// female bith
		0x0c, 	// male bith
		0x0e, 	// female chadra fan
		0x0e, 	// male chadra fan
		0xe6, 	// female chiss
		0xe6, 	// male chiss
		0x11, 	// female devaronian
		0x11, 	// male devaronian
		0x13,	// male dug
		0xe4, 	// male geonosian
		0x1b,	// male gotal
		0x1c, 	// male gran
		0x1f, 	// female hutt
		0x1f, 	// male hutt
		0xe7, 	// male iktotchi
		0x20, 	// male ishi tib
	    0xe8, 	// male kel dor
		0x27, 	// male kubaz
		0xe9, 	// female Nautolan
		0xe9, 	// male Nautolan
		0xea, 	// female nightsister
		0x2a, 	// male nikto
		0x2e, 	// male quarren
		0xea, 	// female singing mountain clan witch
		0x32,	// male talz
		0x35,	// male toydarian
		0x37,	// male weequay

	// AEI species
		0x22,	// male jawa
		0xeb, 	// female miraluka
		0xeb, 	// male miraluka
		0xec,	// female mirialan
		0xec,	// male mirialan
 	    0xed, 	// female zeltron
 	    0xed, 	// male zeltron
		0xee, 	// female Togruta
		0xee, 	// male Togruta
		0xef, 	// female rattataki
		0xef, 	// male rattataki

};

const static char* Gender[] = {
	"male", 	// human male
	"male", 	// trandoshan male
	"male", 	// twilek male
	"male", 	// bothan male
	"male", 	// zabrak male
	"male", 	// rodian male
	"male", 	// moncal male
	"male", 	// wookiee male
	"male", 	// sullustan male
	"male", 	// ithorian male
	"female", 	// human female
	"female", 	// trandoshan female
	"female", 	// twilek female
	"female", 	// bothan female
	"female", 	// zabrak female
	"female", 	// rodian female
	"female", 	// moncal female
	"female", 	// wookiee female
	"female", 	// sullustan female
	"female", 	// ithorian female

	//DR Species
	"female",	// female aqualish
	"male",		// male aqualish
    "male", 	// male arcona
	"female",	// female bith
	"male",		// male bith
	"female", 	// female chadra fan
	"male", 	// male chadra fan
	"female", 	// female chiss
	"male", 	// male chiss
	"female", 	// female devaronian
	"male", 	// male devaronian
	"male",		// male dug
	"male", 	// male geonosian
	"male",		// male gotal
	"male", 	// male gran
	"female", 	// female hutt
	"male", 	// male hutt
	"male", 	// male iktotchi
	"male", 	// male ishi tib
    "male", 	// male kel dor
	"male", 	// male kubaz
	"female", 	// female Nautolan
	"male", 	// male Nautolan
	"female", 	// female nightsister
	"male", 	// male nikto
	"male", 	// male quarren
	"female", 	// female singing mountain clan witch
	"male",		// male talz
	"male",		// male toydarian
	"male" ,	// male weequay

	// AEI species
	"male",		// male jawa
	"female", 	// female miraluka
	"male", 	// male miraluka
	"female",	// female mirialan
	"male",		// male mirialan
    "female", 	// female zeltron
    "male", 	// male zeltron
	"female", 	// female Togruta
	"male", 	// male Togruta
	"female", 	// female rattataki
	"male", 	// male rattataki   
};

const static char* RaceStrs[] = {
	//Vanilla species
	"object/creature/player/shared_human_male.iff", 		// human male
	"object/creature/player/shared_trandoshan_male.iff", 	// trandoshan male
	"object/creature/player/shared_twilek_male.iff", 		// twilek male
	"object/creature/player/shared_bothan_male.iff", 		// bothan male
	"object/creature/player/shared_zabrak_male.iff", 		// zabrak male
	"object/creature/player/shared_rodian_male.iff", 		// rodian male
	"object/creature/player/shared_moncal_male.iff", 		// moncal male
	"object/creature/player/shared_wookiee_male.iff", 		// wookiee male
	"object/creature/player/shared_sullustan_male.iff", 	// sullustan male
	"object/creature/player/shared_ithorian_male.iff", 		// ithorian male
	"object/creature/player/shared_human_female.iff", 		// human female
	"object/creature/player/shared_trandoshan_female.iff", 	// trandoshan female
	"object/creature/player/shared_twilek_female.iff", 		// twilek female
	"object/creature/player/shared_bothan_female.iff", 		// bothan female
	"object/creature/player/shared_zabrak_female.iff", 		// zabrak female
	"object/creature/player/shared_rodian_female.iff", 		// rodian female
	"object/creature/player/shared_moncal_female.iff", 		// moncal female
	"object/creature/player/shared_wookiee_female.iff", 	// wookiee female
	"object/creature/player/shared_sullustan_female.iff", 	// sullustan female
	"object/creature/player/shared_ithorian_female.iff",  	// ithorian female


    //DR added species
    "object/creature/player/shared_aqualish_female.iff",   // female aqualish
    "object/creature/player/shared_aqualish_male.iff",     // male aqualish
    "object/creature/player/shared_arcona_male.iff",       // male arcona
    "object/creature/player/shared_bith_female.iff",       // female bith
    "object/creature/player/shared_bith_male.iff",         // male bith
    "object/creature/player/shared_chadra_fan_female.iff", // female chadra fan
    "object/creature/player/shared_chadra_fan_male.iff",   // male chadra fan
    "object/creature/player/shared_chiss_female.iff",      // female chiss
    "object/creature/player/shared_chiss_male.iff",        // male chiss
    "object/creature/player/shared_devaronian_female.iff", // female devaronian
    "object/creature/player/shared_devaronian_male.iff",   // male devaronian
    "object/creature/player/shared_dug_male.iff",          // male dug
    "object/creature/player/shared_geonosian_male.iff",    // male geonosian
    "object/creature/player/shared_gotal_male.iff",        // male gotal
    "object/creature/player/shared_gran_male.iff",         // male gran
    "object/creature/player/shared_hutt_female.iff",       // female hutt
    "object/creature/player/shared_hutt_male.iff",         // male hutt
    "object/creature/player/shared_iktotchi_male.iff",     // male iktotchi
    "object/creature/player/shared_ishi_tib_male.iff",     // male ishi tib
    "object/creature/player/shared_kel_dor_male.iff",      // male kel dor
    "object/creature/player/shared_kubaz_male.iff",        // male kubaz
    "object/creature/player/shared_nautolan_female.iff",   // female nautolan
    "object/creature/player/shared_nautolan_male.iff",     // male nautolan
    "object/creature/player/shared_nightsister_female.iff",// female nightsister
    "object/creature/player/shared_nikto_male.iff",        // male nikto
    "object/creature/player/shared_quarren_male.iff",      // male quarren
    "object/creature/player/shared_smc_female.iff",        // female dathomiri
    "object/creature/player/shared_talz_male.iff",         // male talz
    "object/creature/player/shared_toydarian_male.iff",    // male toydarian
    "object/creature/player/shared_weequay_male.iff",      // male weequay

    //AEI added species
    "object/creature/player/shared_jawa_male.iff",         // male jawa
    "object/creature/player/shared_miraluka_female.iff",   // female miraluka
    "object/creature/player/shared_miraluka_male.iff",     // male miraluka
    "object/creature/player/shared_mirialan_female.iff",   // female mirialan
    "object/creature/player/shared_mirialan_male.iff",     // male mirialan
    "object/creature/player/shared_zeltron_female.iff",    // female zeltron
    "object/creature/player/shared_zeltron_male.iff",      // male zeltron
    "object/creature/player/shared_togruta_female.iff",    // female togruta
    "object/creature/player/shared_togruta_male.iff",      // male togruta
    "object/creature/player/shared_rattataki_female.iff",  // female rattataki
    "object/creature/player/shared_rattataki_male.iff",    // male rattataki
};

const static char* CCRaceStrs[] = {
	//Vanilla species
	"object/creature/player/human_male.iff", 	// human male
	"object/creature/player/trandoshan_male.iff", 	// trandoshan male
	"object/creature/player/twilek_male.iff", 	// twilek male
	"object/creature/player/bothan_male.iff", 	// bothan male
	"object/creature/player/zabrak_male.iff", 	// zabrak male
	"object/creature/player/rodian_male.iff", 	// rodian male
	"object/creature/player/moncal_male.iff", 	// moncal male
	"object/creature/player/wookiee_male.iff", 	// wookiee male
	"object/creature/player/sullustan_male.iff", 	// sullustan male
	"object/creature/player/ithorian_male.iff", 	// ithorian male
	"object/creature/player/human_female.iff", 	// human female
	"object/creature/player/trandoshan_female.iff", // trandoshan female
	"object/creature/player/twilek_female.iff", 	// twilek female
	"object/creature/player/bothan_female.iff", 	// bothan female
	"object/creature/player/zabrak_female.iff", 	// zabrak female
	"object/creature/player/rodian_female.iff", 	// rodian female
	"object/creature/player/moncal_female.iff", 	// moncal female
	"object/creature/player/wookiee_female.iff", 	// wookiee female
	"object/creature/player/sullustan_female.iff", 	// sullustan female
	"object/creature/player/ithorian_female.iff",  	// ithorian female

    //DR added species
    "object/creature/player/aqualish_female.iff",   // female aqualish
    "object/creature/player/aqualish_male.iff",     // male aqualish
    "object/creature/player/arcona_male.iff",       // male arcona
    "object/creature/player/bith_female.iff",       // female bith
    "object/creature/player/bith_male.iff",         // male bith
    "object/creature/player/chadra_fan_female.iff", // female chadra fan
    "object/creature/player/chadra_fan_male.iff",   // male chadra fan
    "object/creature/player/chiss_female.iff",      // female chiss
    "object/creature/player/chiss_male.iff",        // male chiss
    "object/creature/player/devaronian_female.iff", // female devaronian
    "object/creature/player/devaronian_male.iff",   // male devaronian
    "object/creature/player/dug_male.iff",          // male dug
    "object/creature/player/geonosian_male.iff",    // male geonosian
    "object/creature/player/gotal_male.iff",        // male gotal
    "object/creature/player/gran_male.iff",         // male gran
    "object/creature/player/hutt_female.iff",       // female hutt
    "object/creature/player/hutt_male.iff",         // male hutt
    "object/creature/player/iktotchi_male.iff",     // male iktotchi
    "object/creature/player/ishi_tib_male.iff",     // male ishi tib
    "object/creature/player/kel_dor_male.iff",      // male kel dor
    "object/creature/player/kubaz_male.iff",        // male kubaz
    "object/creature/player/nautolan_female.iff",   // female nautolan
    "object/creature/player/nautolan_male.iff",     // male nautolan
    "object/creature/player/nightsister_female.iff",// female nightsister
    "object/creature/player/nikto_male.iff",        // male nikto
    "object/creature/player/quarren_male.iff",      // male quarren
    "object/creature/player/smc_female.iff",        // female dathomiri
    "object/creature/player/talz_male.iff",         // male talz
    "object/creature/player/toydarian_male.iff",    // male toydarian
    "object/creature/player/weequay_male.iff",      // male weequay

    //AEI added species
    "object/creature/player/jawa_male.iff",         // male jawa
    "object/creature/player/miraluka_female.iff",   // female miraluka
    "object/creature/player/miraluka_male.iff",     // male miraluka
    "object/creature/player/mirialan_female.iff",   // female mirialan
    "object/creature/player/mirialan_male.iff",     // male mirialan
    "object/creature/player/zeltron_female.iff",    // female zeltron
    "object/creature/player/zeltron_male.iff",      // male zeltron
    "object/creature/player/togruta_female.iff",    // female togruta
    "object/creature/player/togruta_male.iff",      // male togruta
    "object/creature/player/rattataki_female.iff",  // female rattataki
    "object/creature/player/rattataki_male.iff",    // male rattataki
};

//This is the CRC of the shared template path full name, CRC-32/BZIP2
static uint32 SharedRace[] = { //race CRC
	//Vanilla species
	0xAF1DC1A1, // human male
	0x50C45B8F, // trandoshan male
	0xF280E27B, // twi'lek male
	0x5BF77F33, // bothan male
	0xE204A556, // zabrak male
	0x0BF9CD9C, // rodian male
	0xB9C855A8, // moncal male
	0x0564791D, // wookiee male
	0x0B9399A4, // sullustan male
	0x38BAC7C4, // ithorian male
	0xFFFFBBE9, // human female
	0x183C24C6, // trandoshan female
	0x849752DC, // twi'lek female
	0x1D52730E, // bothan female
	0xA9E35FFD, // zabrak female
	0xC264245B, // rodian female
	0x982FBFDE, // moncal female
	0x0DAB65E2, // wookiee female
	0x1573341A, // sullustan female
	0xB3E08013, // ithorian female

	//DR species
	0xDE63F629, // aqualish female
	0xCEF4B4A1, // aqualish male
    0xA2A87F6E, // Arcona Male
	0xB2C9CBE0, // bith female
	0x73C992FF, // bith male
	0xC6B705B4, // female chadra fan
	0xF9504963, // male chadra fan
	0x614A1B68, // chiss female
	0x02F60EAC, // chiss male
	0x00000000, // devaronian female
	0x68731058, // devaronian male
	0x696718D6, // male dug
	0x0D506AEA, // male geonosian
	0x30CFFED2, // gotal male
	0xC2872D34, // gran male
	0xE0B607C0, // hutt female
	0x916443F9, // hutt male
    0xF9B11C30, // iktotchi male
	0x809EF398, // ishi tib male
    0x66DCE6EE, // Kel Dor Male
	0x6BB072FA, // male kubaz
	0x00000000, // nautolan female
	0xAB03ACB1, // nautolan male
	0xC56D9790, // nightsister female
	0x59ECB38B, // nikto male
	0x3435F686, // quarren male
	0x82A138F9, // smc female
	0xDBA89F7C, // talz male
	0x3E751C09, // male toydarian
	0x4F0718B5, // weequay male

	//AEI species
	0x00000000, // jawa male
	0x7D1266D2, // miraluka female
	0x07BE9747, // miraluka male
	0x00000000, // mirialan female
	0x00000000, // mirialan male
    0x5B779FE7, // Zeltron Female
	0xE8975526, // Zeltron Male
	0x3D953B50, // togruta female
	0x00000000, // togruta male
	0xB8B4F101, //female rattataki
	0x1CD4393C, //male rattataki
};

const static char* MoodStr[][2]= {
	{"none", "neutral"},
	{"absentminded", "neutral"},
	{"amazed", "neutral"},
	{"amused", "happy"},
	{"angry", "angry"},
	{"approving", "neutral"},
	{"bitter", "neutral"},
	{"bloodthirsty", "neutral"},
	{"brave", "neutral"},
	{"callous", "neutral"},
	{"careful", "neutral"},
	{"careless", "neutral"},
	{"casual", "neutral"},
	{"clinical", "neutral"},
	{"cocky", "neutral"},
	{"cold", "neutral"},
	{"compassionate", "neutral"},
	{"condescending", "neutral"},
	{"confident", "neutral"},
	{"confused", "neutral"},
	{"content", "happy"},
	{"courtly", "neutral"},
	{"coy", "neutral"},
	{"crude", "neutral"},
	{"cruel", "neutral"},
	{"curious", "neutral"},
	{"cynical", "neutral"},
	{"defensive", "neutral"},
	{"depressed", "unhappy"},
	{"devious", "neutral"},
	{"dimwitted", "neutral"},
	{"disappointed", "unhappy"},
	{"discreet", "neutral"},
	{"disgruntled", "disgruntled"},
	{"disgusted", "neutral"},
	{"dismayed", "unhappy"},
	{"disoriented", "neutral"},
	{"distracted", "neutral"},
	{"doubtful", "neutral"},
	{"dramatic", "neutral"},
	{"dreamy", "neutral"},
	{"drunk", "neutral"},
	{"earnest", "neutral"},
	{"ecstatic", "happy"},
	{"embarrassed", "neutral"},
	{"emphatic", "neutral"},
	{"encouraging", "neutral"},
	{"enthusiastic", "neutral"},
	{"evil", "neutral"},
	{"exasperated", "disgruntled"},
	{"exuberant", "happy"},
	{"fanatical", "neutral"},
	{ "forgive", "neutral"},
	{"frustrated", "neutral"},
	{"guilty", "neutral"},
	{"happy", "happy"},
	{"honest", "neutral"},
	{"hopeful", "neutral"},
	{"hopeless", "neutral"},
	{"humble", "neutral"},
	{"hysterical", "neutral"},
	{"imploring", "neutral"},
	{"indifferent", "neutral"},
	{"indignant", "angry"},
	{"interested", "neutral"},
	{"jealous", "neutral"},
	{"joyful", "happy"},
	{"lofty", "neutral"},
	{"loud", "neutral"},
	{"loving", "neutral"},
	{"lustful", "neutral"},
    {"mean", "neutral"},
    {"mischievous", "neutral"},
    {"nervous", "neutral"},
    {"neutral", "neutral"},
    {"offended", "neutral"},
    {"optimistic", "neutral"},
    {"pedantic", "neutral"},
    {"pessimistic", "neutral"},
    {"petulant", "neutral"},
    {"philosophical", "neutral"},
    {"pitying", "neutral"},
    {"playful", "happy"},
    {"polite", "neutral"},
    {"pompous", "neutral"},
    {"proud", "neutral"},
    {"provocative", "neutral"},
    {"puzzled", "neutral"},
    {"regretful", "unhappy"},
    {"relieved", "neutral"},
    {"reluctant", "neutral"},
    {"resigned", "neutral"},
    {"respectful", "neutral"},
    {"romantic", "neutral"},
    {"rude", "neutral"},
    {"sad", "unhappy"},
    {"sarcastic", "neutral"},
    {"scared", "neutral"},
    {"scolding", "neutral"},
    {"scornful", "neutral"},
    {"serious", "neutral"},
    {"shameless", "neutral"},
    {"shocked", "neutral"},
    {"shy", "neutral"},
    {"sincere", "neutral"},
    {"sleepy", "neutral"},
    {"sly", "neutral"},
    {"smug", "neutral"},
    {"snobby", "neutral"},
    {"sorry", "neutral"},
    {"spiteful", "neutral"},
    {"stubborn", "neutral"},
    {"sullen", "neutral"},
    {"suspicious", "neutral"},
    {"taunting", "neutral"},
    {"terrified", "neutral"},
    {"thankful", "neutral"},
    {"thoughtful", "neutral"},
    {"tolerant", "neutral"},
    {"uncertain", "neutral"},
    {"unhappy", "unhappy"},
    {"unwilling", "neutral"},
    {"warm", "neutral"},
    {"whiny", "neutral"},
    {"wicked", "neutral"},
    {"wistful", "neutral"},
    {"worried", "worried"},
    {"tired", "neutral"},
    {"exhausted", "neutral"},
    {"friendly", "happy"},
    {"timid", "neutral"},
    {"lazy", "neutral"},
    {"surprised", "worried"},
    {"innocent", "happy"},
    {"wise", "neutral"},
    {"youthful", "neutral"},
    {"adventurous", "neutral"},
    {"annoyed", "angry"},
    {"perturbed", "unhappy"},
    {"sedate", "neutral"},
    {"calm", "neutral"},
    {"suffering", "unhappy"},
    {"hungry", "neutral"},
    {"thirsty", "neutral"},
    {"alert", "neutral"},
    {"shifty", "neutral"},
    {"relaxed", "neutral"},
    {"crotchety", "angry"},
    {"surly", "angry"},
    {"painful", "unhappy"},
    {"wounded", "unhappy"},
    {"bubbly", "happy"},
    {"heroic", "neutral"},
    {"quiet", "neutral"},
    {"remorseful", "unhappy"},
    {"grumpy", "angry"},
    {"logical", "neutral"},
    {"emotional", "neutral"},
    {"troubled", "unhappy"},
    {"panicked", "worried"},
    {"nice", "happy"},
    {"cheerful", "happy"},
    {"emotionless", "neutral"},
    {"gloomy", "unhappy"},
    {"ambivalent", "neutral"},
    {"envious", "neutral"},
    {"vengeful", "angry"},
    {"fearful", "worried"},
    {"enraged", "angry"},
    {"sheepish", "happy"},
    {"belligerent", "angry"},
    {"obnoxious", "neutral"},
    {"fastidious", "neutral"},
    {"squeamish", "unhappy"},
    {"dainty", "neutral"},
    {"dignified", "neutral"},
    {"haughty", "neutral"},
    {"obscure", "neutral"},
    {"goofy", "happy"},
    {"silly", "happy"},
    {"disdainful", "neutral"},
    {"contemptuous", "neutral"},
    {"diplomatic", "neutral"},
    {"wary", "neutral"},
    {"malevolent", "angry"},
    {"hurried", "neutral"},
    {"patient", "neutral"},
    {"firm", "neutral"},
    {"meditating", "meditating"},
	{"entertained", "entertained"}

};

static unsigned int attributeLimits[85][19] = { //HAM
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{550, 1250,	600,  800,	700,  800, 300,	1000, 300,  	450, 300,  400,	300, 1000, 300,	 500, 300,	600, 5550},
		{300, 1000,	300,  500,	550,  650, 550,	1250, 600,	750, 300,  400,	400, 1100, 300,	 500, 300,	500, 5400},
		{300, 1000,	300,  500,	300,  400, 600,	1300, 600,	750, 400,  500,	400, 1100, 400,	 600, 300,	500, 5400},
		{500, 1200,	300,  500,	300,  400, 600,	1300, 300,	450, 300,  400,	300, 1000, 300,	 500, 700,	900, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1200, 300,	650, 450,  850,	300, 1000, 300,	 500, 350,	550, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1000, 300,	450, 450,  550,	600, 1300, 600,	 800, 450,	650, 5400},
		{650, 1350,	650,  850,	450,  550, 500,	1200, 400,	550, 400,  500,	400, 1100, 450,	 650, 400,	600, 6100},
		{300, 1200,	300,  500,	300,  400, 600,	1400, 300,	750, 300,  500,	400, 1200, 400,	 600, 300,	600, 5400},
		{300, 1400,	300,  600,	300,  500, 600,	1100, 300,	750, 300,  500,	400, 1300, 400,	 600, 300,	500, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{550, 1250,	600,  800,	700,  800, 300,	1000, 300,  	450, 300,  400,	300, 1000, 300,	 500, 300,	600, 5550},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
        {400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400},
		{400, 1100,	400, 1100,  	400, 1100, 400, 1100, 400, 	1100, 400, 1100,400, 1100, 400,	1100, 400, 	1100, 5400}
};

class Races {
public:
	inline const static char* getRace(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return RaceStrs[raceid];
	}

	inline static int getSpeciesID(int raceid) {
		if (raceid < 0 || raceid > 85)
			return 0;

		return TemplateSpecies[raceid];
	}

	inline const static char* getMood(int moodid) {
		if (moodid < 0 || moodid > 189)
			return "";

		return MoodStr[moodid][0];
	}

	inline const static char* getSpecies(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return Species[raceid];
	}

	inline const static char* getGender(int raceid) {
		if (raceid < 0 || raceid > 85)
			return "";

		return Gender[raceid];
	}

	inline static uint32 getRaceCRC(int raceid) {
		if (raceid < 0 || raceid > 85)
			return 0;

		return SharedRace[raceid];
	}

	inline static const char* getCompleteRace(uint32 sharedRaceCRC) {
		int race = -1;
		for (int i = 0; i < 47; ++i) {
			if (SharedRace[i] == sharedRaceCRC) {
				race = i;
				break;
			}
		}

		if (race == -1)
			return "";
		else
			return CCRaceStrs[race];
	}

	inline static int getRaceID(const String& name) {
    	for (int i = 0; i < 85; i++) {
        	if (strcmp(name.toCharArray(), CCRaceStrs[i]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline static int getMoodID(const String& name) {
    	for (int i = 0; i < 190; i++) {
        	if (strcmp(name.toCharArray(), MoodStr[i][0]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline const static char* getMoodStr(const String& name) {
		for (int i = 0; i < 190; i++) {
			if (strcmp(name.toCharArray(), MoodStr[i][0]) == 0)
				return MoodStr[i][1];
		}

		return MoodStr[0][1];
	}

	inline static unsigned int * getAttribLimits(int raceid) {
		return attributeLimits[raceid % 10];
	}

};

#endif /*RACES_H_*/
