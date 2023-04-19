//We start from 30 to not interfere with TG species defines, should they add more
/// We're using all three mutcolor features for our skin coloration
#define MUTCOLOR_MATRIXED	30
#define MUTCOLORS2			31
#define MUTCOLORS3			32
// Defines for whether an accessory should have one or three colors to choose for
#define USE_ONE_COLOR		31
#define USE_MATRIXED_COLORS	32
// Defines for some extra species traits
#define REVIVES_BY_HEALING	33
#define ROBOTIC_LIMBS		34
#define ROBOTIC_DNA_ORGANS	35
//Also.. yes for some reason specie traits and accessory defines are together

//Defines for processing reagents, for synths, IPC's and Vox
#define PROCESS_ORGANIC 1		//Only processes reagents with "ORGANIC" or "ORGANIC | SYNTHETIC"
#define PROCESS_SYNTHETIC 2		//Only processes reagents with "SYNTHETIC" or "ORGANIC | SYNTHETIC"

#define REAGENT_ORGANIC 1
#define REAGENT_SYNTHETIC 2

//Some defines for sprite accessories
// Which color source we're using when the accessory is added
#define DEFAULT_PRIMARY		1
#define DEFAULT_SECONDARY	2
#define DEFAULT_TERTIARY	3
#define DEFAULT_MATRIXED	4 //uses all three colors for a matrix
#define DEFAULT_SKIN_OR_PRIMARY	5 //Uses skin tone color if the character uses one, otherwise primary

// Defines for extra bits of accessories
#define COLOR_SRC_PRIMARY	1
#define COLOR_SRC_SECONDARY	2
#define COLOR_SRC_TERTIARY	3
#define COLOR_SRC_MATRIXED	4

// Defines for mutant bodyparts indexes
#define MUTANT_INDEX_NAME			"name"
#define MUTANT_INDEX_COLOR_LIST		"color"
#define MUTANT_INDEX_EMISSIVE_LIST	"emissive"

// Defines for markings indexes
#define MARKING_INDEX_COLOR 1
#define MARKING_INDEX_EMISSIVE 2

//The color list that is passed to color matrixed things when a person is husked
#define HUSK_COLOR_LIST list(list(0.64, 0.64, 0.64, 0), list(0.64, 0.64, 0.64, 0), list(0.64, 0.64, 0.64, 0), list(0, 0, 0, 1))

/// Organ slot external
#define ORGAN_SLOT_EXTERNAL_CAP "cap"
#define ORGAN_SLOT_EXTERNAL_EARS "ears_external" // I hate having to do this, hopefully I'll be able to remove this soon with an external ears refactor.
#define ORGAN_SLOT_EXTERNAL_FLUFF "fluff"
#define ORGAN_SLOT_EXTERNAL_HEAD_ACCESSORY "head_accessory"
#define ORGAN_SLOT_EXTERNAL_MOTH_MARKINGS "moth_markings"
#define ORGAN_SLOT_EXTERNAL_NECK_ACCESSORY "neck_accessory"
#define ORGAN_SLOT_EXTERNAL_SKRELL_HAIR "skrell_hair"
#define ORGAN_SLOT_EXTERNAL_SYNTH_ANTENNA "synth_antenna"
#define ORGAN_SLOT_EXTERNAL_SYNTH_SCREEN "synth_screen"
#define ORGAN_SLOT_EXTERNAL_TAUR "taur"
#define ORGAN_SLOT_EXTERNAL_XENODORSAL "xenodorsal"
#define ORGAN_SLOT_EXTERNAL_XENOHEAD "xenohead"

//Defines for an accessory to be randomed
#define ACC_RANDOM		"random"

#define MAXIMUM_MARKINGS_PER_LIMB 3

#define BODY_SIZE_NORMAL 1.00
#define BODY_SIZE_MAX 2.0
#define BODY_SIZE_MIN 0.2

//In inches
#define PENIS_MAX_GIRTH 15
#define PENIS_MIN_LENGTH 1
#define PENIS_MAX_LENGTH 128

#define TESTICLES_MIN_SIZE 0
#define TESTICLES_MAX_SIZE 3

#define SHEATH_NONE	"none"
#define SHEATH_NORMAL "sheath"
#define SHEATH_SLIT	"slit"
#define SHEATH_MODES list(SHEATH_NONE, SHEATH_NORMAL, SHEATH_SLIT)

