//Cyberpunk PI Costume - Sprites from Eris, slightly modified
/obj/item/clothing/under/costume/cybersleek
	name = "sleek modern coat"
	desc = "A modern-styled coat typically worn on more urban planets, made with a neo-laminated fiber lining."
	icon = 'modular_nova/master_files/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/uniform.dmi'
	icon_state = "cyberpunksleek"
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	supports_variations_flags = NONE
	can_adjust = FALSE
	supports_variations_flags = CLOTHING_DIGITIGRADE_MASK

/obj/item/clothing/under/costume/cybersleek/long
	name = "long modern coat"
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	icon_state = "cyberpunksleek_long"
//End Cyberpunk PI port

/obj/item/clothing/under/maid_costume
	name = "maid costume"
	desc = "Maid in China."
	female_sprite_flags = FEMALE_UNIFORM_TOP_ONLY
	icon = 'icons/map_icons/clothing/under/_under.dmi'
	icon_state = "/obj/item/clothing/under/maid_costume"
	post_init_icon_state = "maid_costume"
	greyscale_config = /datum/greyscale_config/maid_costume
	greyscale_config_worn = /datum/greyscale_config/maid_costume/worn
	greyscale_colors = "#7b9ab5#edf9ff"
	flags_1 = IS_PLAYER_COLORABLE_1
