// Bluespace wallet
/obj/item/storage/wallet/bluespace
	name = "\improper wallet of holding"
	desc = "A testament to science's hubris. It holds thrice as many stolen ID cards."
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "wallet_bluespace"

	// Copied from bag of holding
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION

/obj/item/storage/wallet/bluespace/Initialize()
	. = ..()

	atom_storage.max_total_storage = 12
	AddElement(/datum/element/radiation_protected_clothing)

