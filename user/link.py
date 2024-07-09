
# Imports
from python_datapack.constants import *
from python_datapack.utils.print import *
from python_datapack.utils.io import *
from config import *
import requests

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	functions_path: str = f"{config['build_datapack']}/data/{namespace}/function/v{version}"
	predicates_path: str = f"{config['build_datapack']}/data/{namespace}/predicate/v{version}"

	# Add scoreboard objective in confirm_load
	write_to_file(f"{functions_path}/load/confirm_load.mcfunction", f"scoreboard objectives add {namespace}.dropped minecraft.custom:minecraft.drop")

	# Write second function
	write_to_file(f"{functions_path}/second.mcfunction", f"""
# If need someone dropped, run function
execute if score #check {namespace}.dropped matches 1.. run function {namespace}:v{version}/check_dropped

# Reset player dropped score and turn #check to 1 or more
execute store result score #check {namespace}.dropped run scoreboard players reset @a[scores={{{namespace}.dropped=1..}}] {namespace}.dropped
""")
	
	# Write check_dropped function
	write_to_file(f"{functions_path}/check_dropped.mcfunction", f"""
# Seek for items in cauldrons
execute as @e[type=item,predicate={namespace}:v{version}/concrete_in_cauldron] if data entity @s Thrower at @s run function {namespace}:v{version}/dry_concrete

# Remove loop check
scoreboard players reset #check {namespace}.dropped
""")
	
	# Write concrete_in_cauldron predicate
	json_content: dict = {"condition": "minecraft:entity_properties","entity": "this","predicate": {"location": {"block": {"blocks": "minecraft:water_cauldron"}}}}
	write_to_file(f"{predicates_path}/concrete_in_cauldron.json", super_json_dump(json_content, max_level = -1))
	
	# Write dry_concrete function
	colors: list[str] = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"]
	successes: str = "\n".join([f'execute if score #success {namespace}.dropped matches 0 store success score #success {namespace}.dropped if items entity @s contents {color}_concrete_powder run data modify entity @s Item.id set value "minecraft:{color}_concrete"' for color in colors])
	write_to_file(f"{functions_path}/dry_concrete.mcfunction", f"""
# Switch case
scoreboard players set #success {namespace}.dropped 0
{successes}

# If success, remove water
execute if score #success {namespace}.dropped matches 1 store result score #count {namespace}.dropped run data get entity @s Item.Count
execute if score #success {namespace}.dropped matches 1 if score #count {namespace}.dropped matches 16.. run function {namespace}:v{version}/remove_water

# Reset success and count
scoreboard players reset #success {namespace}.dropped
scoreboard players reset #count {namespace}.dropped
""")
	
	# Write remove_water function
	write_to_file(f"{functions_path}/remove_water.mcfunction", f"""
scoreboard players set #success {namespace}.dropped 0
execute if score #success {namespace}.dropped matches 0 store success score #success {namespace}.dropped if block ~ ~ ~ water_cauldron[level=3] run setblock ~ ~ ~ water_cauldron[level=2]
execute if score #success {namespace}.dropped matches 0 store success score #success {namespace}.dropped if block ~ ~ ~ water_cauldron[level=2] run setblock ~ ~ ~ water_cauldron[level=1]
execute if score #success {namespace}.dropped matches 0 store success score #success {namespace}.dropped if block ~ ~ ~ water_cauldron[level=1] run setblock ~ ~ ~ cauldron
""")

