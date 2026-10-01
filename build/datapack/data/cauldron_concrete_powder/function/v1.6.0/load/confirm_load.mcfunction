
#> cauldron_concrete_powder:v1.6.0/load/confirm_load
#
# @within	cauldron_concrete_powder:v1.6.0/load/secondary
#

# Confirm load
tellraw @a[tag=convention.debug] {"text":"[Loaded Cauldron Concrete Powder v1.6.0]","color":"green"}
scoreboard players set #cauldron_concrete_powder.loaded load.status 1
function cauldron_concrete_powder:v1.6.0/load/set_items_storage

scoreboard objectives add cauldron_concrete_powder.dropped minecraft.custom:minecraft.drop
scoreboard objectives add cauldron_concrete_powder.config dummy

