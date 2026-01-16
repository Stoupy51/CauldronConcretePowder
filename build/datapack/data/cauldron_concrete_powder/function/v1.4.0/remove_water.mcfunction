
#> cauldron_concrete_powder:v1.4.0/remove_water
#
# @within	cauldron_concrete_powder:v1.4.0/dry_concrete
#

scoreboard players set #success cauldron_concrete_powder.dropped 0
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if block ~ ~ ~ water_cauldron[level=3] run setblock ~ ~ ~ water_cauldron[level=2]
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if block ~ ~ ~ water_cauldron[level=2] run setblock ~ ~ ~ water_cauldron[level=1]
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if block ~ ~ ~ water_cauldron[level=1] run setblock ~ ~ ~ cauldron

