
#> cauldron_concrete_powder:v1.5.0/second
#
# @within	cauldron_concrete_powder:v1.5.0/tick
#

# Reset timer
scoreboard players set #second cauldron_concrete_powder.data 0

# If need someone dropped, run function
execute if score #check cauldron_concrete_powder.dropped matches 1.. run function cauldron_concrete_powder:v1.5.0/check_dropped

# Reset player dropped score and turn #check to 1 or more
execute store result score #check cauldron_concrete_powder.dropped run scoreboard players reset @a[scores={cauldron_concrete_powder.dropped=1..}] cauldron_concrete_powder.dropped

