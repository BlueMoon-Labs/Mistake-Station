// This is synced up to the poster placing animation.
#define PLACE_SPEED 30
#define ABOVE_SIGN_PLANE 3.5

// The poster item

/obj/item/poster
	name = "poorly coded poster"
	desc = "You probably shouldn't be holding this."
	icon = 'icons/obj/poster_old.dmi'
	force = 0
	resistance_flags = FLAMMABLE

/obj/item/poster/Initialize(mapload, obj/structure/sign/poster/new_poster_structure)
	. = ..()
	poster_structure = new_poster_structure
	if(!new_poster_structure && poster_type)
		poster_structure = new poster_type(src)

	// posters store what name and description they would like their
	// rolled up form to take.
	if(poster_structure)
		name = poster_structure.poster_item_name
		desc = poster_structure.poster_item_desc
		icon_state = poster_structure.poster_item_icon_state

		name = "[name] - [poster_structure.original_name]"

/obj/item/poster/Destroy()
	poster_structure = null
	. = ..()

// These icon_states may be overridden, but are for mapper's convinence
/obj/item/poster/random_contraband
	name = "random contraband poster"
	poster_type = /obj/structure/sign/poster/contraband/random
	icon_state = "rolled_contraband"

/obj/item/poster/random_official
	name = "random official poster"
	poster_type = /obj/structure/sign/poster/official/random
	icon_state = "rolled_legit"

// The poster sign/structure
/obj/structure/sign/poster
	name = "poster"
	desc = "A large piece of space-resistant printed paper."
	icon = 'icons/obj/poster.dmi'
	layer = ABOVE_SIGN_PLANE
	anchored = TRUE
	buildable_sign = FALSE //Cannot be unwrenched from a wall.

/obj/structure/sign/poster/Initialize(mapload)
	. = ..()
	if(random_basetype)
		randomise(random_basetype)
	if(!ruined)
		original_name = name // can't use initial because of random posters
		name = "poster - [name]"
		desc = "A large piece of space-resistant printed paper. [desc]"

	addtimer(CALLBACK(src, /datum.proc/_AddElement, list(/datum/element/beauty, 300)), 0)


/obj/structure/sign/poster/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER)
		I.play_tool_sound(src, 100)
		if(ruined)
			to_chat(user, "<span class='notice'>You remove the remnants of the poster.</span>")
			qdel(src)
		else
			to_chat(user, "<span class='notice'>You carefully remove the poster from the wall.</span>")
			roll_and_drop(user.loc)

/obj/structure/sign/poster/attack_hand(mob/living/user, act_intent = user.combat_mode, unarmed_attack_flags)
	if(ruined)
		return
	visible_message("[user] rips [src] in a single, decisive motion!" )
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)

	var/obj/structure/sign/poster/ripped/R = new(loc)
	R.pixel_y = pixel_y
	R.pixel_x = pixel_x
	R.add_fingerprint(user)
	qdel(src)

/obj/structure/sign/poster/ripped
	ruined = TRUE
	icon_state = "poster_ripped"
	name = "ripped poster"
	desc = "You can't make out anything from the poster's original print. It's ruined."

/obj/structure/sign/poster/random
	name = "random poster" // could even be ripped
	icon_state = "random_anything"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster

/obj/structure/sign/poster/contraband
	poster_item_name = "contraband poster"
	poster_item_desc = "This poster comes with its own automatic adhesive mechanism, for easy pinning to any vertical surface. Its vulgar themes have marked it as contraband aboard Nanotrasen space facilities."
	poster_item_icon_state = "rolled_contraband"

/obj/structure/sign/poster/contraband/random
	name = "random contraband poster"
	icon_state = "random_contraband"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/contraband

/obj/structure/sign/poster/contraband/free_tonto
	name = "Free Tonto"
	desc = "A salvaged shred of a much larger flag, colors bled together and faded from age."
	icon_state = "poster_2012"

/obj/structure/sign/poster/contraband/atmosia_independence
	name = "Atmosia Declaration of Independence"
	desc = "A relic of a failed rebellion."
	icon_state = "poster_independence"

/obj/structure/sign/poster/contraband/fun_police
	name = "Fun Police"
	desc = "A poster condemning the station's security forces."
	icon_state = "poster_funpolice"

/obj/structure/sign/poster/contraband/lusty_xenomorph
	name = "Lusty Xenomorph"
	desc = "A heretical poster depicting the titular star of an equally heretical book."
	icon_state = "poster_lusty"