#define MANDATORY_FEATURE_LIST list(\
	"mcolor" = "#FFFFBB",\
	"mcolor2" = "#FFFFBB",\
	"mcolor3" = "#FFFFBB",\
	"ethcolor" = "#FFCCCC",\
	"skin_color" = "#FFEEDD",\
	"flavor_text" = "",\
	"body_size" = BODY_SIZE_NORMAL,\
	"penis_taur_mode" = TRUE,\
	"genitals_use_skintone" = FALSE,\
	"has_cock" = FALSE,\
	"cock_shape" = DEF_COCK_SHAPE,\
	"cock_length" = COCK_SIZE_DEF,\
	"cock_diameter_ratio" = COCK_DIAMETER_RATIO_DEF,\
	"cock_color" = "ffffff",\
	"has_balls" = FALSE,\
	"balls_color" = "ffffff",\
	"balls_shape" = DEF_BALLS_SHAPE,\
	"balls_size" = BALLS_SIZE_DEF,\
	"balls_cum_rate" = CUM_RATE,\
	"balls_cum_mult" = CUM_RATE_MULT,\
	"balls_efficiency" = CUM_EFFICIENCY,\
	"has_breasts" = FALSE,\
	"breasts_color" = "ffffff",\
	"breasts_size" = BREASTS_SIZE_DEF,\
	"breasts_shape" = DEF_BREASTS_SHAPE,\
	"mobCanLactate" = FALSE,\
	"has_vag" = FALSE,\
	"vag_shape" = DEF_VAGINA_SHAPE,\
	"vag_color" = "ffffff",\
	"has_womb" = FALSE,\
	"has_butt" = FALSE,\
	"butt_color" = "ffffff",\
	"butt_size" = BUTT_SIZE_DEF,\
	"belly_size" = BELLY_SIZE_DEF,\
	"has_belly" = FALSE,\
	"belly_color" = "ffffff",\
	"has_anus" = FALSE,\
	"anus_color" = "ffffff",\
	"anus_shape" = DEF_ANUS_SHAPE,\
	"balls_visibility"   = GEN_VISIBLE_NO_UNDIES,\
	"breasts_visibility"= GEN_VISIBLE_NO_UNDIES,\
	"cock_visibility" = GEN_VISIBLE_NO_UNDIES,\
	"vag_visibility"   = GEN_VISIBLE_NO_UNDIES,\
	"butt_visibility"  = GEN_VISIBLE_NO_UNDIES,\
	"belly_visibility" = GEN_VISIBLE_NO_UNDIES,\
	"anus_visibility" = GEN_VISIBLE_NO_UNDIES,\
	"cock_stuffing" = FALSE,\
	"balls_stuffing" = FALSE,\
	"vag_stuffing" = FALSE,\
	"breasts_stuffing" = FALSE,\
	"butt_stuffing" = FALSE,\
	"anus_stuffing" = FALSE,\
	"belly_stuffing" = FALSE,\
	"inert_eggs" = FALSE,\
)

#define AROUSAL_CANT 0
#define AROUSAL_NONE 0
#define AROUSAL_PARTIAL 1
#define AROUSAL_FULL 1

//Species IDs. If you wanna look at tg's species ID defines, go look in the *other* DNA.dm file
#define SPECIES_AKULA "akula"
#define SPECIES_AQUATIC "aquatic"
#define SPECIES_DWARF "dwarf"
#define SPECIES_HUMANOID "humanoid"
#define SPECIES_INSECT "insect"
#define SPECIES_MAMMAL "mammal"
#define SPECIES_PODPERSON_WEAK "podweak"
#define SPECIES_SYNTH "synth"
#define SPECIES_SLIMESTART "slimeperson"	//There's already SPECIES_SLIMEPERSON in tg
#define SPECIES_SKRELL "skrell"
#define SPECIES_TAJARAN "tajaran"
#define SPECIES_UNATHI "unathi"
#define SPECIES_VOX "vox"
#define SPECIES_VOX_PRIMALIS "vox_primalis"
#define SPECIES_VULP "vulpkanin"
#define SPECIES_XENO "xeno"
#define SPECIES_GHOUL "ghoul"
#define SPECIES_TESHARI "teshari"
#define SPECIES_HEMOPHAGE "hemophage"
#define SPECIES_ARACHNID "arachnid"

#define SPECIES_MUTANT "mutant"
#define SPECIES_MUTANT_INFECTIOUS "infectious_mutant"
#define SPECIES_MUTANT_SLOW "slow_mutant"
#define SPECIES_MUTANT_FAST "fast_mutant"

// Leaving this here because it's used for bodyparts, like SPECIES_X are, but since taurs aren't a species... Named it LIMBS instead.
#define LIMBS_TAUR "taur"
