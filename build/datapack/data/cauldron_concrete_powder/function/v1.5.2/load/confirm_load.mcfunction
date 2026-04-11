
#> cauldron_concrete_powder:v1.5.2/load/confirm_load
#
# @within	cauldron_concrete_powder:v1.5.2/load/secondary
#

# Confirm load
tellraw @a[tag=convention.debug] {"text":"[Loaded Cauldron Concrete Powder v1.5.2]","color":"green"}
scoreboard players set #cauldron_concrete_powder.loaded load.status 1
function cauldron_concrete_powder:v1.5.2/load/set_items_storage

scoreboard objectives add cauldron_concrete_powder.dropped minecraft.custom:minecraft.drop