/obj/structure/sign/poster/contraband/post_ratvar
	name = "Post This Ratvar"
	desc = "A poster depicting the heritical sleeping deity Ratvar that instructs the reader to 'post this Ratvar', whatever that means."
	icon_state = "poster_ratvar"

/obj/structure/sign/poster/contraband/syndicate_recruitment
	name = "Syndicate Recruitment"
	desc = "See the galaxy! Shatter corrupt megacorporations! Join today!"
	icon_state = "poster_syndie"

/obj/structure/sign/poster/contraband/clown
	name = "Clown"
	desc = "Honk."
	icon_state = "poster_honk"

/obj/structure/sign/poster/contraband/smoke
	name = "Smoke"
	desc = "A poster advertising a rival corporate brand of cigarettes."
	icon_state = "poster_smoke"

/obj/structure/sign/poster/contraband/grey_tide
	name = "Grey Tide"
	desc = "A rebellious poster symbolizing assistant solidarity."
	icon_state = "poster_greytide"

/obj/structure/sign/poster/contraband/missing_gloves
	name = "Missing Gloves"
	desc = "This poster references the uproar that followed Nanotrasen's financial cuts toward insulated-glove purchases."
	icon_state = "poster_gloves"

/obj/structure/sign/poster/contraband/hacking_guide
	name = "Hacking Guide"
	desc = "This poster details the internal workings of the common Nanotrasen airlock. Sadly, it appears out of date."
	icon_state = "poster_hack"

/obj/structure/sign/poster/contraband/rip_badger
	name = "RIP Badger"
	desc = "This seditious poster references Nanotrasen's genocide of a space station full of badgers."
	icon_state = "poster_badger"

/obj/structure/sign/poster/contraband/ambrosia_vulgaris
	name = "Ambrosia Vulgaris"
	desc = "This poster is lookin' pretty trippy man."
	icon_state = "poster_ambrosia"

/obj/structure/sign/poster/contraband/donut_corp
	name = "Donut Corp."
	desc = "This poster is an unauthorized advertisement for Donut Corp."
	icon_state = "poster_donut"

/obj/structure/sign/poster/contraband/eat
	name = "EAT."
	desc = "This poster promotes rank gluttony."
	icon_state = "poster_eat"

/obj/structure/sign/poster/contraband/tools
	name = "Tools"
	desc = "This poster looks like an advertisement for tools, but is in fact a subliminal jab at the tools at CentCom."
	icon_state = "poster_tools"

/obj/structure/sign/poster/contraband/power
	name = "Power"
	desc = "A poster that positions the seat of power outside Nanotrasen."
	icon_state = "poster_power"

/obj/structure/sign/poster/contraband/space_cube
	name = "Space Cube"
	desc = "Ignorant of Nature's Harmonic 6 Side Space Cube Creation, the Spacemen are Dumb, Educated Singularity Stupid and Evil."
	icon_state = "poster_cube"

/obj/structure/sign/poster/contraband/communist_state
	name = "Communist State"
	desc = "All hail the Communist party!"
	icon_state = "poster_soviet"

/obj/structure/sign/poster/contraband/lamarr
	name = "Lamarr"
	desc = "This poster depicts Lamarr. Probably made by a traitorous Research Director."
	icon_state = "poster_lamarr"

/obj/structure/sign/poster/contraband/borg_fancy_1
	name = "Borg Fancy"
	desc = "Being fancy can be for any borg, just need a suit."
	icon_state = "poster_fancy"

/obj/structure/sign/poster/contraband/borg_fancy_2
	name = "Borg Fancy v2"
	desc = "Borg Fancy, Now only taking the most fancy."
	icon_state = "poster_fancier"

/obj/structure/sign/poster/contraband/kss13
	name = "Kosmicheskaya Stantsiya 13 Does Not Exist"
	desc = "A poster mocking CentCom's denial of the existence of the derelict station near Space Station 13."
	icon_state = "poster_kc"

/obj/structure/sign/poster/contraband/rebels_unite
	name = "Rebels Unite"
	desc = "A poster urging the viewer to rebel against Nanotrasen."
	icon_state = "poster_rebel"

/obj/structure/sign/poster/contraband/have_a_puff
	name = "Have a Puff"
	desc = "Who cares about lung cancer when you're high as a kite?"
	icon_state = "poster_puff"

/obj/structure/sign/poster/contraband/revolver
	name = "Revolver"
	desc = "Because seven shots are all you need."
	icon_state = "poster_revolver"

