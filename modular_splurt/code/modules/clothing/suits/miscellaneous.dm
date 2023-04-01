//Main code edits
/obj/item/clothing/suit/toggle/jacket
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/toggle/wbreakpoly
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

//Own stuff
/obj/item/clothing/under/wedding_dress
	name = "wedding dress"
	desc = "A luxurious gown for once-in-a-lifetime occasions."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "wedding_dress"
	body_parts_covered = CHEST|GROIN|LEGS
	flags_cover = HIDESHOES
	supports_variations_flags = NONE
	can_adjust = FALSE

/obj/item/clothing/under/tuxedo
	name = "tuxedo"
	desc = "A formal black tuxedo. It exudes classiness."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "tuxedo"
	supports_variations_flags = NONE //temporary
	can_adjust = FALSE

/obj/item/clothing/suit/hooded/wintercoat/security/pink
	name = "pink security winter coat"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/clothing_righthand.dmi'
	icon_state = "coatsecuritypink"
	icon_state = "coatsecuritypink"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security/pink

/obj/item/clothing/head/hooded/winterhood/security/pink
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "winterhood_securitypink"

/obj/item/clothing/suit/toggle/rp_jacket
	name = "Yellow Jacket"
	desc = "A yellow jacket with a fluffy collar."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "jacket_yellow"
	icon_state = "jacket_yellow"
	body_parts_covered = CHEST|ARMS
	cold_protection = CHEST|ARMS
	supports_variations_flags = NONE
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/suit/toggle/rp_jacket/orange
	name = "Orange Jacket"
	desc = "A orange jacket with a fluffy collar."
	icon_state = "jacket_orange"
	icon_state = "jacket_orange"

/obj/item/clothing/suit/toggle/rp_jacket/red
	name = "Red Jacket"
	desc = "A red jacket with a fluffy collar."
	icon_state = "jacket_red"
	icon_state = "jacket_red"

/obj/item/clothing/suit/toggle/rp_jacket/purple
	name = "Purple Jacket"
	desc = "A purple jacket with a fluffy collar."
	icon_state = "jacket_purple"
	icon_state = "jacket_purple"

/obj/item/clothing/suit/toggle/rp_jacket/white
	name = "White Jacket"
	desc = "A white jacket with a fluffy collar."
	icon_state = "jacket_white"
	icon_state = "jacket_white"

/obj/item/clothing/suit/baroness
	name = "Baroness Dress"
	desc = "This dress is stained red due to the bloody history of its previous owner"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "baroness"
	icon_state = "baroness"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/obj/item/clothing/suit/baroness/ladyballat
	name = "Green Ball Dress"
	desc = "This dress looks a bit like the one an estranged aunt would wear."
	icon_state = "ladyballat"
	icon_state = "ladyballat"

/obj/item/clothing/suit/flatwoods
	name = "Flatwoods Dress"
	desc = "Despite it's rather simple and cozy look, it seems to be made for someone of at least 10ft."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "flatwoods"
	icon_state = "flatwoods"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/*
 * Posshim's Corpus atire
 */
/obj/item/clothing/suit/hooded/corpus
	name = "Standard Voidsuit"
	desc = "Standard issue voidsuit in the name of Grofit!"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "corpus"
	icon_state = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|FEET|HANDS
	hoodtype = /obj/item/clothing/head/hooded/corpus
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT //"Hide shoes" but digi shoes don't get hidden, too bad!
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	supports_variations_flags = NONE //There is no need for a digi variant, it's a costume

/obj/item/clothing/suit/hooded/corpus/s //sec
	name = "Enforcer Voidsuit"
	desc = "Deluxe issue armored voidsuit. Let the middle class bask in your grofit!"
	icon_state = "c)orpuss"
	armor_type = /datum/armor/suit_armor
	hoodtype = /obj/item/clothing/head/hooded/corpus/s //Enjoy this nice red outfit Nanotrasen! There is NO NEED for a pink one! xoxo -VivI Fanteriso

