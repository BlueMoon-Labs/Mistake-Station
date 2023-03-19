#define COMSIG_MOB_CAME "mob_came"
#define COMSIG_HEALTH_SCAN "health_scan"
#define COMSIG_ORGAN_INSERTED "organ_inserted"
#define COMSIG_MOB_CLIMAX "mob_coomed"
#define COMSIG_OBJ_WRITTEN_ON "written_on"
#define COMSIG_MOB_LUST_UPDATED "mob_lust_updated"

//Mood
#define COMSIG_ADD_MOOD_EVENT "add_mood_event" //Called when you send a mood event from anywhere in the code.
#define COMSIG_CLEAR_MOOD_EVENT "clear_mood_event" //Called when you clear a mood event from anywhere in the code.
#define COMSIG_MODIFY_SANITY "update_mood" //Called when you want to increase or decrease sanity from anywhere in the code.

// Item mouse siganls
#define COMSIG_ITEM_MOUSE_EXIT "item_mouse_exit"				//from base of obj/item/MouseExited(): (location, control, params)
#define COMSIG_ITEM_MOUSE_ENTER "item_mouse_enter"				//from base of obj/item/MouseEntered(): (location, control, params)
