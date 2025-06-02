// TFF Modular: Synthetic Species Hooks for Diagnostic HUD
// This file contains the hooks to add diagnostic HUD functionality to synthetic species

/datum/species/synthetic
	/// TFF Modular: Add diagnostic HUD support
	var/tff_diag_hud_enabled = TRUE

/datum/species/synthetic/on_species_gain(mob/living/carbon/human/transformer, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	if(tff_diag_hud_enabled)
		transformer.AddElement(/datum/element/synthetic_diagnosis)

/datum/species/synthetic/on_species_loss(mob/living/carbon/human/human)
	. = ..()
	if(tff_diag_hud_enabled)
		human.RemoveElement(/datum/element/synthetic_diagnosis)
