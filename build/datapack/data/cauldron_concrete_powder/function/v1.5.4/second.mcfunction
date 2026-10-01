
#> cauldron_concrete_powder:v1.5.4/second
#
# @within	cauldron_concrete_powder:v1.5.4/tick
#

# Reset timer
scoreboard players set #second cauldron_concrete_powder.data 0

# If configured, check every item in cauldrons (not only player-dropped ones) and stop here
execute if score #always_check cauldron_concrete_powder.config matches 1.. run return run function cauldron_concrete_powder:v1.5.4/check_all

# If need someone dropped, run function
execute if score #check cauldron_concrete_powder.dropped matches 1.. run function cauldron_concrete_powder:v1.5.4/check_dropped

# If a player's inventory changed, check if someone dropped an item
execute if score #inventory_changed cauldron_concrete_powder.dropped matches 1 run function cauldron_concrete_powder:v1.5.4/check_players

