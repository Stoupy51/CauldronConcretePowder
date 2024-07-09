
#> cauldron_concrete_powder:v1.1.0/load/enumerate
#
# @within	#cauldron_concrete_powder:enumerate
#

# If current major is too low, set it to the current major
execute unless score #cauldron_concrete_powder.major load.status matches 1.. run scoreboard players set #cauldron_concrete_powder.major load.status 1

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #cauldron_concrete_powder.major load.status matches 1 unless score #cauldron_concrete_powder.minor load.status matches 1.. run scoreboard players set #cauldron_concrete_powder.minor load.status 1

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #cauldron_concrete_powder.major load.status matches 1 if score #cauldron_concrete_powder.minor load.status matches 1 unless score #cauldron_concrete_powder.patch load.status matches 0.. run scoreboard players set #cauldron_concrete_powder.patch load.status 0