/obj/item/clothing/suit/hooded/corpus/s/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/suit/hooded/corpus/c //command
	name = "Commander Voidsuit"
	desc = "Premium issue correctional worker attire. Grease the gears of production."
	icon_state = "corpusc"
	armor_type = /datum/armor/suit_armor
	hoodtype = /obj/item/clothing/head/hooded/corpus/c

/obj/item/clothing/head/hooded/corpus
	name = "Voidsuit helmet"
	desc = "galvanized reinforced helm to protect against the elements"
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "corpus"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACIALHAIR|HIDEFACE|HIDEMASK|HIDESNOUT|HIDENECK //hide your ugly face with this one simple trick!
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor_type = /datum/armor/suit_armor

/obj/item/clothing/head/hooded/corpus/s //sec
	icon_state = "corpuss"

/obj/item/clothing/head/hooded/corpus/c //command
	icon_state = "corpusc"

/obj/item/clothing/suit/maid
	name = "Formal maid uniform"
	desc = "A cozy maid uniform for housekeeping."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "maiddress"
	icon_state = "maiddress"
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	flags_inv = HIDESHOES|HIDEUNDERWEAR

/obj/item/clothing/suit/hooded/pyramidhead
	name = "Pyramid Head apron"
	desc = "This was probably stolen from the kitchen and turned into someone's cosplay project."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "pyramidhead"
	icon_state = "apron"
	hoodtype = /obj/item/clothing/head/hooded/pyramidhead
	body_parts_covered = CHEST|GROIN|LEGS
	supports_variations_flags = NONE

/obj/item/clothing/head/hooded/pyramidhead
	name = "Pyramid Head"
	desc = "Looks like someone stole some plating tiles and let them rust for a while."
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	icon_state = "pyramidhead"
	icon_state = "pyramidhead"
	flags_inv = HIDEHAIR|HIDEEARS|HIDEFACIALHAIR|HIDEFACE|HIDEMASK|HIDESNOUT|HIDENECK

// GWTB-inspired stuff wooo
/obj/item/clothing/suit/goner
	name = "trencher coat"
	desc = "A generic trench coat of the boring wars. This one have purple, corporate insignias."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "goner_suit"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	armor_type = /datum/armor/suit_armor

/obj/item/clothing/suit/goner/Initialize(mapload)
	. = ..()
	allowed = GLOB.detective_vest_allowed // I am probably gonna get fire-line'd for this... But suggestion is a suggestion. Can always revert the changes, right?

/obj/item/clothing/suit/goner/fake
	name = "trencher coat replica"
	desc = "A 90% replica of No Man's Land-type coat."
/obj/item/clothing/suit/goner/fake/poly/classic
	name = "classic trencher coat"
	icon_state = "goner_suit_classic"
	desc = "A generic, grey coat with polychromic spots."

/obj/item/clothing/suit/goner/red
	name = "red trencher coat"
	desc = "A trench coat of the boring wars. This one have red insignias."
	icon_state = "goner_suit_r"

/obj/item/clothing/suit/goner/green
	name = "green trencher coat"
	desc = "A trench coat of the boring wars. This one have green insignias."
	icon_state = "goner_suit_g"

/obj/item/clothing/suit/goner/blue
	name = "blue trencher coat"
	desc = "A trench coat of the boring wars. This one have blue insignias."
	icon_state = "goner_suit_b"

/obj/item/clothing/suit/goner/yellow
	name = "yellow trencher coat"
	desc = "A trench coat of the boring wars. This one have yellow insignias."
	icon_state = "goner_suit_y"

/obj/item/clothing/suit/hooded/corpus/jp //It's him! John Prodman!
	name = "Strange Voidsuit"
	desc = "An odd Voidsuit that looks strangely familiar. Has the name 'John' stenciled on it. The shielding module is also intact!"
	icon_state = "corpus_jp"
	armor_type = /datum/armor/suit_armor
	hoodtype = /obj/item/clothing/head/hooded/corpus/jp

/obj/item/clothing/head/hooded/corpus/jp //sec
	icon_state = "corpus_jp"
