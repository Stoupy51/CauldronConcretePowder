
# ruff: noqa: E501
# Imports
import stouputils as stp
from stewbeet import Advancement, Context, JsonDict, Predicate, set_json_encoder, write_function, write_load_file, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	# Add scoreboard objectives in confirm_load
	write_load_file(f"scoreboard objectives add {ns}.dropped minecraft.custom:minecraft.drop")
	write_load_file(f"scoreboard objectives add {ns}.config dummy")

	# Write second function
	write_versioned_function("second", f"""
# If configured, check every item in cauldrons (not only player-dropped ones) and stop here
execute if score #always_check {ns}.config matches 1.. run return run function {ns}:v{version}/check_all

# If need someone dropped, run function
execute if score #check {ns}.dropped matches 1.. run function {ns}:v{version}/check_dropped

# If a player's inventory changed, check if someone dropped an item
execute if score #inventory_changed {ns}.dropped matches 1 run function {ns}:v{version}/check_players
""")

	# Write check_players function
	write_versioned_function("check_players", f"""
# Reset inventory changed flag
scoreboard players reset #inventory_changed {ns}.dropped

# Reset player dropped score and turn #check to 1 or more
execute store result score #check {ns}.dropped run scoreboard players reset @a[scores={{{ns}.dropped=1..}}] {ns}.dropped
""")

	# Write inventory_changed advancement (avoids running the @a selector every second)
	adv_json: JsonDict = {
		"criteria": {"requirement": {"trigger": "minecraft:inventory_changed"}},
		"rewards": {"function": f"{ns}:advancements/inventory_changed"}
	}
	ctx.data[f"{ns}:inventory_changed"] = set_json_encoder(Advancement(adv_json), max_level=-1)
	write_function(f"{ns}:advancements/inventory_changed", f"""
advancement revoke @s only {ns}:inventory_changed
scoreboard players set #inventory_changed {ns}.dropped 1
""")

	# Write check_dropped function
	write_versioned_function("check_dropped", f"""
# Seek for items in cauldrons
execute as @e[type=item,predicate={ns}:v{version}/concrete_in_cauldron] if data entity @s Thrower at @s run function #{ns}:signals/dry_concrete

# Remove loop check
scoreboard players reset #check {ns}.dropped
""")

	# Write check_all function (used when #always_check is enabled)
	write_versioned_function("check_all", f"""
# Seek for every item in cauldrons, no matter who dropped it
execute as @e[type=item,predicate={ns}:v{version}/concrete_in_cauldron] at @s run function #{ns}:signals/dry_concrete
""")

	# Write concrete_in_cauldron predicate
	json_content: JsonDict = {"type": "minecraft:entity_properties","entity": "this","predicate": {"location": {"block": {"blocks": "minecraft:water_cauldron"}}}}
	predicate = Predicate(json_content)
	predicate.encoder = lambda x: stp.json_dump(x, max_level=-1)
	ctx.data[ns].predicates[f"v{version}/concrete_in_cauldron"] = predicate

	# Write dry_concrete function
	colors: list[str] = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"]
	successes: str = "\n".join([f'execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if items entity @s contents minecraft:{color}_concrete_powder run data modify entity @s Item.id set value "minecraft:{color}_concrete"' for color in colors])
	write_versioned_function("dry_concrete", f"""
# Switch case
scoreboard players set #success {ns}.dropped 0
{successes}

# If success, remove water
execute if score #success {ns}.dropped matches 1 store result score #count {ns}.dropped run data get entity @s Item.count
execute if score #success {ns}.dropped matches 1 if score #count {ns}.dropped matches 16.. run function {ns}:v{version}/remove_water

# Reset success and count
scoreboard players reset #success {ns}.dropped
scoreboard players reset #count {ns}.dropped
""", tags=[f"{ns}:signals/dry_concrete"])

	# Write remove_water function
	write_versioned_function("remove_water", f"""
scoreboard players set #success {ns}.dropped 0
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=3] run setblock ~ ~ ~ water_cauldron[level=2]
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=2] run setblock ~ ~ ~ water_cauldron[level=1]
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=1] run setblock ~ ~ ~ cauldron
""")

