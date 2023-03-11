
# If need someone dropped, run function
execute if score #check cauldron_concrete_powder.dropped matches 1.. run function cauldron_concrete_powder:check_dropped

# Reset player dropped score and turn #check to 1
execute as @a[scores={cauldron_concrete_powder.dropped=1..}] run function cauldron_concrete_powder:player_dropped

# Loop again
schedule function cauldron_concrete_powder:1s_loop 1s replace