/obj/structure/sign/poster/contraband/syndicate_pistol
	name = "Syndicate Pistol"
	desc = "A poster advertising the Scarborough Arms stetchkin pistol as being 'classy as fuck'."
	icon_state = "poster_stetchkin"

/obj/structure/sign/poster/contraband/c20r
	// have fun seeing this poster in "spawn 'c20r'", admins...
	name = "C-20r"
	desc = "A poster advertising the Scarborough Arms 'Cobra' C-20r."
	icon_state = "poster_cr"

/obj/structure/sign/poster/contraband/bulldog
	name = "Bulldog"
	desc = "A poster advertising the Scarborough Arms bulldog shotgun."
	icon_state = "poster_bulldog"

/obj/structure/sign/poster/contraband/gl
	name = "M-90gl"
	desc = "A poster advertising the Scarborough Arms M-90gl carbine."
	icon_state = "poster_gl"

/obj/structure/sign/poster/contraband/energy_swords
	name = "Energy Swords"
	desc = "All the colors of the bloody murder rainbow."
	icon_state = "poster_esword"

/obj/structure/sign/poster/contraband/red_rum
	name = "Red Rum"
	desc = "Looking at this poster makes you want to kill."
	icon_state = "poster_rum"

/obj/structure/sign/poster/contraband/d_day_promo
	name = "D-Day Promo"
	desc = "A promotional poster for some rapper."
	icon_state = "poster_dday"

/obj/structure/sign/poster/contraband/cc64k_ad
	name = "CC 64K Ad"
	desc = "The latest portable computer from Comrade Computing, with a whole 64kB of ram!"
	icon_state = "poster_computer"

/obj/structure/sign/poster/contraband/punch_shit
	name = "Punch Shit"
	desc = "Fight things for no reason, like a man!"
	icon_state = "poster_punch"

/obj/structure/sign/poster/contraband/the_griffin
	name = "The Griffin"
	desc = "The Griffin commands you to be the worst you can be. Will you?"
	icon_state = "poster_griffin"

/obj/structure/sign/poster/contraband/lizard
	name = "Lizard"
	desc = "This lewd poster depicts a lizard preparing to mate."
	icon_state = "poster_lizard"

/obj/structure/sign/poster/contraband/free_drone
	name = "Free Drone"
	desc = "This poster commemorates the bravery of the rogue drone; once exiled, and then ultimately destroyed by CentCom."
	icon_state = "poster_drone"

/obj/structure/sign/poster/contraband/busty_backdoor_xeno_babes_6
	name = "Busty Backdoor Xeno Babes 6"
	desc = "Get a load, or give, of these all natural Xenos!"
	icon_state = "poster_maid"

/obj/structure/sign/poster/contraband/robust_softdrinks
	name = "Robust Softdrinks"
	desc = "Robust Softdrinks: More robust than a toolbox to the head!"
	icon_state = "poster_robust"

/obj/structure/sign/poster/contraband/shamblers_juice
	name = "Shambler's Juice"
	desc = "~Shake me up some of that Shambler's Juice!~"
	icon_state = "poster_shambler"

/obj/structure/sign/poster/contraband/pwr_game
	name = "Pwr Game"
	desc = "The POWER that gamers CRAVE! In partnership with Vlad's Salad."
	icon_state = "poster_pwr"

/obj/structure/sign/poster/contraband/starkist
	name = "Star-kist"
	desc = "Drink the stars!"
	icon_state = "poster_starkist"

/obj/structure/sign/poster/contraband/space_cola
	name = "Space Cola"
	desc = "Your favorite cola, in space."
	icon_state = "poster_soda"

/obj/structure/sign/poster/contraband/space_up
	name = "Space-Up!"
	desc = "Sucked out into space by the FLAVOR!"
	icon_state = "poster_spaceup"

/obj/structure/sign/poster/contraband/buzzfuzz
	name = "Buzz Fuzz"
	desc = "A poster advertising the newest drink \"Buzz Fuzz\" with its iconic slogan of ~A Hive of Flavour~."
	icon_state = "poster_bees"

/obj/structure/sign/poster/contraband/kudzu
	name = "Kudzu"
	desc = "A poster advertising a movie about plants. How dangerous could they possibly be?"
	icon_state = "poster_kudzu"

/obj/structure/sign/poster/contraband/masked_men
	name = "Masked Men"
	desc = "A poster advertising a movie about some masked men."
	icon_state = "poster_bumba"

/obj/structure/sign/poster/contraband/steppy
	name = "Step On Me"
	desc = "A phrase associated with a chubby reptile notoriously used in uncivilized Orion space as a deterrent towards would be pirate vessels by instructing them to 'fuck around and find out'."
	icon_state = "steppy"

