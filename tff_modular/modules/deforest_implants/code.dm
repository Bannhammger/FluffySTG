//Cyberpunk implants can be bought only from restricted consoles
/datum/supply_pack/companies/deforest/cyber_implants

//And emag-cyberdeck only from contraband. Still easy to get.
/datum/supply_pack/companies/deforest/cyber_implants/hackerman
	contraband = TRUE

//No free emag from RnD.
/datum/design/cyberimp_hackerman
	category = list(
		RND_CATEGORY_SYNDICATE
	)
