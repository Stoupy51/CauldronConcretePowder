
# Seek for items in cauldrons
execute as @e[type=item,predicate=cauldron_concrete_powder:concrete_in_cauldron] if data entity @s Thrower at @s run function cauldron_concrete_powder:dry_concrete

# Remove loop check
scoreboard players reset #check cauldron_concrete_powder.dropped

