/mob/living/carbon/human/normal
	initializeBioholder()
		. = ..()
		randomize_look(src, 1, 1, 1, 1, 1, 1, src)
		src.gender = src.bioHolder?.mobAppearance?.gender
		src.update_colorful_parts()
		set_clothing_icon_dirty()

/mob/living/carbon/human/normal/assistant
	INIT()
		..()
		JobEquipSpawned("Staff Assistant")

/mob/living/carbon/human/normal/syndicate
	INIT()
		..()
		JobEquipSpawned("Syndicate")

/mob/living/carbon/human/normal/captain
	INIT()
		..()
		JobEquipSpawned("Captain")

/mob/living/carbon/human/normal/headofpersonnel
	INIT()
		..()
		JobEquipSpawned("Head of Personnel")

/mob/living/carbon/human/normal/chiefengineer
	INIT()
		..()
		JobEquipSpawned("Chief Engineer")

/mob/living/carbon/human/normal/researchdirector
	INIT()
		..()
		JobEquipSpawned("Research Director")

/mob/living/carbon/human/normal/headofsecurity
	INIT()
		..()
		JobEquipSpawned("Head of Security")

/mob/living/carbon/human/normal/securityofficer
	INIT()
		..()
		JobEquipSpawned("Security Officer")

/mob/living/carbon/human/normal/securityassistant
	INIT()
		..()
		JobEquipSpawned("Security Assistant")

/mob/living/carbon/human/normal/detective
	INIT()
		..()
		JobEquipSpawned("Detective")

/mob/living/carbon/human/normal/clown
	INIT()
		..()
		JobEquipSpawned("Clown")

/mob/living/carbon/human/normal/chef
	INIT()
		..()
		JobEquipSpawned("Chef")

/mob/living/carbon/human/normal/chaplain
	INIT()
		..()
		JobEquipSpawned("Chaplain")

/mob/living/carbon/human/normal/bartender
	INIT()
		..()
		JobEquipSpawned("Bartender")

/mob/living/carbon/human/normal/botanist
	INIT()
		..()
		JobEquipSpawned("Botanist")

/mob/living/carbon/human/normal/rancher
	INIT()
		..()
		JobEquipSpawned("Rancher")

/mob/living/carbon/human/normal/janitor
	INIT()
		..()
		JobEquipSpawned("Janitor")

/mob/living/carbon/human/normal/mechanic
	INIT()
		..()
		JobEquipSpawned("Mechanic")

/mob/living/carbon/human/normal/engineer
	INIT()
		..()
		JobEquipSpawned("Engineer")

/mob/living/carbon/human/normal/miner
	INIT()
		..()
		JobEquipSpawned("Miner")

/mob/living/carbon/human/normal/quartermaster
	INIT()
		..()
		JobEquipSpawned("Quartermaster")

/mob/living/carbon/human/normal/medicaldoctor
	INIT()
		..()
		JobEquipSpawned("Medical Doctor")

/mob/living/carbon/human/normal/geneticist
	INIT()
		..()
		JobEquipSpawned("Geneticist")

/mob/living/carbon/human/normal/pathologist
	INIT()
		..()
		JobEquipSpawned("Pathologist")

/mob/living/carbon/human/normal/roboticist
	INIT()
		..()
		JobEquipSpawned("Roboticist")

/mob/living/carbon/human/normal/chemist
	INIT()
		..()
		JobEquipSpawned("Chemist")

/mob/living/carbon/human/normal/scientist
	INIT()
		..()
		JobEquipSpawned("Scientist")

/mob/living/carbon/human/normal/wizard
	INIT()
		..()
		JobEquipSpawned("Nanotrasen Security Operative")

/mob/living/carbon/human/normal/inspector
	New()
		..()
		JobEquipSpawned("Inspector")

/mob/living/carbon/human/normal/rescue
	INIT()
		..()
		if (src.gender && src.gender == "female")
			src.real_name = pick_string_autokey("names/wizard_female.txt")
		else
			src.real_name = pick_string_autokey("names/wizard_male.txt")

		equip_wizard(src, 1)

/mob/living/carbon/human/normal/rescue
	INIT()
		..()
		src.equip_new_if_possible(/obj/item/clothing/shoes/red, slot_shoes)
		src.equip_new_if_possible(/obj/item/clothing/under/color/red, slot_w_uniform)
		src.equip_new_if_possible(/obj/item/card/id, slot_wear_id)
		src.equip_new_if_possible(/obj/item/device/radio/headset, slot_ears)
		src.equip_new_if_possible(/obj/item/storage/belt/utility/prepared, slot_belt)
		src.equip_new_if_possible(/obj/item/storage/backpack/withO2, slot_back)
		src.equip_new_if_possible(/obj/item/device/light/flashlight, slot_l_store)
		src.equip_new_if_possible(/obj/item/clothing/suit/armor/vest, slot_wear_suit)
		src.equip_new_if_possible(/obj/item/clothing/mask/gas, slot_wear_mask)
		src.equip_new_if_possible(/obj/item/clothing/gloves/black, slot_gloves)
		src.equip_new_if_possible(/obj/item/clothing/glasses/nightvision, slot_glasses)

		var/obj/item/card/id/C = src.wear_id
		if(C)
			C.registered = src.real_name
			C.assignment = "NT-SO Rescue Worker"
			C.name = "[C.registered]'s ID Card ([C.assignment])"
			C.access = get_all_accesses()

		update_clothing()

/mob/living/carbon/human/normal/ntso_old
	New()
		..()
		src.equip_new_if_possible(/obj/item/clothing/shoes/swat, slot_shoes)
		src.equip_new_if_possible(/obj/item/clothing/under/misc/NT, slot_w_uniform)
		src.equip_new_if_possible(/obj/item/card/id, slot_wear_id)
		src.equip_new_if_possible(/obj/item/device/radio/headset/command/captain, slot_ears)
		src.equip_new_if_possible(/obj/item/storage/belt/security, slot_belt)
		src.equip_new_if_possible(/obj/item/storage/backpack/NT, slot_back)
		src.equip_new_if_possible(/obj/item/clothing/glasses/nightvision, slot_l_store)
		src.equip_new_if_possible(/obj/item/crowbar, slot_r_store)
		src.equip_new_if_possible(/obj/item/clothing/suit/armor/NT_alt, slot_wear_suit)
		src.equip_new_if_possible(/obj/item/clothing/mask/gas/swat, slot_wear_mask)
		src.equip_new_if_possible(/obj/item/clothing/head/NTberet, slot_head)
		src.equip_new_if_possible(/obj/item/clothing/gloves/black, slot_gloves)
		src.equip_new_if_possible(/obj/item/clothing/glasses/sunglasses/sechud, slot_glasses)

		var/obj/item/card/id/C = src.wear_id
		if(C)
			C.registered = src.real_name
			C.assignment = "NT-SO Special Operative"
			C.name = "[C.registered]'s ID Card ([C.assignment])"
			var/list/ntso_access = get_all_accesses()
			ntso_access += access_maxsec // This makes sense, right? They're highly trained and trusted.
			C.access = ntso_access

		update_clothing()