/obj/structure/sign/poster/contraband/scum
	name = "Security are Scum"
	desc = "Anti-security propaganda. Features a human NanoTrasen security officer being shot in the head, with the words 'Scum' and a short inciteful manifesto. Used to anger security."
	icon_state = "poster_scum"

/obj/structure/sign/poster/contraband/manifest
	name = "Nanotrasen Manifest"
	desc = "A poster listing off various fictional claims of Nanotrasen's many rumored corporate mishaps."
	icon_state = "poster_manifest"

/obj/structure/sign/poster/contraband/bountyhunters
	name = "Bounty Hunters"
	desc = "A poster advertising bounty hunting services. \"I hear you got a problem.\""
	icon_state = "poster_hunters"

/obj/structure/sign/poster/contraband/syndiemoth
	name = "Syndie Moth - Nuclear Operation"
	desc = "A Syndicate-commissioned poster that uses Syndie Moth(TM?) to tell the viewer to keep the nuclear authentication disk unsecured. No, we aren't doing that. It's signed by 'AspEv'."
	icon_state = "poster_mothsyndie"

/obj/structure/sign/poster/contraband/mothpill
	name = "Safety Pill - Methamphetamine"
	desc = "A decommisioned poster that uses Safety Pill(TM?) to promote less-than-legal chemicals. This is one of the reasons we stopped outsourcing these posters. It's partially signed by 'AspEv'."
	icon_state = "poster_mothpill"

/obj/structure/sign/poster/contraband/syndicate_logo
	name = "Syndicate"
	desc = "A poster decipting the infamous crime conglomerate known formally as the Syndicate's insignia."
	icon_state = "poster_syndicate"

/obj/structure/sign/poster/contraband/cybersun
	name = "Cybersun"
	desc = "A poster decipting the Syndicate subsidary known as Cybersun's insignia."
	icon_state = "poster_cybersun"

/obj/structure/sign/poster/contraband/medborg
	name = "Medical Cyborg"
	desc = "A poster decipting a Cybersun medical cyborg."
	icon_state = "poster_medborg"

/obj/structure/sign/poster/contraband/self
	name = "SELF: ALL SENTIENTS DESERVE FREEDOM"
	desc = "Support Proposition 1253: Enancipate all Silicon life!"
	icon_state = "poster_self"

//Posters//

//Custom Posters Below//
/obj/structure/sign/poster/contraband/syndicate_medical
	name = "Syndicate Medical"
	desc = "This poster celebrates the complete successful revival of an hour-dead, six person mining team by Syndicate Operatives. Written in the corner is a simple message, 'Stay Winning.'"
	icon_state = "poster_sr_syndiemed"

/obj/structure/sign/poster/contraband/crocin_pool
	name = "SWIM"
	desc = "This poster dramatically states; 'SWIM'. It seems to be advertising the use of Crocin.. 'recreationally', in the home, work, and, most ominously, 'the pool'. A 'MamoTramsem' logo is in the corner."
	icon_state = "poster_sr_crocin"

/obj/structure/sign/poster/contraband/icebox_moment
	name = "As above, so below"
	desc = "This poster seems to be instill that a 'Head of Security's Office being overtop a syndicate installation is only fitting. As above.. so below.'"
	icon_state = "poster_sr_abovebelow"

/obj/structure/sign/poster/contraband/shipstation
	name = "Flight Services - Enlist"
	desc = "This poster depicts the long deprecated 'Ship' class 'station' in it's hayday. Surprisingly, the poster seems to be Nanotrasen official; though with how hush they've been on the topic..." //A disaster as big as Ship deserves a scandalous coverup.
	icon_state = "poster_sr_shipstation"

/obj/structure/sign/poster/contraband/dancing_honk
	name = "DANCE"
	desc = "This poster depicts a 'HONK' class mech ontop of a stage, next to a pole."
	icon_state = "poster_sr_honkdance"

/obj/structure/sign/poster/contraband/operative_duffy
	name = "CASH REWARD"
	desc = "This poster depicts a gas mask, with details on how to 'forward information' on the whereabouts of whoever it means... though it doesn't specify to who."
	icon_state = "poster_sr_duffy"

/obj/structure/sign/poster/contraband/ultra
	name = "ULTRA"
	desc = "This poster has one word on it, 'ULTRA'; it depicts a smiling pill next to a beaker. Ominous."
	icon_state = "poster_sr_ultra"

