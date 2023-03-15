/datum/design/rpd
	desc = "A tool that can construct and deconstruct pipes on the fly."
	build_type = AUTOLATHE | PROTOLATHE
	var/proto_category = list("Tool Designs")
	departmental_flags =  DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE // Sci as well because toxins

/datum/design/rpd/New()
	LAZYADD(category, proto_category)
	..()
