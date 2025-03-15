
#> cauldron_concrete_powder:v1.3.1/tick
#
# @within	cauldron_concrete_powder:v1.3.1/load/tick_verification
#

# Timers
scoreboard players add #second cauldron_concrete_powder.data 1
execute if score #second cauldron_concrete_powder.data matches 20.. run function cauldron_concrete_powder:v1.3.1/second