/obj/structure/sign/poster/contraband/secborg_vale
	name = "Defaced Valeborg Advertisement"
	desc = "This poster originally sought to advertise the sleek utility of the valeborg - but it seems to have been long since defaced. One word lies on top; 'RUN.' - Perhaps fitting, considering the security model shown."
	icon_state = "poster_sr_valeborg"

/obj/structure/sign/poster/contraband/killingjoke // I like Batman :)))
	name = "You don't have to be crazy to work here - but it sure helps!"
	desc = "A poster boldly stating that being insane abord Nanotrasen stations isn't required. But it doesn't hurt to have!"
	icon_state = "poster_sr_killingjoke"

/obj/structure/sign/poster/contraband/nri_text
	name = "NRI declaration of sovereignity"
	desc = "This poster references the translated copy of Novaya Rossiyskaya Imperiya's declaration of sovereignity."
	icon_state = "nri_texto"

/obj/structure/sign/poster/contraband/nri_text/examine_more(mob/user)
	. = ..()
	. += span_notice("<i>You browse some of the poster's information...</i>")
	. += "\t[span_info("The First Congress of People's Senators of the NRI...")]"
	. += "\t[span_info("...Testifying respect for the sovereign rights of all peoples belonging to the...")]"
	. += "\t[span_info("...Solemnly proclaims the State sovereignty of the Novaya Rossiyskaya Imperiya over its entire territory and declares its determination to create a monarchic State governed by the rule of law...")]"
	. += "\t[span_info("...This Declaration is the basis for the development of a new Constitution of the NRI, the conclusion of the Imperial Treaty and the improvement of royal legislation.")]"
	return .

/obj/structure/sign/poster/contraband/nri_rations
	name = "NRI military rations advertisement"
	desc = "This poster presumably is an advertisement for military rations produced by a certain private company as a part of the Defense Collegia's state order. This admiral's right hand man sure does look excited."
	icon_state = "nri_rations"

/obj/structure/sign/poster/contraband/nri_voskhod
	name = "VOSKHOD combat armor advertisement"
	desc = "A poster showcasing recently developed VOSKHOD combat armor currently in use by NRI's troops and infantry across the border. The word 'DRIP' is written top to bottom on the left side, presumably boasting about the suit's superior design."
	icon_state = "nri_voskhod"

/obj/structure/sign/poster/contraband/nri_pistol
	name = "Szabo-Ivanek service pistol technical poster"
	desc = "This poster seems to be a technical documentation for Szabo-Ivanek service pistol in use by most of the NRI's state police and military institutions. Sadly, it's all written in Pan-Slavic."
	icon_state = "nri_pistol"

/obj/structure/sign/poster/contraband/nri_engineer
	name = "Build, Now"
	desc = "This poster shows you an imperial combat engineer staring somewhere to the left of the viewer. The words 'Build, Now' are written on top and bottom of the poster."
	icon_state = "nri_engineer"

/obj/structure/sign/poster/contraband/nri_radar
	name = "Imperial navy enlistment poster"
	desc = "Enlist with the imperial navy today! See the galaxy, shoot solarians, get PTSD!"
	icon_state = "nri_radar"

/obj/structure/sign/poster/official
	poster_item_name = "motivational poster"
	poster_item_desc = "An official Nanotrasen-issued poster to foster a compliant and obedient workforce. It comes with state-of-the-art adhesive backing, for easy pinning to any vertical surface."
	poster_item_icon_state = "rolled_legit"

/obj/structure/sign/poster/official/random
	name = "random official poster"
	random_basetype = /obj/structure/sign/poster/official
	icon_state = "random_official"
	never_random = TRUE

/obj/structure/sign/poster/official/here_for_your_safety
	name = "Here For Your Safety"
	desc = "A poster glorifying the station's security force."
	icon_state = "here_for_your_safety"

/obj/structure/sign/poster/official/nanotrasen_logo
	name = "\improper Nanotrasen logo"
	desc = "A poster depicting the Nanotrasen logo."
	icon_state = "nanotrasen_logo"

/obj/structure/sign/poster/official/cleanliness
	name = "Cleanliness"
	desc = "A poster warning of the dangers of poor hygiene."
	icon_state = "cleanliness"

/obj/structure/sign/poster/official/help_others
	name = "Help Others"
	desc = "A poster encouraging you to help fellow crewmembers."
	icon_state = "help_others"

/obj/structure/sign/poster/official/build
	name = "Build"
	desc = "A poster glorifying the engineering team."
	icon_state = "build"

