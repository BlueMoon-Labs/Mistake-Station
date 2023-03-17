//Own
/datum/reagent/consumable/wockyslush
	name = "Wocky Slush"
	description = "That thang bleedin' to the-... ya know I mean?"
	color = "#7b60c4" // rgb(123, 96, 196)
	quality = DRINK_VERYGOOD
	taste_description = "cold rainbows"

/datum/glass_style/drinking_glass/wockyslush
	required_drink_type = /datum/reagent/consumable/wockyslush
	name = "Wocky Slush"
	desc = "That thang bleedin' to the-... ya know I mean?"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "wockyslush"

/datum/reagent/consumable/wockyslush/on_mob_life(mob/living/carbon/M)
	M.emote(pick("twitch","giggle","stare"))
	M.set_drugginess(75)
	M.apply_status_effect(/datum/status_effect/throat_soothed)
	..()

/datum/reagent/consumable/orange_creamsicle
	name = "Orange Creamsicle"
	description = "A Summer time drink that can be frozen and eaten or drunk from a glass!"
	color = "#ffb46e" // rgb(255, 180, 110)
	taste_description = "ice cream and orange soda"

/datum/glass_style/drinking_glass/orange_creamsicle
	required_drink_type = /datum/reagent/consumable/orange_creamsicle
	name = "Orange Creamsicle"
	desc = "A Summer time drink that can be frozen and eaten or drunk from a glass!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "orangecreamsicle"

/datum/glass_style/drinking_glass/orange_creamsicle
	required_drink_type = /datum/reagent/consumable/orange_creamsicle
	name = "Orange Creamsicle"
	desc = "A Summer time drink that can be frozen and eaten or Drinked from a glass!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "orangecreamsicle"

/datum/reagent/consumable/milkshake_base
	name = "Milkshake"
	description = "A basic milkshake. Could use something else?"
	color = "#FFFDD0"
	nutriment_factor = 1
	taste_description = "thick, creamy, and sweet"

/datum/glass_style/drinking_glass/milkshake_base
	required_drink_type = /datum/reagent/consumable/milkshake_base
	name = "Glass of Plain Milkshake"
	desc = "A glass of plain milkshake, a bit boring, but still good."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "vanillashake"

/datum/reagent/consumable/milkshake_vanilla
	name = "Vanilla Milkshake"
	description = "A vanilla milkshake. Basic, but delicious."
	color = "#FFFDD0"
	nutriment_factor = 1
	taste_description = "thick, creamy, and sweet"

/datum/glass_style/drinking_glass/milkshake_vanilla
	required_drink_type = /datum/reagent/consumable/milkshake_vanilla
	name = "Glass of Vanilla Milkshake"
	desc = "A glass of vanilla milkshake, a bit boring, but still good."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "vanillashake"

/datum/reagent/consumable/milkshake_choc
	name = "Chocolate Milkshake"
	description = "A delicious Chocolate Milkshake"
	color = "#7B3F00"
	nutriment_factor = 1
	taste_description = "sweet, creamy chocolate"

/datum/glass_style/drinking_glass/milkshake_choc
	required_drink_type = /datum/reagent/consumable/milkshake_choc
	name = "Glass of Chocolate Milkshake"
	desc = "A glass of chocolate milkshake, what a treat!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "choccyshake"

/datum/reagent/consumable/milkshake_strawberry
	name = "Strawberry Milkshake"
	description = "Frozen Strawberry Milk!"
	color = "#F4E1EA"
	nutriment_factor = 1
	taste_description = "summer memories"

/datum/glass_style/drinking_glass/milkshake_strawberry
	required_drink_type = /datum/reagent/consumable/milkshake_strawberry
	name = "Glass of Strawberry Milkshake"
	desc = "A glass of sweet, pink Strawberry Shake!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "strawberryshake"

/datum/reagent/consumable/milkshake_banana
	name = "Banana Milkshake"
	description = "Deliciously tricky!"
	color = "#FFE135"
	nutriment_factor = 1
	taste_description = "funny pranks and clowning around"

/datum/glass_style/drinking_glass/milkshake_banana
	required_drink_type = /datum/reagent/consumable/milkshake_banana
	name = "Glass of Banana Milkshake"
	desc = "A banana milkshake! Honk!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "bananashake"

/datum/reagent/consumable/milkshake_berry
	name = "Wild Berry Milkshake"
	description = "A summer favorite!"
	color = "#b17179"
	nutriment_factor = 1
	taste_description = "warm summer days"

/datum/glass_style/drinking_glass/milkshake_berry
	required_drink_type = /datum/reagent/consumable/milkshake_berry
	name = "Glass of Wild Berry Milkshake"
	desc = "A berry milkshake!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "bananashake"

/datum/reagent/consumable/milkshake_cola
	name = "Cola Milkshake"
	description = "Sweet milkshake mixed with cola"
	color = "#3c3024"
	nutriment_factor = 1
	taste_description = "cola and milkshake"
	glass_icon = 'modular_splurt/icons/obj/drinks.dmi'

/datum/glass_style/drinking_glass/milkshake_cola
	required_drink_type = /datum/reagent/consumable/milkshake_cola
	name = "Glass of Cola Milkshake"
	desc = "A cola milkshake, it's like a ticker float!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "colashake"

/datum/reagent/consumable/milkshake_gibb
	name = "Dr. Gibb Milkshake"
	description = "Sweet milkshake mixed with Dr. Gibb"
	color = "#5e312b"
	nutriment_factor = 1
	taste_description = "cola and milkshake"

/datum/glass_style/drinking_glass/milkshake_gibb
	required_drink_type = /datum/reagent/consumable/milkshake_gibb
	name = "Glass of Gibb Milkshake"
	desc = "A Dr. Gibb milkshake, it's like a ticker float!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "gibbshake"

/datum/reagent/consumable/milkshake_peach
	name = "Peach Milkshake"
	description = "A tasty Peach Milkshake"
	color = "#5e312b"
	nutriment_factor = 1
	taste_description = "peaches and cream"

/datum/glass_style/drinking_glass/milkshake_peach
	required_drink_type = /datum/reagent/consumable/milkshake_peach
	name = "Glass of Peace Milkshake"
	desc = "Peaches and Cream, Peaches and Cream!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "peachshake"

/datum/reagent/consumable/milkshake_pineapple
	name = "Pineapple Milkshake"
	description = "A tangy Pineapple Milkshake"
	color = "#feea63"
	nutriment_factor = 1
	taste_description = "citrus and cream"

/datum/glass_style/drinking_glass/milkshake_pineapple
	required_drink_type = /datum/reagent/consumable/milkshake_pineapple
	name = "Glass of Pineapple Milkshake"
	desc = "A Pineapple milkshake, a bit sweet and a bit sour, but all delicious!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "pineappleshake"

/datum/reagent/consumable/milkshake_melon
	name = "Watermelon Milkshake"
	description = "Delicous Watermelon Milkshake"
	color = "#E37383"
	nutriment_factor = 1
	taste_description = "warm sun and sweet cream"

/datum/glass_style/drinking_glass/milkshake_melon
	required_drink_type = /datum/reagent/consumable/milkshake_melon
	name = "Glass of Watermelon Milkshake"
	desc = "A Watermelon milkshake, it's like summer all over again!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "melonshake"
