
#> cauldron_concrete_powder:v1.3.2/check_dropped
#
# @within	cauldron_concrete_powder:v1.3.2/second
#

# Seek for items in cauldrons
execute as @e[type=item,predicate=cauldron_concrete_powder:v1.3.2/concrete_in_cauldron] if data entity @s Thrower at @s run function cauldron_concrete_powder:v1.3.2/dry_concrete

# Remove loop check
scoreboard players reset #check cauldron_concrete_powder.dropped