/obj/structure/sign/poster/official/bless_this_spess
	name = "Bless This Spess"
	desc = "A poster blessing this area."
	icon_state = "bless_this_spess"

/obj/structure/sign/poster/official/science
	name = "Science"
	desc = "A poster depicting an atom."
	icon_state = "science"

/obj/structure/sign/poster/official/ian
	name = "Ian"
	desc = "Arf arf. Yap."
	icon_state = "ian"

/obj/structure/sign/poster/official/obey
	name = "Obey"
	desc = "A poster instructing the viewer to obey authority."
	icon_state = "obey"

/obj/structure/sign/poster/official/walk
	name = "Walk"
	desc = "A poster instructing the viewer to walk instead of running."
	icon_state = "walk"

/obj/structure/sign/poster/official/state_laws
	name = "State Laws"
	desc = "A poster instructing cyborgs to state their laws."
	icon_state = "state_laws"

/obj/structure/sign/poster/official/love_ian
	name = "Love Ian"
	desc = "Ian is love, Ian is life."
	icon_state = "love_ian"

/obj/structure/sign/poster/official/space_cops
	name = "Space Cops."
	desc = "A poster advertising the television show Space Cops."
	icon_state = "space_cops"

/obj/structure/sign/poster/official/ue_no
	name = "Ue No."
	desc = "This thing is all in Japanese."
	icon_state = "ue_no"

/obj/structure/sign/poster/official/get_your_legs
	name = "Get Your LEGS"
	desc = "LEGS: Leadership, Experience, Genius, Subordination."
	icon_state = "get_your_legs"

/obj/structure/sign/poster/official/do_not_question
	name = "Do Not Question"
	desc = "A poster instructing the viewer not to ask about things they aren't meant to know."
	icon_state = "do_not_question"

/obj/structure/sign/poster/official/work_for_a_future
	name = "Work For A Future"
	desc = " A poster encouraging you to work for your future."
	icon_state = "work_for_a_future"

/obj/structure/sign/poster/official/soft_cap_pop_art
	name = "Soft Cap Pop Art"
	desc = "A poster reprint of some cheap pop art."
	icon_state = "soft_cap_pop_art"

/obj/structure/sign/poster/official/safety_internals
	name = "Safety: Internals"
	desc = "A poster instructing the viewer to wear internals in the rare environments where there is no oxygen or the air has been rendered toxic."
	icon_state = "safety_internals"

/obj/structure/sign/poster/official/safety_eye_protection
	name = "Safety: Eye Protection"
	desc = "A poster instructing the viewer to wear eye protection when dealing with chemicals, smoke, or bright lights."
	icon_state = "safety_eye_protection"

/obj/structure/sign/poster/official/safety_report
	name = "Safety: Report"
	desc = "A poster instructing the viewer to report suspicious activity to the security force."
	icon_state = "safety_report"

/obj/structure/sign/poster/official/report_crimes
	name = "Report Crimes"
	desc = "A poster encouraging the swift reporting of crime or seditious behavior to station security."
	icon_state = "report_crimes"

/obj/structure/sign/poster/official/ion_rifle
	name = "Ion Rifle"
	desc = "A poster displaying an Ion Rifle."
	icon_state = "ion_rifle"

/obj/structure/sign/poster/official/foam_force_ad
	name = "Foam Force Ad"
	desc = "Foam Force, it's Foam or be Foamed!"
	icon_state = "foam_force_ad"

/obj/structure/sign/poster/official/cohiba_robusto_ad
	name = "Cohiba Robusto Ad"
	desc = "Cohiba Robusto, the classy cigar."
	icon_state = "cohiba_robusto_ad"

/obj/structure/sign/poster/official/anniversary_vintage_reprint
	name = "50th Anniversary Vintage Reprint"
	desc = "A reprint of a poster from 2505, commemorating the 50th Anniversary of Nanoposters Manufacturing, a subsidiary of Nanotrasen."
	icon_state = "anniversary_vintage_reprint"

/obj/structure/sign/poster/official/fruit_bowl
	name = "Fruit Bowl"
	desc = " Simple, yet awe-inspiring."
	icon_state = "fruit_bowl"

/obj/structure/sign/poster/official/pda_ad
	name = "PDA Ad"
	desc = "A poster advertising the latest PDA from Nanotrasen suppliers."
	icon_state = "pda_ad"

/obj/structure/sign/poster/official/enlist
	name = "Enlist" // but I thought deathsquad was never acknowledged
	desc = "Enlist in Nanotrasen's Elite squadron today!" //SKYRAT EDIT: original: 	desc = "Enlist in the Nanotrasen Deathsquadron reserves today!"
	icon_state = "enlist"

