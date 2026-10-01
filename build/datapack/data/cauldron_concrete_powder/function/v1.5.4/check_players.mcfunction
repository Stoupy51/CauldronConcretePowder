
#> cauldron_concrete_powder:v1.5.4/check_players
#
# @within	cauldron_concrete_powder:v1.5.4/second
#

# Reset inventory changed flag
scoreboard players reset #inventory_changed cauldron_concrete_powder.dropped

# Reset player dropped score and turn #check to 1 or more
execute store result score #check cauldron_concrete_powder.dropped run scoreboard players reset @a[scores={cauldron_concrete_powder.dropped=1..}] cauldron_concrete_powder.dropped

