
#> cauldron_concrete_powder:v1.4.0/load/resolve
#
# @within	#cauldron_concrete_powder:resolve
#

# If correct version, load the datapack
execute if score #cauldron_concrete_powder.major load.status matches 1 if score #cauldron_concrete_powder.minor load.status matches 4 if score #cauldron_concrete_powder.patch load.status matches 0 run function cauldron_concrete_powder:v1.4.0/load/main

