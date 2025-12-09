
# ruff: noqa: E501
# Imports
from stewbeet import Context, JsonDict, Predicate, json_dump, write_load_file, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	# Add scoreboard objective in confirm_load
	write_load_file(f"scoreboard objectives add {ns}.dropped minecraft.custom:minecraft.drop")

	# Write second function
	write_versioned_function("second", f"""
# If need someone dropped, run function
execute if score #check {ns}.dropped matches 1.. run function {ns}:v{version}/check_dropped

# Reset player dropped score and turn #check to 1 or more
execute store result score #check {ns}.dropped run scoreboard players reset @a[scores={{{ns}.dropped=1..}}] {ns}.dropped
""")

	# Write check_dropped function
	write_versioned_function("check_dropped", f"""
# Seek for items in cauldrons
execute as @e[type=item,predicate={ns}:v{version}/concrete_in_cauldron] if data entity @s Thrower at @s run function {ns}:v{version}/dry_concrete

# Remove loop check
scoreboard players reset #check {ns}.dropped
""")

	# Write concrete_in_cauldron predicate
	json_content: JsonDict = {"condition": "minecraft:entity_properties","entity": "this","predicate": {"location": {"block": {"blocks": "minecraft:water_cauldron"}}}}
	predicate = Predicate(json_content)
	predicate.encoder = lambda x: json_dump(x, max_level=-1)
	ctx.data[ns].predicates[f"v{version}/concrete_in_cauldron"] = predicate

	# Write dry_concrete function
	colors: list[str] = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"]
	successes: str = "\n".join([f'execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if items entity @s contents {color}_concrete_powder run data modify entity @s Item.id set value "minecraft:{color}_concrete"' for color in colors])
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
""")

	# Write remove_water function
	write_versioned_function("remove_water", f"""
scoreboard players set #success {ns}.dropped 0
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=3] run setblock ~ ~ ~ water_cauldron[level=2]
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=2] run setblock ~ ~ ~ water_cauldron[level=1]
execute if score #success {ns}.dropped matches 0 store success score #success {ns}.dropped if block ~ ~ ~ water_cauldron[level=1] run setblock ~ ~ ~ cauldron
""")

