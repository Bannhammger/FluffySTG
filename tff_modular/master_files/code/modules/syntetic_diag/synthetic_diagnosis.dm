// TFF Modular: Synthetic Species Diagnostic HUD
// This element adds diagnostic HUD functionality to synthetic species

/datum/element/synthetic_diagnosis
	var/static/list/diag_hud_users = list()

/datum/element/synthetic_diagnosis/Attach(mob/living/carbon/human/target)
	. = ..()
	if(!ishuman(target) || !target.dna?.species || target.dna.species.id != SPECIES_SYNTH)
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_HUMAN_LIFE, PROC_REF(on_life))
	RegisterSignal(target, COMSIG_LIVING_DEATH, PROC_REF(on_death))
	RegisterSignal(target, COMSIG_LIVING_REVIVE, PROC_REF(on_revive))

	var/datum/atom_hud/data/diagnostic/diag_hud = GLOB.huds[DATA_HUD_DIAGNOSTIC]
	diag_hud.add_atom_to_hud(target)
	diag_hud_users += target
	update_synth_hud(target)

/datum/element/synthetic_diagnosis/Detach(mob/living/carbon/human/source)
	. = ..()
	UnregisterSignal(source, list(COMSIG_HUMAN_LIFE, COMSIG_LIVING_DEATH, COMSIG_LIVING_REVIVE))

	var/datum/atom_hud/data/diagnostic/diag_hud = GLOB.huds[DATA_HUD_DIAGNOSTIC]
	diag_hud.remove_atom_from_hud(source)
	diag_hud_users -= source

/datum/element/synthetic_diagnosis/proc/on_life(mob/living/carbon/human/source)
	SIGNAL_HANDLER
	update_synth_hud(source)

/datum/element/synthetic_diagnosis/proc/on_death(mob/living/carbon/human/source)
	SIGNAL_HANDLER
	update_synth_hud(source)

/datum/element/synthetic_diagnosis/proc/on_revive(mob/living/carbon/human/source)
	SIGNAL_HANDLER
	update_synth_hud(source)

/datum/element/synthetic_diagnosis/proc/update_synth_hud(mob/living/carbon/human/synth)
	if(!synth?.hud_list?[DIAG_HUD])
		return

	var/image/holder = synth.hud_list[DIAG_HUD]
	if(synth.stat == DEAD)
		holder.icon_state = "huddiagdead"
		return

	// Get health percentage
	var/health_percent = synth.health / synth.maxHealth * 100
	// Get nutrition/charge percentage (synths use nutrition as charge)
	var/charge_percent = synth.nutrition / NUTRITION_LEVEL_WELL_FED * 100

	// Clear previous overlays
	holder.overlays.Cut()

	// Set base icon state based on health
	if(health_percent >= 80)
		holder.icon_state = "huddiagfull"
	else if(health_percent >= 40)
		holder.icon_state = "huddiagmed"
	else
		holder.icon_state = "huddiagcrit"

	// Add charge indicator overlay
	var/image/charge_overlay = image('icons/mob/huds/hud.dmi', synth, "huddiag_power")
	charge_overlay.alpha = charge_percent * 255 / 100
	holder.overlays += charge_overlay

	// Add warning overlay for low charge
	if(charge_percent < 50)
		var/image/warning_overlay = image('icons/mob/huds/hud.dmi', synth, "huddiag_lowpower")
		warning_overlay.alpha = 180
		holder.overlays += warning_overlay
