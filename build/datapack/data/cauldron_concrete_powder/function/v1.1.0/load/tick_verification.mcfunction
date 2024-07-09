
#> cauldron_concrete_powder:v1.1.0/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #cauldron_concrete_powder.major load.status matches 1 if score #cauldron_concrete_powder.minor load.status matches 1 if score #cauldron_concrete_powder.patch load.status matches 0 run function cauldron_concrete_powder:v1.1.0/tick

