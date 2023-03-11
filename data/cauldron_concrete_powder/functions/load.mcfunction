
# Set loaded version and display message to players with convention.debug tag
scoreboard players set CauldronConcretePowder load.status 100
tellraw @a[tag=convention.debug] {"text":"[Loaded Cauldron Concrete Powder v1.0.0]","italic":false,"color":"green"}

# Scoreboard objectives
scoreboard objectives add cauldron_concrete_powder.dropped minecraft.custom:minecraft.drop

# Start loop
schedule function cauldron_concrete_powder:1s_loop 1s replace

