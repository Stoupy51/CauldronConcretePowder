
#> cauldron_concrete_powder:v1.3.2/dry_concrete
#
# @within	cauldron_concrete_powder:v1.3.2/check_dropped
#

# Switch case
scoreboard players set #success cauldron_concrete_powder.dropped 0
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents white_concrete_powder run data modify entity @s Item.id set value "minecraft:white_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents orange_concrete_powder run data modify entity @s Item.id set value "minecraft:orange_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents magenta_concrete_powder run data modify entity @s Item.id set value "minecraft:magenta_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents light_blue_concrete_powder run data modify entity @s Item.id set value "minecraft:light_blue_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents yellow_concrete_powder run data modify entity @s Item.id set value "minecraft:yellow_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents lime_concrete_powder run data modify entity @s Item.id set value "minecraft:lime_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents pink_concrete_powder run data modify entity @s Item.id set value "minecraft:pink_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents gray_concrete_powder run data modify entity @s Item.id set value "minecraft:gray_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents light_gray_concrete_powder run data modify entity @s Item.id set value "minecraft:light_gray_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents cyan_concrete_powder run data modify entity @s Item.id set value "minecraft:cyan_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents purple_concrete_powder run data modify entity @s Item.id set value "minecraft:purple_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents blue_concrete_powder run data modify entity @s Item.id set value "minecraft:blue_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents brown_concrete_powder run data modify entity @s Item.id set value "minecraft:brown_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents green_concrete_powder run data modify entity @s Item.id set value "minecraft:green_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents red_concrete_powder run data modify entity @s Item.id set value "minecraft:red_concrete"
execute if score #success cauldron_concrete_powder.dropped matches 0 store success score #success cauldron_concrete_powder.dropped if items entity @s contents black_concrete_powder run data modify entity @s Item.id set value "minecraft:black_concrete"

# If success, remove water
execute if score #success cauldron_concrete_powder.dropped matches 1 store result score #count cauldron_concrete_powder.dropped run data get entity @s Item.count
execute if score #success cauldron_concrete_powder.dropped matches 1 if score #count cauldron_concrete_powder.dropped matches 16.. run function cauldron_concrete_powder:v1.3.2/remove_water

# Reset success and count
scoreboard players reset #success cauldron_concrete_powder.dropped
scoreboard players reset #count cauldron_concrete_powder.dropped

