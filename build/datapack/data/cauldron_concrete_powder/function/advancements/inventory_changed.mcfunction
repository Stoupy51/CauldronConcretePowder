
#> cauldron_concrete_powder:advancements/inventory_changed
#
# @executed	as the player & at current position
#
# @within	advancement cauldron_concrete_powder:inventory_changed
#

advancement revoke @s only cauldron_concrete_powder:inventory_changed
scoreboard players set #inventory_changed cauldron_concrete_powder.dropped 1

