GLOBAL_LIST_INIT(splurt_ui_styles, list(
	'icons/hud/screen_midnight.dmi' = 'modular_splurt/icons/hud/screen_midnight.dmi',
	'icons/hud/screen_retro.dmi' = 'modular_splurt/icons/hud/screen_retro.dmi',
	'icons/hud/screen_plasmafire.dmi' = 'modular_splurt/icons/hud/screen_plasmafire.dmi',
	'icons/hud/screen_slimecore.dmi' = 'modular_splurt/icons/hud/screen_slimecore.dmi',
	'icons/hud/screen_operative.dmi' = 'modular_splurt/icons/hud/screen_operative.dmi',
	'icons/hud/screen_clockwork.dmi' = 'modular_splurt/icons/hud/screen_clockwork.dmi',
	'modular_sand/icons/mob/screen_liteweb.dmi' = 'modular_splurt/icons/hud/screen_midnight.dmi'
))

/proc/ui_style_splurt(ui_style)
	if(isfile(ui_style))
		return GLOB.splurt_ui_styles[ui_style] || GLOB.splurt_ui_styles[GLOB.splurt_ui_styles[1]]
	else
		return GLOB.splurt_ui_styles[ui_style] || GLOB.splurt_ui_styles[GLOB.splurt_ui_styles[1]]
