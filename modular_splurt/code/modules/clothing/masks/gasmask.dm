/obj/item/clothing/mask/gas/radmask
	name = "radiation mask"
	desc = "An mask that somewhat protects the user from radiation. Not as effective like a radiation hood, but is better than nothing."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "radmask"
	icon_state = "radmask"

/obj/item/clothing/mask/gas/mime //Smaaalll edit here by Yawet. Makes the mime mask only hide the facial hair of an individual. Allows them to be examined (to see flavor text), and stops it from hiding ears. On request of Jglitch.
	flags_inv = HIDEFACIALHAIR

/obj/item/clothing/mask/gas/clown_hat // Not requested, but changed to allow examining too.
	flags_inv = HIDEFACIALHAIR

/obj/item/clothing/mask/gas/clown_hat_polychromic //Ditto
	flags_inv = HIDEFACIALHAIR

// GWTB-inspired thing wooo
/obj/item/clothing/mask/gas/goner
	name = "trencher gas mask"
	desc = "A No Man's Land-type gas mask. Equipment beloved by many mooks and romantically apocalyptic people. It has filter installed."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "goner_mask"
	flags_inv = HIDEEARS | HIDEEYES | HIDEFACE | HIDEHAIR | HIDEFACIALHAIR | HIDESNOUT

/obj/item/clothing/mask/gas/goner/basic
	name = "stripped trencher gas mask"
	desc = "A stripped version of No Man's Land-type mask equipment. While you can connect it to air supply, it doesn't block gas flow."

// Cosmetic gas mask for Bane Syndrome (masked_mook)
/obj/item/clothing/mask/gas/cosmetic
	name = "aesthetic gas mask"
	desc = "A face-covering mask that resembles a traditional gas mask, but without the breathing functionality."
	clothing_flags = NONE
