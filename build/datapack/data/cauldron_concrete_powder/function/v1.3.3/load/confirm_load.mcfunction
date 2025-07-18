
#> cauldron_concrete_powder:v1.3.3/load/confirm_load
#
# @within	cauldron_concrete_powder:v1.3.3/load/secondary
#

# Confirm load
tellraw @a[tag=convention.debug] {"text":"[Loaded Cauldron Concrete Powder v1.3.3]","color":"green"}
scoreboard players set #cauldron_concrete_powder.loaded load.status 1

scoreboard objectives add cauldron_concrete_powder.dropped minecraft.custom:minecraft.drop