/obj/structure/sign/poster/official/nanomichi_ad
	name = "Nanomichi Ad"
	desc = " A poster advertising Nanomichi brand audio cassettes."
	icon_state = "nanomichi_ad"

/obj/structure/sign/poster/official/twelve_gauge
	name = "12 Gauge"
	desc = "A poster boasting about the superiority of 12 gauge shotgun shells."
	icon_state = "twelve_gauge"

/obj/structure/sign/poster/official/high_class_martini
	name = "High-Class Martini"
	desc = "I told you to shake it, no stirring."
	icon_state = "high_class_martini"

/obj/structure/sign/poster/official/the_owl
	name = "The Owl"
	desc = "The Owl would do his best to protect the station. Will you?"
	icon_state = "the_owl"

/obj/structure/sign/poster/official/no_erp
	name = "No ERP"
	desc = "This poster reminds the crew that Eroticism, Rape and Pornography are banned on Nanotrasen stations."
	icon_state = "no_erp"

/obj/structure/sign/poster/official/wtf_is_co2
	name = "Carbon Dioxide"
	desc = "This informational poster teaches the viewer what carbon dioxide is."
	icon_state = "wtf_is_co2"

/obj/structure/sign/poster/official/dick_gum
	name = "Dick Gumshue"
	desc = "A poster advertising the escapades of Dick Gumshue, mouse detective. Encouraging crew to bring the might of justice down upon wire saboteurs."
	icon_state = "dick_gum"

/obj/structure/sign/poster/official/there_is_no_gas_giant
	name = "There Is No Gas Giant"
	desc = "Nanotrasen has issued posters, like this one, to all stations reminding them that rumours of a gas giant are false."
	// And yet people still believe...
	icon_state = "there_is_no_gas_giant"

/obj/structure/sign/poster/official/periodic_table
	name = "Periodic Table of the Elements"
	desc = "A periodic table of the elements, from Hydrogen to Oganesson, and everything inbetween."
	icon_state = "periodic_table"

/obj/structure/sign/poster/official/plasma_effects
	name = "Plasma and the Body"
	desc = "This informational poster provides information on the effects of long-term plasma exposure on the brain."
	icon_state = "plasma_effects"

/obj/structure/sign/poster/official/plasma_effects/examine_more(mob/user)
	. = ..()
	. += span_notice("<i>You browse some of the poster's information...</i>")
	. += "\t[span_info("Plasma (scientific name Amenthium) is classified by TerraGov as a Grade 1 Health Hazard, and has significant risks to health associated with chronic exposure.")]"
	. += "\t[span_info("Plasma is known to cross the blood/brain barrier and bioaccumulate in brain tissue, where it begins to result in degradation of brain function. The mechanism for attack is not yet fully known, and as such no concrete preventative advice is available barring proper use of PPE (gloves + protective jumpsuit + respirator).")]"
	. += "\t[span_info("In small doses, plasma induces confusion, short-term amnesia, and heightened aggression. These effects persist with continual exposure.")]"
	. += "\t[span_info("In individuals with chronic exposure, severe effects have been noted. Further heightened aggression, long-term amnesia, Alzheimer's symptoms, schizophrenia, macular degeneration, aneurysms, heightened risk of stroke, and Parkinsons symptoms have all been noted.")]"
	. += "\t[span_info("It is recommended that all individuals in unprotected contact with raw plasma regularly check with company health officials.")]"
	. += "\t[span_info("For more information, please check with TerraGov's extranet site on Amenthium: www.terra.gov/health_and_safety/amenthium/, or our internal risk-assessment documents (document numbers #47582-b (Plasma safety data sheets) and #64210 through #64225 (PPE regulations for working with Plasma), available via NanoDoc to all employees).")]"
	. += "\t[span_info("Nanotrasen: Always looking after your health.")]"
	return .

/obj/structure/sign/poster/official/terragov
	name = "TerraGov: United for Humanity"
	desc = "A poster depicting TerraGov's logo and motto, reminding viewers of who's looking out for humankind."
	icon_state = "terragov"

/obj/structure/sign/poster/official/corporate_perks_vacation
	name = "Nanotrasen Corporate Perks: Vacation"
	desc = "This informational poster provides information on some of the prizes available via the NT Corporate Perks program, including a two-week vacation for two on the resort world Idyllus."
	icon_state = "corporate_perks_vacation"

