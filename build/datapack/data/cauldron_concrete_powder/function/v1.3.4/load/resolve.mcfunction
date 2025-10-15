
#> cauldron_concrete_powder:v1.3.4/load/resolve
#
# @within	#cauldron_concrete_powder:resolve
#

# If correct version, load the datapack
execute if score #cauldron_concrete_powder.major load.status matches 1 if score #cauldron_concrete_powder.minor load.status matches 3 if score #cauldron_concrete_powder.patch load.status matches 4 run function cauldron_concrete_powder:v1.3.4/load/main

