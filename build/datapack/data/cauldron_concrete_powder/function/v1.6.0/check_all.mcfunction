
#> cauldron_concrete_powder:v1.6.0/check_all
#
# @within	cauldron_concrete_powder:v1.6.0/second
#

# Seek for every item in cauldrons, no matter who dropped it
execute as @e[type=item,predicate=cauldron_concrete_powder:v1.6.0/concrete_in_cauldron] at @s run function #cauldron_concrete_powder:signals/dry_concrete

# Always return a value so the caller's "return run" stops second.mcfunction
return 1

