
#> cauldron_concrete_powder:v1.1.0/load/main
#
# @within	cauldron_concrete_powder:v1.1.0/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #cauldron_concrete_powder.loaded load.status matches 1 run function cauldron_concrete_powder:v1.1.0/load/secondary