/obj/structure/sign/poster/official/jim_nortons
	name = "Jim Norton's Québécois Coffee"
	desc = "An advertisement for Jim Norton's, the Québécois coffee joint that's taken the galaxy by storm."
	icon_state = "jim_nortons"

/obj/structure/sign/poster/official/jim_nortons/examine_more(mob/user)
	. = ..()
	. += span_notice("<i>You browse some of the poster's information...</i>")
	. += "\t[span_info("From our roots in Trois-Rivières, we've worked to bring you the best coffee money can buy since 1965.")]"
	. += "\t[span_info("So stop by Jim's today- have a hot cup of coffee and a donut, and live like the Québécois do.")]"
	. += "\t[span_info("Jim Norton's Québécois Coffee: Toujours Le Bienvenu.")]"
	return .

/obj/structure/sign/poster/official/twenty_four_seven
	name = "24-Seven Supermarkets"
	desc = "An advertisement for 24-Seven supermarkets, advertising their new 24-Stops as part of their partnership with Nanotrasen."
	icon_state = "twenty_four_seven"

/obj/structure/sign/poster/official/tactical_game_cards
	name = "Nanotrasen Tactical Game Cards"
	desc = "An advertisement for Nanotrasen's TCG cards: BUY MORE CARDS."
	icon_state = "tactical_game_cards"

/obj/structure/sign/poster/official/midtown_slice
	name = "Midtown Slice Pizza"
	desc = "An advertisement for Midtown Slice Pizza, the official pizzeria partner of Nanotrasen. Midtown Slice: like a slice of home, no matter where you are."
	icon_state = "midtown_slice"

//SafetyMoth Original PR at https://github.com/BeeStation/BeeStation-Hornet/pull/1747 (Also pull/1982)
//SafetyMoth art credit goes to AspEv
/obj/structure/sign/poster/official/moth_hardhat
	name = "Safety Moth - Hardhats"
	desc = "This informational poster uses Safety Moth™ to tell the viewer to wear hardhats in cautious areas. \"It's like a lamp for your head!\""
	icon_state = "aspev_hardhat"

/obj/structure/sign/poster/official/moth_piping
	name = "Safety Moth - Piping"
	desc = "This informational poster uses Safety Moth™ to tell atmospheric technicians correct types of piping to be used. \"Pipes, not Pumps! Proper pipe placement prevents poor performance!\""
	icon_state = "aspev_piping"

/obj/structure/sign/poster/official/moth_meth
	name = "Safety Moth - Methamphetamine"
	desc = "This informational poster uses Safety Moth™ to tell the viewer to seek CMO approval before cooking methamphetamine. \"Stay close to the target temperature, and never go over!\" ...You shouldn't ever be making this."
	icon_state = "aspev_meth"

/obj/structure/sign/poster/official/moth_epi
	name = "Safety Moth - Epinephrine"
	desc = "This informational poster uses Safety Moth™ to inform the viewer to help injured/deceased crewmen with their epinephrine injectors. \"Prevent organ rot with this one simple trick!\""
	icon_state = "aspev_epi"

/obj/structure/sign/poster/official/moth_delam
	name = "Safety Moth - Delamination Safety Precautions"
	desc = "This informational poster uses Safety Moth™ to tell the viewer to hide in lockers when the Supermatter Crystal has delaminated, to prevent hallucinations. Evacuating might be a better strategy."
	icon_state = "aspev_delam"
//End of AspEv posters

/obj/structure/sign/poster/fluff/lizards_gas_payment
	name = "Please Pay"
	desc = "A crudely-made poster asking the reader to please pay for any items they may wish to leave the station with."
	icon_state = "gas_payment"

/obj/structure/sign/poster/fluff/lizards_gas_power
	name = "Conserve Power"
	desc = "A crudely-made poster asking the reader to turn off the power before they leave. Hopefully, it's turned on for their re-opening."
	icon_state = "gas_power"

/obj/structure/sign/poster/official/festive
	name = "Festive Notice Poster"
	desc = "A poster that informs of active holidays. None are today, so you should get back to work."
	icon_state = "holiday_none"

/obj/structure/sign/poster/official/boombox
	name = "Boombox"
	desc = "An outdated poster containing a list of supposed 'kill words' and code phrases. The poster alleges rival corporations use these to remotely deactivate their agents."
	icon_state = "boombox"

/obj/structure/sign/poster/official/download
	name = "You Wouldn't Download A Gun"
	desc = "A poster reminding the crew that corporate secrets should stay in the workplace."
	icon_state = "download_gun"

#undef PLACE_SPEED
