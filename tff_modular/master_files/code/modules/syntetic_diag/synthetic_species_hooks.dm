// TFF Modular: Synthetic Species Hooks for Diagnostic HUD
// This file contains the hooks to add diagnostic HUD functionality to synthetic species

#define SPECIES_TRAIT "species"

/datum/species/synthetic
	/// TFF Modular: Add diagnostic HUD support
	var/tff_diag_hud_enabled = TRUE

/datum/species/synthetic/on_species_gain(mob/living/carbon/human/transformer, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	if(tff_diag_hud_enabled)
		transformer.AddElement(/datum/element/synthetic_diagnosis)
		// Ensure HUD is updated immediately
		var/datum/atom_hud/data/diagnostic/diag_hud = GLOB.huds[DATA_HUD_DIAGNOSTIC]
		if(diag_hud)
			diag_hud.add_to_hud(transformer)

/datum/species/synthetic/on_species_loss(mob/living/carbon/human/human)
	. = ..()
	if(tff_diag_hud_enabled)
		human.RemoveElement(/datum/element/synthetic_diagnosis)
		// Ensure HUD is removed immediately
		var/datum/atom_hud/data/diagnostic/diag_hud = GLOB.huds[DATA_HUD_DIAGNOSTIC]
		if(diag_hud)
			diag_hud.remove_from_hud(human)

#undef SPECIES_TRAIT
